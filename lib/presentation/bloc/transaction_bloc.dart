import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transaction_app/domain/usecases/create_transactions_usecase.dart';
import 'package:transaction_app/presentation/bloc/transction_event.dart';
import 'dart:developer' as developer;
import 'dart:math';
import '../../domain/models/transaction_model.dart'; 
import '../../domain/usecases/delete_transaction_usecase.dart';
import '../../domain/usecases/get_transaction_summary_usecase.dart';
import '../../domain/usecases/get_transactions_usecase.dart';
import '../../domain/usecases/update_transaction_usecase.dart';
 
import 'transaction_state.dart';

// class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
//   final GetTransactionsUseCase getTransactionsUseCase;
//   final GetTransactionsByDateRangeUseCase getTransactionsByDateRangeUseCase;
//   final CreateTransactionUseCase createTransactionUseCase;
//   final UpdateTransactionUseCase updateTransactionUseCase;
//   final DeleteTransactionUseCase deleteTransactionUseCase;
//   final GetTransactionSummaryUseCase getTransactionSummaryUseCase;

//   TransactionBloc({
//     required this.getTransactionsUseCase,
//     required this.getTransactionsByDateRangeUseCase,
//     required this.createTransactionUseCase,
//     required this.updateTransactionUseCase,
//     required this.deleteTransactionUseCase,
//     required this.getTransactionSummaryUseCase,
//   }) : super(const TransactionInitial()) {
//     on<LoadTransactions>(_onLoadTransactions);
//     on<LoadTransactionsByDateRange>(_onLoadTransactionsByDateRange);
//     on<CreateTransaction>(_onCreateTransaction);
//     on<UpdateTransaction>(_onUpdateTransaction);
//     on<DeleteTransaction>(_onDeleteTransaction);
//     on<LoadTransactionSummary>(_onLoadTransactionSummary);
//     on<CreateMockSuccessTransaction>(_onCreateMockSuccessTransaction);
//     on<CreateMockFailedTransaction>(_onCreateMockFailedTransaction);
//   }

//   Future<void> _onLoadTransactions(
//     LoadTransactions event,
//     Emitter<TransactionState> emit,
//   ) async {
//     try {
//       developer.log('Loading all transactions', name: 'TransactionBloc');
//       emit(const TransactionLoading());

//       final result = await getTransactionsUseCase();
//       result.fold(
//         (failure) {
//           developer.log('Failed to load transactions: ${failure.message}', name: 'TransactionBloc');
//           emit(TransactionError(message: failure.message, errorCode: failure.code));
//         },
//         (transactions) {
//           developer.log('Successfully loaded ${transactions.length} transactions', name: 'TransactionBloc');
//           emit(TransactionLoaded(transactions: transactions));
//         },
//       );
//     } catch (e) {
//       developer.log('Unexpected error in _onLoadTransactions: $e', name: 'TransactionBloc');
//       emit(TransactionError(message: 'Unexpected error occurred: $e'));
//     }
//   }

//   Future<void> _onLoadTransactionsByDateRange(
//     LoadTransactionsByDateRange event,
//     Emitter<TransactionState> emit,
//   ) async {
//     try {
//       developer.log('Loading transactions by date range: ${event.startDate} to ${event.endDate}', name: 'TransactionBloc');
//       emit(const TransactionLoading());

//       final params = GetTransactionsByDateRangeParams(
//         startDate: event.startDate,
//         endDate: event.endDate,
//       );

//       final result = await getTransactionsByDateRangeUseCase(params);
//       result.fold(
//         (failure) {
//           developer.log('Failed to load transactions by date range: ${failure.message}', name: 'TransactionBloc');
//           emit(TransactionError(message: failure.message, errorCode: failure.code));
//         },
//         (transactions) {
//           developer.log('Successfully loaded ${transactions.length} transactions for date range', name: 'TransactionBloc');
//           emit(TransactionLoaded(transactions: transactions));
//         },
//       );
//     } catch (e) {
//       developer.log('Unexpected error in _onLoadTransactionsByDateRange: $e', name: 'TransactionBloc');
//       emit(TransactionError(message: 'Unexpected error occurred: $e'));
//     }
//   }

//   Future<void> _onCreateTransaction(
//     CreateTransaction event,
//     Emitter<TransactionState> emit,
//   ) async {
//     try {
//       developer.log('Creating new transaction', name: 'TransactionBloc');
//       emit(const TransactionLoading());

//       final params = CreateTransactionParams(transaction: event.transaction);
//       final result = await createTransactionUseCase(params);

//       result.fold(
//         (failure) {
//           developer.log('Failed to create transaction: ${failure.message}', name: 'TransactionBloc');
//           emit(TransactionError(message: failure.message, errorCode: failure.code));
//         },
//         (transactionId) {
//           developer.log('Successfully created transaction with id: $transactionId', name: 'TransactionBloc');
//           emit(TransactionCreated(transactionId: transactionId));
//           // Reload transactions after creation
//           add(const LoadTransactions());
//         },
//       );
//     } catch (e) {
//       developer.log('Unexpected error in _onCreateTransaction: $e', name: 'TransactionBloc');
//       emit(TransactionError(message: 'Unexpected error occurred: $e'));
//     }
//   }

