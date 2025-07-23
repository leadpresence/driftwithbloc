import 'package:dartz/dartz.dart';
import 'package:transaction_app/data/repositories/transaction_repository.dart';
import 'dart:developer' as developer;
import '../../core/error/failures.dart';
import '../models/transaction_model.dart';

class GetTransactionsUseCase {
  final TransactionRepository repository;

  GetTransactionsUseCase({required this.repository});

  Future<Either<Failure, List<Transaction>>> call() async {
    try {
      developer.log('Executing GetTransactionsUseCase', name: 'GetTransactionsUseCase');
      final result = await repository.getAllTransactions();
      return result.fold(
        (failure) {
          developer.log('GetTransactionsUseCase failed: ${failure.message}', name: 'GetTransactionsUseCase');
          return Left(failure);
        },
        (transactions) {
          developer.log('GetTransactionsUseCase succeeded with ${transactions.length} transactions', name: 'GetTransactionsUseCase');
          return Right(transactions);
        },
      );
    } catch (e) {
      developer.log('Unexpected error in GetTransactionsUseCase: $e', name: 'GetTransactionsUseCase');
      return Left(UnknownFailure(message: 'Unexpected error occurred: $e', code: null));
    }
  }
}

class GetTransactionsByDateRangeUseCase {
  final TransactionRepository repository;

  GetTransactionsByDateRangeUseCase({required this.repository});

  Future<Either<Failure, List<Transaction>>> call(GetTransactionsByDateRangeParams params) async {
    try {
      developer.log('Executing GetTransactionsByDateRangeUseCase from ${params.startDate} to ${params.endDate}', name: 'GetTransactionsByDateRangeUseCase');
      
      // Validate date range
      if (params.startDate.isAfter(params.endDate)) {
        developer.log('Invalid date range: start date is after end date', name: 'GetTransactionsByDateRangeUseCase');
        return const Left(ValidationFailure(message: 'Start date cannot be after end date'));
      }
      
      final result = await repository.getTransactionsByDateRange(params.startDate, params.endDate);
      return result.fold(
        (failure) {
          developer.log('GetTransactionsByDateRangeUseCase failed: ${failure.message}', name: 'GetTransactionsByDateRangeUseCase');
          return Left(failure);
        },
        (transactions) {
          developer.log('GetTransactionsByDateRangeUseCase succeeded with ${transactions.length} transactions', name: 'GetTransactionsByDateRangeUseCase');
          return Right(transactions);
        },
      );
    } catch (e) {
      developer.log('Unexpected error in GetTransactionsByDateRangeUseCase: $e', name: 'GetTransactionsByDateRangeUseCase');
      return Left(UnknownFailure(message: 'Unexpected error occurred: $e', code: null));
    }
  }
}

class GetTransactionsByDateRangeParams {
  final DateTime startDate;
  final DateTime endDate;

  GetTransactionsByDateRangeParams({
    required this.startDate,
    DateTime? endDate,
  }) : endDate = endDate ?? DateTime.now();
}