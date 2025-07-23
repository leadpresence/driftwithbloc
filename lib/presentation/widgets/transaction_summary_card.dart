import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/models/transaction_model.dart';

class TransactionSummaryCard extends StatelessWidget {
  final TransactionModel summary;

  const TransactionSummaryCard({
    super.key,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    final transactions = summary.allTransaction ?? [];
    final successfulTransactions = transactions.where((t) => t.status == true).length;
    final failedTransactions = transactions.where((t) => t.status == false).length;
    final totalTransactions = transactions.length;

    final totalSuccessAmount = summary.totalSuccessAmount ?? 0;
    final totalFailedAmount = summary.totalFailedAmount ?? 0;
    final totalTransactionAmount = summary.totalTransactionAmount ?? 0;

    final successRate = totalTransactions > 0 
        ? (successfulTransactions / totalTransactions * 100) 
        : 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Transaction Summary',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        
        // Overview Cards
        Row(
          children: [
            Expanded(
              child: _buildSummaryCard(
                context,
                'Total Transactions',
                totalTransactions.toString(),
                Icons.receipt_long,
                Colors.blue,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildSummaryCard(
                context,
                'Success Rate',
                '${successRate.toStringAsFixed(1)}%',
                Icons.trending_up,
                Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Transaction Count Cards
        Row(
          children: [
            Expanded(
              child: _buildSummaryCard(
                context,
                'Successful',
                successfulTransactions.toString(),
                Icons.check_circle,
                Colors.green,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildSummaryCard(
                context,
                'Failed',
                failedTransactions.toString(),
                Icons.cancel,
                Colors.red,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Amount Summary
        Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Amount Summary',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _buildAmountRow(
                  'Total Amount',
                  totalTransactionAmount,
                  Colors.blue.shade700,
                  isTotal: true,
                ),
                const Divider(),
                _buildAmountRow(
                  'Successful Transactions',
                  totalSuccessAmount,
                  Colors.green.shade700,
                ),
                const SizedBox(height: 8),
                _buildAmountRow(
                  'Failed Transactions',
                  totalFailedAmount,
                  Colors.red.shade700,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Transaction Type Breakdown
        if (transactions.isNotEmpty) _buildTransactionTypeBreakdown(context, transactions),
        
        const SizedBox(height: 20),

        // Recent Transactions
        if (transactions.isNotEmpty) _buildRecentTransactions(context, transactions),
      ],
    );
  }

  Widget _buildSummaryCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 24),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(icon, color: color, size: 16),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountRow(String label, num amount, Color color, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: color,
            ),
          ),
          Text(
            '₦${NumberFormat('#,##0.00').format(amount)}',
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionTypeBreakdown(BuildContext context, List<Transaction> transactions) {
    final typeGroups = <String, int>{};
    for (final transaction in transactions) {
      final type = transaction.transactionType ?? 'Unknown';
      typeGroups[type] = (typeGroups[type] ?? 0) + 1;
    }

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transaction Types',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...typeGroups.entries.map((entry) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(entry.key),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      entry.value.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentTransactions(BuildContext context, List<Transaction> transactions) {
    final recentTransactions = transactions.take(5).toList();

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Transactions',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...recentTransactions.map((transaction) => _buildTransactionRow(transaction)),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionRow(Transaction transaction) {
    final isSuccess = transaction.status == true;
    final amount = double.tryParse(transaction.amount ?? '0') ?? 0.0;
    final merchantName = transaction.institutionData?.merchantName ?? 
                        transaction.responseMessage ?? 
                        'Unknown';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            isSuccess ? Icons.check_circle : Icons.cancel,
            color: isSuccess ? Colors.green : Colors.red,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  merchantName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                if (transaction.rRN != null)
                  Text(
                    'RRN: ${transaction.rRN}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                      fontFamily: 'monospace',
                    ),
                  ),
              ],
            ),
          ),
          Text(
            '₦${NumberFormat('#,##0.00').format(amount)}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSuccess ? Colors.green.shade700 : Colors.red.shade700,
            ),
          ),
        ],
      ),
    );
  }
}