//   Future<void> _onUpdateTransaction(
//     UpdateTransaction event,
//     Emitter<TransactionState> emit,
//   ) async {
//     try {
//       developer.log('Updating transaction with id: ${event.id}', name: 'TransactionBloc');
//       emit(const TransactionLoading());

//       final params = UpdateTransactionParams(
//         id: event.id,
//         transaction: event.transaction,
//       );
//       final result = await updateTransactionUseCase(params);

//       result.fold(
//         (failure) {
//           developer.log('Failed to update transaction: ${failure.message}', name: 'TransactionBloc');
//           emit(TransactionError(message: failure.message, errorCode: failure.code));
//         },
//         (success) {
//           developer.log('Successfully updated transaction: $success', name: 'TransactionBloc');
//           emit(const TransactionUpdated());
//           // Reload transactions after update
//           add(const LoadTransactions());
//         },
//       );
//     } catch (e) {
//       developer.log('Unexpected error in _onUpdateTransaction: $e', name: 'TransactionBloc');
//       emit(TransactionError(message: 'Unexpected error occurred: $e'));
//     }
//   }

//   Future<void> _onDeleteTransaction(
//     DeleteTransaction event,
//     Emitter<TransactionState> emit,
//   ) async {
//     try {
//       developer.log('Deleting transaction with id: ${event.id}', name: 'TransactionBloc');
//       emit(const TransactionLoading());

//       final params = DeleteTransactionParams(id: event.id);
//       final result = await deleteTransactionUseCase(params);

//       result.fold(
//         (failure) {
//           developer.log('Failed to delete transaction: ${failure.message}', name: 'TransactionBloc');
//           emit(TransactionError(message: failure.message, errorCode: failure.code));
//         },
//         (success) {
//           developer.log('Successfully deleted transaction: $success', name: 'TransactionBloc');
//           emit(const TransactionDeleted());
//           // Reload transactions after deletion
//           add(const LoadTransactions());
//         },
//       );
//     } catch (e) {
//       developer.log('Unexpected error in _onDeleteTransaction: $e', name: 'TransactionBloc');
//       emit(TransactionError(message: 'Unexpected error occurred: $e'));
//     }
//   }

//   Future<void> _onLoadTransactionSummary(
//     LoadTransactionSummary event,
//     Emitter<TransactionState> emit,
//   ) async {
//     try {
//       developer.log('Loading transaction summary for date range: ${event.startDate} to ${event.endDate}', name: 'TransactionBloc');
//       emit(const TransactionLoading());

//       final params = GetTransactionSummaryParams(
//         startDate: event.startDate,
//         endDate: event.endDate,
//       );

//       final result = await getTransactionSummaryUseCase(params);
//       result.fold(
//         (failure) {
//           developer.log('Failed to load transaction summary: ${failure.message}', name: 'TransactionBloc');
//           emit(TransactionError(message: failure.message, errorCode: failure.code));
//         },
//         (summary) {
//           developer.log('Successfully loaded transaction summary', name: 'TransactionBloc');
//           emit(TransactionSummaryLoaded(summary: summary));
//         },
//       );
//     } catch (e) {
//       developer.log('Unexpected error in _onLoadTransactionSummary: $e', name: 'TransactionBloc');
//       emit(TransactionError(message: 'Unexpected error occurred: $e'));
//     }
//   }

//   Future<void> _onCreateMockSuccessTransaction(
//     CreateMockSuccessTransaction event,
//     Emitter<TransactionState> emit,
//   ) async {
//     try {
//       developer.log('Creating mock success transaction', name: 'TransactionBloc');
      
//       final mockTransaction = _generateMockTransaction(true);
//       add(CreateTransaction(transaction: mockTransaction));
//     } catch (e) {
//       developer.log('Unexpected error in _onCreateMockSuccessTransaction: $e', name: 'TransactionBloc');
//       emit(TransactionError(message: 'Failed to create mock success transaction: $e'));
//     }
//   }

//   Future<void> _onCreateMockFailedTransaction(
//     CreateMockFailedTransaction event,
//     Emitter<TransactionState> emit,
//   ) async {
//     try {
//       developer.log('Creating mock failed transaction', name: 'TransactionBloc');
      
//       final mockTransaction = _generateMockTransaction(false);
//       add(CreateTransaction(transaction: mockTransaction));
//     } catch (e) {
//       developer.log('Unexpected error in _onCreateMockFailedTransaction: $e', name: 'TransactionBloc');
//       emit(TransactionError(message: 'Failed to create mock failed transaction: $e'));
//     }
//   }

//   Transaction _generateMockTransaction(bool isSuccess) {
//     final random = Random();
//     final now = DateTime.now();
//     final amount = (random.nextDouble() * 10000).toStringAsFixed(2);
//     final rrn = '${random.nextInt(999999999999)}'.padLeft(12, '0');
//     final stan = '${random.nextInt(999999)}'.padLeft(6, '0');
    
