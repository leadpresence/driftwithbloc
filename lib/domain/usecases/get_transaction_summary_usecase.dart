import 'package:dartz/dartz.dart';
import 'package:transaction_app/data/repositories/transaction_repository.dart';
import 'dart:developer' as developer;
import '../../core/error/failures.dart';
import '../models/transaction_model.dart'; 

class GetTransactionSummaryUseCase {
  final TransactionRepository repository;

  GetTransactionSummaryUseCase({required this.repository});

  Future<Either<Failure, TransactionModel>> call(GetTransactionSummaryParams params) async {
    try {
      developer.log('Executing GetTransactionSummaryUseCase from ${params.startDate} to ${params.endDate}', name: 'GetTransactionSummaryUseCase');
      
      // Validate date range
      if (params.startDate.isAfter(params.endDate)) {
        developer.log('Invalid date range: start date is after end date', name: 'GetTransactionSummaryUseCase');
        return const Left(ValidationFailure(message: 'Start date cannot be after end date'));
      }
      
      final result = await repository.getTransactionSummary(params.startDate, params.endDate);
      return result.fold(
        (failure) {
          developer.log('GetTransactionSummaryUseCase failed: ${failure.message}', name: 'GetTransactionSummaryUseCase');
          return Left(failure);
        },
        (summary) {
          developer.log('GetTransactionSummaryUseCase succeeded', name: 'GetTransactionSummaryUseCase');
          return Right(summary);
        },
      );
    } catch (e) {
      developer.log('Unexpected error in GetTransactionSummaryUseCase: $e', name: 'GetTransactionSummaryUseCase');
      return Left(UnknownFailure(message: 'Unexpected error occurred: $e', code: null));
    }
  }
}

class GetTransactionSummaryParams {
  final DateTime startDate;
  final DateTime endDate;

  GetTransactionSummaryParams({
    required this.startDate,
    DateTime? endDate,
  }) : endDate = endDate ?? DateTime.now();
}