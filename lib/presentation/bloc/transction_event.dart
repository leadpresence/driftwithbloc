import 'package:equatable/equatable.dart';
import '../../domain/models/transaction_model.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object?> get props => [];
}

class LoadTransactions extends TransactionEvent {
  const LoadTransactions();
}

class LoadTransactionsByDateRange extends TransactionEvent {
  final DateTime startDate;
  final DateTime? endDate;

  const LoadTransactionsByDateRange({
    required this.startDate,
    this.endDate,
  });

  @override
  List<Object?> get props => [startDate, endDate];
}

class CreateTransaction extends TransactionEvent {
  final Transaction transaction;

  const CreateTransaction({required this.transaction});

  @override
  List<Object> get props => [transaction];
}

class UpdateTransaction extends TransactionEvent {
  final int id;
  final Transaction transaction;

  const UpdateTransaction({
    required this.id,
    required this.transaction,
  });

  @override
  List<Object> get props => [id, transaction];
}

class DeleteTransaction extends TransactionEvent {
  final int id;

  const DeleteTransaction({required this.id});

  @override
  List<Object> get props => [id];
}

class LoadTransactionSummary extends TransactionEvent {
  final DateTime startDate;
  final DateTime? endDate;

  const LoadTransactionSummary({
    required this.startDate,
    this.endDate,
  });

  @override
  List<Object?> get props => [startDate, endDate];
}

class CreateMockSuccessTransaction extends TransactionEvent {
  const CreateMockSuccessTransaction();
}

class CreateMockFailedTransaction extends TransactionEvent {
  const CreateMockFailedTransaction();
}