//     return Transaction(
//       amount: amount,
//       rRN: rrn,
//       sTAN: stan,
//       accountBalance: '${(random.nextDouble() * 50000).toStringAsFixed(2)}',
//       acquiringInstitutionIdCode: '${random.nextInt(99999)}'.padLeft(5, '0'),
//       authCode: isSuccess ? '${random.nextInt(999999)}'.padLeft(6, '0') : null,
//       cardCardSequenceNum: '${random.nextInt(999)}'.padLeft(3, '0'),
//       cardExpireData: '${(now.year + random.nextInt(5)).toString().substring(2)}${(random.nextInt(12) + 1).toString().padLeft(2, '0')}',
//       forwardingInstCode: '${random.nextInt(99999)}'.padLeft(5, '0'),
//       institutionData: InstitutionData(
//         merchantNo: 'MERCH${random.nextInt(999999)}'.padLeft(9, '0'),
//         amount: amount,
//         accountType: random.nextBool() ? 'SAVINGS' : 'CURRENT',
//         transactionType: isSuccess ? 'PURCHASE' : 'DECLINED',
//         merchantName: _getRandomMerchantName(),
//         tid: 'TID${random.nextInt(99999)}'.padLeft(8, '0'),
//       ),
//       pan: '**** **** **** ${random.nextInt(9999)}'.padLeft(4, '0'),
//       pinBlock: null, // Sensitive data
//       receiptNumber: '${random.nextInt(999999999)}'.padLeft(9, '0'),
//       respCode: isSuccess ? '00' : ['51', '54', '55', '57', '61', '62', '65'][random.nextInt(7)],
//       responseMessage: isSuccess ? 'APPROVED' : ['INSUFFICIENT FUNDS', 'EXPIRED CARD', 'INVALID PIN', 'INVALID CARD', 'EXCEEDS LIMIT', 'INVALID AMOUNT', 'INVALID TRANSACTION'][random.nextInt(7)],
//       status: isSuccess,
//       successResponse: isSuccess ? 'Transaction approved successfully' : null,
//       systemTraceAuditNo: stan,
//       terminalId: 'T${random.nextInt(999999)}'.padLeft(7, '0'),
//       transactionDate: '${now.day.toString().padLeft(2, '0')}${now.month.toString().padLeft(2, '0')}',
//       transactionDateTime: now.toIso8601String(),
//       transactionTime: '${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}${now.second.toString().padLeft(2, '0')}',
//       transactionType: isSuccess ? 'PURCHASE' : 'DECLINED',
//       createdAt: now.toIso8601String(),
//       updatedAt: now.toIso8601String(),
//     );
//   }

//   String _getRandomMerchantName() {
//     final merchants = [
//       'WALMART STORE',
//       'MCDONALDS',
//       'SHELL GAS STATION',
//       'TARGET STORE',
//       'AMAZON PAYMENT',
//       'STARBUCKS COFFEE',
//       'HOME DEPOT',
//       'BEST BUY ELECTRONICS',
//       'GROCERY PLUS MARKET',
//       'PIZZA HUT RESTAURANT',
//     ];
//     return merchants[Random().nextInt(merchants.length)];
//   }
// }


 

// // class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
//   final GetTransactionsUseCase getTransactionsUseCase;
//   final GetTransactionsByDateRangeUseCase getTransactionsByDateRangeUseCase;
//   final CreateTransactionUseCase createTransactionUseCase;
//   final UpdateTransactionUseCase updateTransactionUseCase;
//   final DeleteTransactionUseCase deleteTransactionUseCase;
//   final GetTransactionSummaryUseCase getTransactionSummaryUseCase;

//   TransactionBloc({
//     required this.getTransactionsUseCase,
//     required this.getTransactionsByDateRangeUseCase,
//     required this.createTransactionUseCase,
//     required this.updateTransactionUseCase,
//     required this.deleteTransactionUseCase,
//     required this.getTransactionSummaryUseCase,
//   }) : super(const TransactionInitial()) {
//     on<LoadTransactions>(_onLoadTransactions);
//     on<LoadTransactionsByDateRange>(_onLoadTransactionsByDateRange);
//     on<CreateTransaction>(_onCreateTransaction);
//     on<UpdateTransaction>(_onUpdateTransaction);
//     on<DeleteTransaction>(_onDeleteTransaction);
//     on<LoadTransactionSummary>(_onLoadTransactionSummary);
//     on<CreateMockSuccessTransaction>(_onCreateMockSuccessTransaction);
//     on<CreateMockFailedTransaction>(_onCreateMockFailedTransaction);
//   }

//   Future<void> _onLoadTransactions(
//     LoadTransactions event,
//     Emitter<TransactionState> emit,
//   ) async {
//     try {
//       developer.log('Loading all transactions', name: 'TransactionBloc');
//       emit(const TransactionLoading());

