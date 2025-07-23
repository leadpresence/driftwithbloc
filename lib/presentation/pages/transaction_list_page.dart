import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:transaction_app/core/di/dependecy_injection.dart';
import 'package:transaction_app/presentation/bloc/transction_event.dart';
import 'package:transaction_app/presentation/widgets/date_range_picker.dart';
import 'dart:developer' as developer;
import '../../domain/models/transaction_model.dart';
import '../bloc/transaction_bloc.dart';
import '../bloc/transaction_state.dart';
import '../widgets/transaction_list_item.dart';
import '../widgets/transaction_summary_card.dart';

class TransactionListPage extends StatelessWidget {
  const TransactionListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TransactionBloc>()..add(const LoadTransactions()),
      child: const TransactionListView(),
    );
  }
}

class TransactionListView extends StatefulWidget {
  const TransactionListView({super.key});

  @override
  State<TransactionListView> createState() => _TransactionListViewState();
}

class _TransactionListViewState extends State<TransactionListView> {
  DateTime? _startDate;
  DateTime? _endDate;
  bool _showSummary = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: _showDateRangePicker,
            icon: const Icon(Icons.date_range),
            tooltip: 'Filter by date range',
          ),
          IconButton(
            onPressed: _toggleSummaryView,
            icon: Icon(_showSummary ? Icons.list : Icons.analytics),
            tooltip: _showSummary ? 'Show list' : 'Show summary',
          ),
          IconButton(
            onPressed: _refreshTransactions,
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: BlocConsumer<TransactionBloc, TransactionState>(
        listener: (context, state) {
          if (state is TransactionError) {
            developer.log('Transaction error: ${state.message}', name: 'TransactionListPage');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: ${state.message}'),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.fixed,
                action: SnackBarAction(
                  label: 'Retry',
                  onPressed: _refreshTransactions,
                ),
              ),
            );
          } else if (state is TransactionCreated) {
            developer.log('Transaction created with id: ${state.transactionId}', name: 'TransactionListPage');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Transaction created successfully (ID: ${state.transactionId})'),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.fixed,
              ),
            );
          } else if (state is TransactionDeleted) {
            developer.log('Transaction deleted successfully', name: 'TransactionListPage');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Transaction deleted successfully'),
                backgroundColor: Colors.orange,
                behavior: SnackBarBehavior.fixed,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is TransactionLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is TransactionSummaryLoaded && _showSummary) {
            return _buildSummaryView(state.summary);
          }

          if (state is TransactionLoaded) {
            return _buildTransactionList(state.transactions);
          }

          if (state is TransactionError) {
            return _buildErrorView(state.message);
          }

          return _buildEmptyView();
        },
      ),
      floatingActionButton: _buildFloatingActionButtons(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildTransactionList(List<Transaction> transactions) {
    if (transactions.isEmpty) {
      return _buildEmptyView();
    }

    return Column(
      children: [
        if (_startDate != null || _endDate != null) _buildDateRangeChip(),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async => _refreshTransactions(),
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return TransactionListItem(
                  transaction: transaction,
                  onTap: () => _showTransactionDetails(transaction),
                  onDelete: () => _deleteTransaction(index + 1), // Assuming ID is index + 1
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryView(TransactionModel summary) {
    return Column(
      children: [
        if (_startDate != null || _endDate != null) _buildDateRangeChip(),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: TransactionSummaryCard(summary: summary),
          ),
        ),
      ],
    );
  }

  Widget _buildDateRangeChip() {
    final startDateStr = _startDate != null 
        ? DateFormat('MMM dd, yyyy').format(_startDate!) 
        : 'Start';
    final endDateStr = _endDate != null 
        ? DateFormat('MMM dd, yyyy').format(_endDate!) 
        : 'End';

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Chip(
        label: Text('$startDateStr - $endDateStr'),
        deleteIcon: const Icon(Icons.close),
        onDeleted: _clearDateRange,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      ),
    );
  }

  Widget _buildErrorView(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red.shade300,
            ),
            const SizedBox(height: 16),
            Text(
              'Error',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _refreshTransactions,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              'No Transactions',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'No transactions found. Use the floating action buttons to add test transactions.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  void _showDateRangePicker() {

    // Store the bloc reference before showing the dialog
    final transactionBloc = context.read<TransactionBloc>();
    showDialog(
      context: context,
      builder: (context) => DateRangePickerWidget(
        initialStartDate: _startDate,
        initialEndDate: _endDate,
        onDateRangeSelected: (startDate, endDate) {
          developer.log('Date range selected: $startDate to $endDate', name: 'TransactionListPage');
          setState(() {
            _startDate = startDate;
            _endDate = endDate;
          });
          
          if (startDate != null) {
            if (_showSummary) {
              transactionBloc.add(
                LoadTransactionSummary(
                  startDate: startDate,
                  endDate: endDate,
                ),
              );
            } else {
              transactionBloc.add(
                LoadTransactionsByDateRange(
                  startDate: startDate,
                  endDate: endDate,
                ),
              );
            }
          }
        },
      ),
    );
  }

  void _toggleSummaryView() {
    setState(() {
      _showSummary = !_showSummary;
    });

    if (_showSummary) {
      final startDate = _startDate ?? DateTime.now().subtract(const Duration(days: 30));
      final endDate = _endDate ?? DateTime.now();
      
      context.read<TransactionBloc>().add(
        LoadTransactionSummary(
          startDate: startDate,
          endDate: endDate,
        ),
      );
    } else {
      _refreshTransactions();
    }
  }

  void _refreshTransactions() {
    developer.log('Refreshing transactions', name: 'TransactionListPage');
    
    if (_startDate != null) {
      if (_showSummary) {
        context.read<TransactionBloc>().add(
          LoadTransactionSummary(
            startDate: _startDate!,
            endDate: _endDate,
          ),
        );
      } else {
        context.read<TransactionBloc>().add(
          LoadTransactionsByDateRange(
            startDate: _startDate!,
            endDate: _endDate,
          ),
        );
      }
    } else {
      context.read<TransactionBloc>().add(const LoadTransactions());
    }
  }

  void _clearDateRange() {
    developer.log('Clearing date range filter', name: 'TransactionListPage');
    setState(() {
      _startDate = null;
      _endDate = null;
    });
    
    if (_showSummary) {
      final now = DateTime.now();
      final monthAgo = now.subtract(const Duration(days: 30));
      context.read<TransactionBloc>().add(
        LoadTransactionSummary(
          startDate: monthAgo,
          endDate: now,
        ),
      );
    } else {
      context.read<TransactionBloc>().add(const LoadTransactions());
    }
  }

  void _createMockTransaction(bool isSuccess) {
    developer.log('Creating mock ${isSuccess ? 'success' : 'failed'} transaction', name: 'TransactionListPage');
    
    if (isSuccess) {
      context.read<TransactionBloc>().add(const CreateMockSuccessTransaction());
    } else {
      context.read<TransactionBloc>().add(const CreateMockFailedTransaction());
    }
  }

  void _showTransactionDetails(Transaction transaction) {
    developer.log('Showing transaction details', name: 'TransactionListPage');
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:const Text('Transaction Details'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow('Amount', transaction.amount ?? 'N/A'),
              _buildDetailRow('Status', transaction.status == true ? 'SUCCESS' : 'FAILED'),
              _buildDetailRow('RRN', transaction.rRN ?? 'N/A'),
              _buildDetailRow('STAN', transaction.sTAN ?? 'N/A'),
              _buildDetailRow('Response Code', transaction.respCode ?? 'N/A'),
              _buildDetailRow('Response Message', transaction.responseMessage ?? 'N/A'),
              _buildDetailRow('Transaction Type', transaction.transactionType ?? 'N/A'),
              _buildDetailRow('Terminal ID', transaction.terminalId ?? 'N/A'),
              _buildDetailRow('Transaction Date', transaction.transactionDate ?? 'N/A'),
              _buildDetailRow('Transaction Time', transaction.transactionTime ?? 'N/A'),
              if (transaction.institutionData?.merchantName != null)
                _buildDetailRow('Merchant', transaction.institutionData!.merchantName!),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButtons() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 56,
            height: 56,
            child: FloatingActionButton(
              onPressed: () => _createMockTransaction(true),
              backgroundColor: Colors.green,
              heroTag: 'success_fab',
              tooltip: 'Add Success Transaction',
              child: const Icon(Icons.check, color: Colors.white),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: 56,
            height: 56,
            child: FloatingActionButton(
              onPressed: () => _createMockTransaction(false),
              backgroundColor: Colors.red,
              heroTag: 'failed_fab',
              tooltip: 'Add Failed Transaction',
              child: const Icon(Icons.close, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  void _deleteTransaction(int id) {
    developer.log('Deleting transaction with id: $id', name: 'TransactionListPage');
    final transactionBloc = context.read<TransactionBloc>();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Transaction'),
        content: const Text('Are you sure you want to delete this transaction?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              transactionBloc.add(DeleteTransaction(id: id));
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}