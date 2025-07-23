import 'package:equatable/equatable.dart';
import '../../domain/models/transaction_model.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object?> get props => [];
}

class TransactionInitial extends TransactionState {
  const TransactionInitial();
}

class TransactionLoading extends TransactionState {
  const TransactionLoading();
}

class TransactionLoaded extends TransactionState {
  final List<Transaction> transactions;

  const TransactionLoaded({required this.transactions});

  @override
  List<Object> get props => [transactions];
}

class TransactionSummaryLoaded extends TransactionState {
  final TransactionModel summary;

  const TransactionSummaryLoaded({required this.summary});

  @override
  List<Object> get props => [summary];
}

class TransactionCreated extends TransactionState {
  final int transactionId;

  const TransactionCreated({required this.transactionId});

  @override
  List<Object> get props => [transactionId];
}

class TransactionUpdated extends TransactionState {
  const TransactionUpdated();
}

class TransactionDeleted extends TransactionState {
  const TransactionDeleted();
}

class TransactionError extends TransactionState {
  final String message;
  final int? errorCode;

  const TransactionError({
    required this.message,
    this.errorCode,
  });

  @override
  List<Object?> get props => [message, errorCode];
}