//       final result = await getTransactionsUseCase();
//       result.fold(
//         (failure) {
//           developer.log('Failed to load transactions: ${failure.message}', name: 'TransactionBloc');
//           emit(TransactionError(message: failure.message, errorCode: failure.code));
//         },
//         (transactions) {
//           developer.log('Successfully loaded ${transactions.length} transactions', name: 'TransactionBloc');
//           emit(TransactionLoaded(transactions: transactions));
//         },
//       );
//     } catch (e) {
//       developer.log('Unexpected error in _onLoadTransactions: $e', name: 'TransactionBloc');
//       emit(TransactionError(message: 'Unexpected error occurred: $e'));
//     }
//   }

//   Future<void> _onLoadTransactionsByDateRange(
//     LoadTransactionsByDateRange event,
//     Emitter<TransactionState> emit,
//   ) async {
//     try {
//       developer.log('Loading transactions by date range: ${event.startDate} to ${event.endDate}', name: 'TransactionBloc');
//       emit(const TransactionLoading());

//       final params = GetTransactionsByDateRangeParams(
//         startDate: event.startDate,
//         endDate: event.endDate,
//       );

//       final result = await getTransactionsByDateRangeUseCase(params);
//       result.fold(
//         (failure) {
//           developer.log('Failed to load transactions by date range: ${failure.message}', name: 'TransactionBloc');
//           emit(TransactionError(message: failure.message, errorCode: failure.code));
//         },
//         (transactions) {
//           developer.log('Successfully loaded ${transactions.length} transactions for date range', name: 'TransactionBloc');
//           emit(TransactionLoaded(transactions: transactions));
//         },
//       );
//     } catch (e) {
//       developer.log('Unexpected error in _onLoadTransactionsByDateRange: $e', name: 'TransactionBloc');
//       emit(TransactionError(message: 'Unexpected error occurred: $e'));
//     }
//   }

//   Future<void> _onCreateTransaction(
//     CreateTransaction event,
//     Emitter<TransactionState> emit,
//   ) async {
//     try {
//       developer.log('Creating new transaction', name: 'TransactionBloc');
//       emit(const TransactionLoading());

//       final params = CreateTransactionParams(transaction: event.transaction);
//       final result = await createTransactionUseCase(params);

//       result.fold(
//         (failure) {
//           developer.log('Failed to create transaction: ${failure.message}', name: 'TransactionBloc');
//           emit(TransactionError(message: failure.message, errorCode: failure.code));
//         },
//         (transactionId) {
//           developer.log('Successfully created transaction with id: $transactionId', name: 'TransactionBloc');
//           emit(TransactionCreated(transactionId: transactionId));
//           // Reload transactions after creation
//           add(const LoadTransactions());
//         },
//       );
//     } catch (e) {
//       developer.log('Unexpected error in _onCreateTransaction: $e', name: 'TransactionBloc');
//       emit(TransactionError(message: 'Unexpected error occurred: $e'));
//     }
//   }

//   Future<void> _onUpdateTransaction(
//     UpdateTransaction event,
//     Emitter<TransactionState> emit,
//   ) async {
//     try {
//       developer.log('Updating transaction with id: ${event.id}', name: 'TransactionBloc');
//       emit(const TransactionLoading());

//       final params = UpdateTransactionParams(
//         id: event.id,
//         transaction: event.transaction,
//       );
//       final result = await updateTransactionUseCase(params);

//       result.fold(
//         (failure) {
//           developer.log('Failed to update transaction: ${failure.message}', name: 'TransactionBloc');
//           emit(TransactionError(message: failure.message, errorCode: failure.code));
//         },
//         (success) {
//           developer.log('Successfully updated transaction: $success', name: 'TransactionBloc');
//           emit(const TransactionUpdated());
//           // Reload transactions after update
//           add(const LoadTransactions());
//         },
//       );
//     } catch (e) {
//       developer.log('Unexpected error in _onUpdateTransaction: $e', name: 'TransactionBloc');
//       emit(TransactionError(message: 'Unexpected error occurred: $e'));
//     }
//   }

//   Future<void> _onDeleteTransaction(
//     DeleteTransaction event,
//     Emitter<TransactionState> emit,
//   ) async {
//     try {
//       developer.log('Deleting transaction with id: ${event.id}', name: 'TransactionBloc');
//       emit(const TransactionLoading());

//       final params = DeleteTransactionParams(id: event.id);
//       final result = await deleteTransactionUseCase(params);

//       result.fold(
//         (failure) {
//           developer.log('Failed to delete transaction: ${failure.message}', name: 'TransactionBloc');
//           emit(TransactionError(message: failure.message, errorCode: failure.code));
//         },
//         (success) {
//           developer.log('Successfully deleted transaction: $success', name: 'TransactionBloc');
//           emit(const TransactionDeleted());
//           // Reload transactions after deletion
//           add(const LoadTransactions());
//         },
//       );
//     } catch (e) {
//       developer.log('Unexpected error in _onDeleteTransaction: $e', name: 'TransactionBloc');
//       emit(TransactionError(message: 'Unexpected error occurred: $e'));
//     }
//   }

//   Future<void> _onLoadTransactionSummary(
//     LoadTransactionSummary event,
//     Emitter<TransactionState> emit,
//   ) async {
//     try {
//       developer.log('Loading transaction summary for date range: ${event.startDate} to ${event.endDate}', name: 'TransactionBloc');
//       emit(const TransactionLoading());

//       final params = GetTransactionSummaryParams(
//         startDate: event.startDate,
//         endDate: event.endDate,
//       );

//       final result = await getTransactionSummaryUseCase(params);
//       result.fold(
//         (failure) {
//           developer.log('Failed to load transaction summary: ${failure.message}', name: 'TransactionBloc');
//           emit(TransactionError(message: failure.message, errorCode: failure.code));
//         },
//         (summary) {
//           developer.log('Successfully loaded transaction summary', name: 'TransactionBloc');
//           emit(TransactionSummaryLoaded(summary: summary));
//         },
//       );
//     } catch (e) {
//       developer.log('Unexpected error in _onLoadTransactionSummary: $e', name: 'TransactionBloc');
//       emit(TransactionError(message: 'Unexpected error occurred: $e'));
//     }
//   }

//   Future<void> _onCreateMockSuccessTransaction(
//     CreateMockSuccessTransaction event,
//     Emitter<TransactionState> emit,
//   ) async {
//     try {
//       developer.log('Creating mock success transaction', name: 'TransactionBloc');
      
//       final mockTransaction = _generateMockTransaction(true);
//       add(CreateTransaction(transaction: mockTransaction));
//     } catch (e) {
//       developer.log('Unexpected error in _onCreateMockSuccessTransaction: $e', name: 'TransactionBloc');
//       emit(TransactionError(message: 'Failed to create mock success transaction: ${e.toString()}'));
//     }
//   }

//   Future<void> _onCreateMockFailedTransaction(
//     CreateMockFailedTransaction event,
//     Emitter<TransactionState> emit,
//   ) async {
//     try {
//       developer.log('Creating mock failed transaction', name: 'TransactionBloc');
      
//       final mockTransaction = _generateMockTransaction(false);
//       add(CreateTransaction(transaction: mockTransaction));
//     } catch (e) {
//       developer.log('Unexpected error in _onCreateMockFailedTransaction: $e', name: 'TransactionBloc');
//       emit(TransactionError(message: 'Failed to create mock failed transaction: ${e.toString()}'));
//     }
//   }

//   Transaction _generateMockTransaction(bool isSuccess) {
//     final random = Random();
//     final now = DateTime.now();
//     final amount = (random.nextDouble() * 9999 + 1).toStringAsFixed(2); // 1.00 to 9999.99
//     final rrn = '${random.nextInt(999999999999)}'.padLeft(12, '0');
//     final stan = '${random.nextInt(999999)}'.padLeft(6, '0');
    
//     return Transaction(
//       amount: amount,
//       rRN: rrn,
//       sTAN: stan,
//       accountBalance: '${(random.nextDouble() * 49999 + 1).toStringAsFixed(2)}', // 1.00 to 49999.99
//       acquiringInstitutionIdCode: '${random.nextInt(99999)}'.padLeft(5, '0'),
//       authCode: isSuccess ? '${random.nextInt(999999)}'.padLeft(6, '0') : null,
//       cardCardSequenceNum: '${random.nextInt(999)}'.padLeft(3, '0'),
//       cardExpireData: '${(now.year + random.nextInt(5) + 1).toString().substring(2)}${(random.nextInt(12) + 1).toString().padLeft(2, '0')}',
//       forwardingInstCode: '${random.nextInt(99999)}'.padLeft(5, '0'),
//       institutionData: InstitutionData(
//         merchantNo: 'MERCH${random.nextInt(999999)}'.padLeft(9, '0'),
//         amount: amount,
//         accountType: random.nextBool() ? 'SAVINGS' : 'CURRENT',
//         transactionType: isSuccess ? 'PURCHASE' : 'DECLINED',
//         merchantName: _getRandomMerchantName(),
//         tid: 'TID${random.nextInt(99999)}'.padLeft(8, '0'),
//       ),
//       pan: '**** **** **** ${random.nextInt(9999)}'.padLeft(4, '0'),
//       pinBlock: null, // Sensitive data
//       receiptNumber: '${random.nextInt(999999999)}'.padLeft(9, '0'),
//       respCode: isSuccess ? '00' : ['51', '54', '55', '57', '61', '62', '65'][random.nextInt(7)],
//       responseMessage: isSuccess ? 'APPROVED' : ['INSUFFICIENT FUNDS', 'EXPIRED CARD', 'INVALID PIN', 'INVALID CARD', 'EXCEEDS LIMIT', 'INVALID AMOUNT', 'INVALID TRANSACTION'][random.nextInt(7)],
//       status: isSuccess,
//       successResponse: isSuccess ? 'Transaction approved successfully' : null,
//       systemTraceAuditNo: stan,
//       terminalId: 'T${random.nextInt(999999)}'.padLeft(7, '0'),
//       transactionDate: '${now.day.toString().padLeft(2, '0')}${now.month.toString().padLeft(2, '0')}',
//       transactionDateTime: now.toIso8601String(),
//       transactionTime: '${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}${now.second.toString().padLeft(2, '0')}',
//       transactionType: isSuccess ? 'PURCHASE' : 'DECLINED',
//       createdAt: now.toIso8601String(),
//       updatedAt: now.toIso8601String(),
//     );
//   }

//   String _getRandomMerchantName() {
//     final merchants = [
//       'WALMART STORE',
//       'MCDONALDS',
//       'SHELL GAS STATION',
//       'TARGET STORE',
//       'AMAZON PAYMENT',
//       'STARBUCKS COFFEE',
//       'HOME DEPOT',
//       'BEST BUY ELECTRONICS',
//       'GROCERY PLUS MARKET',
//       'PIZZA HUT RESTAURANT',
//     ];
    
//     try {
//       final random = Random();
//       final index = random.nextInt(merchants.length);
//       return merchants[index];
//     } catch (e) {
//       developer.log('Error getting random merchant name: $e', name: 'TransactionBloc');
//       return 'DEFAULT MERCHANT';
//     }
//   }
// }


class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final GetTransactionsUseCase getTransactionsUseCase;
  final GetTransactionsByDateRangeUseCase getTransactionsByDateRangeUseCase;
  final CreateTransactionUseCase createTransactionUseCase;
  final UpdateTransactionUseCase updateTransactionUseCase;
  final DeleteTransactionUseCase deleteTransactionUseCase;
  final GetTransactionSummaryUseCase getTransactionSummaryUseCase;

  TransactionBloc({
    required this.getTransactionsUseCase,
    required this.getTransactionsByDateRangeUseCase,
    required this.createTransactionUseCase,
    required this.updateTransactionUseCase,
    required this.deleteTransactionUseCase,
    required this.getTransactionSummaryUseCase,
  }) : super(const TransactionInitial()) {
    on<LoadTransactions>(_onLoadTransactions);
    on<LoadTransactionsByDateRange>(_onLoadTransactionsByDateRange);
    on<CreateTransaction>(_onCreateTransaction);
    on<UpdateTransaction>(_onUpdateTransaction);
    on<DeleteTransaction>(_onDeleteTransaction);
    on<LoadTransactionSummary>(_onLoadTransactionSummary);
    on<CreateMockSuccessTransaction>(_onCreateMockSuccessTransaction);
    on<CreateMockFailedTransaction>(_onCreateMockFailedTransaction);
  }

  Future<void> _onLoadTransactions(
    LoadTransactions event,
    Emitter<TransactionState> emit,
  ) async {
    try {
      developer.log('Loading all transactions', name: 'TransactionBloc');
      emit(const TransactionLoading());

      final result = await getTransactionsUseCase();
      result.fold(
        (failure) {
          developer.log('Failed to load transactions: ${failure.message}', name: 'TransactionBloc');
          emit(TransactionError(message: failure.message, errorCode: failure.code));
        },
        (transactions) {
          developer.log('Successfully loaded ${transactions.length} transactions', name: 'TransactionBloc');
          emit(TransactionLoaded(transactions: transactions));
        },
      );
    } catch (e) {
      developer.log('Unexpected error in _onLoadTransactions: $e', name: 'TransactionBloc');
      emit(TransactionError(message: 'Unexpected error occurred: $e'));
    }
  }

  Future<void> _onLoadTransactionsByDateRange(
    LoadTransactionsByDateRange event,
    Emitter<TransactionState> emit,
  ) async {
    try {
      developer.log('Loading transactions by date range: ${event.startDate} to ${event.endDate}', name: 'TransactionBloc');
      emit(const TransactionLoading());

      final params = GetTransactionsByDateRangeParams(
        startDate: event.startDate,
        endDate: event.endDate,
      );

      final result = await getTransactionsByDateRangeUseCase(params);
      result.fold(
        (failure) {
          developer.log('Failed to load transactions by date range: ${failure.message}', name: 'TransactionBloc');
          emit(TransactionError(message: failure.message, errorCode: failure.code));
        },
        (transactions) {
          developer.log('Successfully loaded ${transactions.length} transactions for date range', name: 'TransactionBloc');
          emit(TransactionLoaded(transactions: transactions));
        },
      );
    } catch (e) {
      developer.log('Unexpected error in _onLoadTransactionsByDateRange: $e', name: 'TransactionBloc');
      emit(TransactionError(message: 'Unexpected error occurred: $e'));
    }
  }

  Future<void> _onCreateTransaction(
    CreateTransaction event,
    Emitter<TransactionState> emit,
  ) async {
    try {
      developer.log('Creating new transaction', name: 'TransactionBloc');
      emit(const TransactionLoading());

      final params = CreateTransactionParams(transaction: event.transaction);
      final result = await createTransactionUseCase(params);

      result.fold(
        (failure) {
          developer.log('Failed to create transaction: ${failure.message}', name: 'TransactionBloc');
          emit(TransactionError(message: failure.message, errorCode: failure.code));
        },
        (transactionId) {
          developer.log('Successfully created transaction with id: $transactionId', name: 'TransactionBloc');
          emit(TransactionCreated(transactionId: transactionId));
          // Reload transactions after creation
          add(const LoadTransactions());
        },
      );
    } catch (e) {
      developer.log('Unexpected error in _onCreateTransaction: $e', name: 'TransactionBloc');
      emit(TransactionError(message: 'Unexpected error occurred: $e'));
    }
  }

  Future<void> _onUpdateTransaction(
    UpdateTransaction event,
    Emitter<TransactionState> emit,
  ) async {
    try {
      developer.log('Updating transaction with id: ${event.id}', name: 'TransactionBloc');
      emit(const TransactionLoading());

      final params = UpdateTransactionParams(
        id: event.id,
        transaction: event.transaction,
      );
      final result = await updateTransactionUseCase(params);

      result.fold(
        (failure) {
          developer.log('Failed to update transaction: ${failure.message}', name: 'TransactionBloc');
          emit(TransactionError(message: failure.message, errorCode: failure.code));
        },
        (success) {
          developer.log('Successfully updated transaction: $success', name: 'TransactionBloc');
          emit(const TransactionUpdated());
          // Reload transactions after update
          add(const LoadTransactions());
        },
      );
    } catch (e) {
      developer.log('Unexpected error in _onUpdateTransaction: $e', name: 'TransactionBloc');
      emit(TransactionError(message: 'Unexpected error occurred: $e'));
    }
  }

  Future<void> _onDeleteTransaction(
    DeleteTransaction event,
    Emitter<TransactionState> emit,
  ) async {
    try {
      developer.log('Deleting transaction with id: ${event.id}', name: 'TransactionBloc');
      emit(const TransactionLoading());

      final params = DeleteTransactionParams(id: event.id);
      final result = await deleteTransactionUseCase(params);

      result.fold(
        (failure) {
          developer.log('Failed to delete transaction: ${failure.message}', name: 'TransactionBloc');
          emit(TransactionError(message: failure.message, errorCode: failure.code));
        },
        (success) {
          developer.log('Successfully deleted transaction: $success', name: 'TransactionBloc');
          emit(const TransactionDeleted());
          // Reload transactions after deletion
          add(const LoadTransactions());
        },
      );
    } catch (e) {
      developer.log('Unexpected error in _onDeleteTransaction: $e', name: 'TransactionBloc');
      emit(TransactionError(message: 'Unexpected error occurred: $e'));
    }
  }

  Future<void> _onLoadTransactionSummary(
    LoadTransactionSummary event,
    Emitter<TransactionState> emit,
  ) async {
    try {
      developer.log('Loading transaction summary for date range: ${event.startDate} to ${event.endDate}', name: 'TransactionBloc');
      emit(const TransactionLoading());

      final params = GetTransactionSummaryParams(
        startDate: event.startDate,
        endDate: event.endDate,
      );

      final result = await getTransactionSummaryUseCase(params);
      result.fold(
        (failure) {
          developer.log('Failed to load transaction summary: ${failure.message}', name: 'TransactionBloc');
          emit(TransactionError(message: failure.message, errorCode: failure.code));
        },
        (summary) {
          developer.log('Successfully loaded transaction summary', name: 'TransactionBloc');
          emit(TransactionSummaryLoaded(summary: summary));
        },
      );
    } catch (e) {
      developer.log('Unexpected error in _onLoadTransactionSummary: $e', name: 'TransactionBloc');
      emit(TransactionError(message: 'Unexpected error occurred: $e'));
    }
  }

  Future<void> _onCreateMockSuccessTransaction(
    CreateMockSuccessTransaction event,
    Emitter<TransactionState> emit,
  ) async {
    try {
      developer.log('Creating mock success transaction', name: 'TransactionBloc');
      
      final mockTransaction = _generateMockTransaction(true);
      add(CreateTransaction(transaction: mockTransaction));
    } catch (e) {
      developer.log('Unexpected error in _onCreateMockSuccessTransaction: $e', name: 'TransactionBloc');
      emit(TransactionError(message: 'Failed to create mock success transaction: ${e.toString()}'));
    }
  }

  Future<void> _onCreateMockFailedTransaction(
    CreateMockFailedTransaction event,
    Emitter<TransactionState> emit,
  ) async {
    try {
      developer.log('Creating mock failed transaction', name: 'TransactionBloc');
      
      final mockTransaction = _generateMockTransaction(false);
      add(CreateTransaction(transaction: mockTransaction));
    } catch (e) {
      developer.log('Unexpected error in _onCreateMockFailedTransaction: $e', name: 'TransactionBloc');
      emit(TransactionError(message: 'Failed to create mock failed transaction: ${e.toString()}'));
    }
  }

  Transaction _generateMockTransaction(bool isSuccess) {
    try {
      final random = Random();
      final now = DateTime.now();
      
      // Use much smaller, safer ranges
      final amount = (random.nextDouble() * 999 + 1).toStringAsFixed(2); // 1.00 to 999.99
      final rrn = '${random.nextInt(999999)}'.padLeft(12, '0'); // Much smaller range
      final stan = '${random.nextInt(999999)}'.padLeft(6, '0');
      
      return Transaction(
        amount: amount,
        rRN: rrn,
        sTAN: stan,
        accountBalance: '${(random.nextDouble() * 9999 + 1).toStringAsFixed(2)}',
        acquiringInstitutionIdCode: '${random.nextInt(99999)}'.padLeft(5, '0'),
        authCode: isSuccess ? '${random.nextInt(999999)}'.padLeft(6, '0') : null,
        cardCardSequenceNum: '${random.nextInt(99) + 1}'.padLeft(3, '0'),
        cardExpireData: '${(now.year + 2).toString().substring(2)}${(random.nextInt(12) + 1).toString().padLeft(2, '0')}',
        forwardingInstCode: '${random.nextInt(99999)}'.padLeft(5, '0'),
        institutionData: InstitutionData(
          merchantNo: 'MERCH${random.nextInt(999999)}'.padLeft(9, '0'),
          amount: amount,
          accountType: random.nextBool() ? 'SAVINGS' : 'CURRENT',
          transactionType: isSuccess ? 'PURCHASE' : 'DECLINED',
          merchantName: _getRandomMerchantName(),
          tid: 'TID${random.nextInt(99999)}'.padLeft(8, '0'),
        ),
        pan: '**** **** **** ${(random.nextInt(8999) + 1000).toString()}',
        pinBlock: null, // Sensitive data
        receiptNumber: '${random.nextInt(999999999)}'.padLeft(9, '0'),
        respCode: isSuccess ? '00' : ['51', '54', '55', '57', '61', '62', '65'][random.nextInt(7)],
        responseMessage: isSuccess ? 'APPROVED' : ['INSUFFICIENT FUNDS', 'EXPIRED CARD', 'INVALID PIN', 'INVALID CARD', 'EXCEEDS LIMIT', 'INVALID AMOUNT', 'INVALID TRANSACTION'][random.nextInt(7)],
        status: isSuccess,
        successResponse: isSuccess ? 'Transaction approved successfully' : null,
        systemTraceAuditNo: stan,
        terminalId: 'T${random.nextInt(999999)}'.padLeft(7, '0'),
        transactionDate: '${now.day.toString().padLeft(2, '0')}${now.month.toString().padLeft(2, '0')}',
        transactionDateTime: now.toIso8601String(),
        transactionTime: '${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}${now.second.toString().padLeft(2, '0')}',
        transactionType: isSuccess ? 'PURCHASE' : 'DECLINED',
        createdAt: now.toIso8601String(),
        updatedAt: now.toIso8601String(),
      );
    } catch (e) {
      developer.log('Error generating mock transaction: $e', name: 'TransactionBloc');
      // Return a simple fallback transaction
      final now = DateTime.now();
      return Transaction(
        amount: '100.00',
        rRN: '123456789012',
        sTAN: '123456',
        accountBalance: '5000.00',
        acquiringInstitutionIdCode: '12345',
        authCode: isSuccess ? '123456' : null,
        cardCardSequenceNum: '001',
        cardExpireData: '2612',
        forwardingInstCode: '12345',
        institutionData: InstitutionData(
          merchantNo: 'MERCH123456789',
          amount: '100.00',
          accountType: 'SAVINGS',
          transactionType: isSuccess ? 'PURCHASE' : 'DECLINED',
          merchantName: 'TEST MERCHANT',
          tid: 'TID12345678',
        ),
        pan: '**** **** **** 1234',
        pinBlock: null,
        receiptNumber: '123456789',
        respCode: isSuccess ? '00' : '51',
        responseMessage: isSuccess ? 'APPROVED' : 'INSUFFICIENT FUNDS',
        status: isSuccess,
        successResponse: isSuccess ? 'Transaction approved successfully' : null,
        systemTraceAuditNo: '123456',
        terminalId: 'T1234567',
        transactionDate: '${now.day.toString().padLeft(2, '0')}${now.month.toString().padLeft(2, '0')}',
        transactionDateTime: now.toIso8601String(),
        transactionTime: '${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}${now.second.toString().padLeft(2, '0')}',
        transactionType: isSuccess ? 'PURCHASE' : 'DECLINED',
        createdAt: now.toIso8601String(),
        updatedAt: now.toIso8601String(),
      );
    }
  }

  String _getRandomMerchantName() {
    final merchants = [
      'WALMART STORE',
      'MCDONALDS',
      'SHELL GAS STATION',
      'TARGET STORE',
      'AMAZON PAYMENT',
      'STARBUCKS COFFEE',
      'HOME DEPOT',
      'BEST BUY ELECTRONICS',
      'GROCERY PLUS MARKET',
      'PIZZA HUT RESTAURANT',
    ];
    
    try {
      final random = Random();
      final index = random.nextInt(merchants.length);
      return merchants[index];
    } catch (e) {
      developer.log('Error getting random merchant name: $e', name: 'TransactionBloc');
      return 'DEFAULT MERCHANT';
    }
  }
}