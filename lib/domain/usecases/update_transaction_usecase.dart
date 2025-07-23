import 'package:dartz/dartz.dart';
import 'package:transaction_app/data/repositories/transaction_repository.dart';
import 'dart:developer' as developer;
import '../../core/error/failures.dart';
import '../models/transaction_model.dart';


class UpdateTransactionUseCase {
  final TransactionRepository repository;

  UpdateTransactionUseCase({required this.repository});

  Future<Either<Failure, bool>> call(UpdateTransactionParams params) async {
    try {
      developer.log('Executing UpdateTransactionUseCase for id: ${params.id}', name: 'UpdateTransactionUseCase');
      
      // Validate transaction data
      final validationResult = _validateTransaction(params.transaction);
      if (validationResult != null) {
        developer.log('Transaction validation failed: $validationResult', name: 'UpdateTransactionUseCase');
        return Left(ValidationFailure(message: validationResult));
      }
      
      // Check if transaction exists
      final existingTransaction = await repository.getTransactionById(params.id);
      final transactionExists = existingTransaction.fold(
        (failure) => false,
        (transaction) => transaction != null,
      );
      
      if (!transactionExists) {
        developer.log('Transaction with id ${params.id} not found', name: 'UpdateTransactionUseCase');
        return const Left(NotFoundFailure(message: 'Transaction not found'));
      }
      
      final result = await repository.updateTransaction(params.transaction, params.id);
      return result.fold(
        (failure) {
          developer.log('UpdateTransactionUseCase failed: ${failure.message}', name: 'UpdateTransactionUseCase');
          return Left(failure);
        },
        (success) {
          developer.log('UpdateTransactionUseCase succeeded: $success', name: 'UpdateTransactionUseCase');
          return Right(success);
        },
      );
    } catch (e) {
      developer.log('Unexpected error in UpdateTransactionUseCase: $e', name: 'UpdateTransactionUseCase');
      return Left(UnknownFailure(message: 'Unexpected error occurred: $e', code: null));
    }
  }

  String? _validateTransaction(Transaction transaction) {
    if (transaction.amount == null || transaction.amount!.isEmpty) {
      return 'Transaction amount is required';
    }
    
    final amount = double.tryParse(transaction.amount!);
    if (amount == null || amount < 0) {
      return 'Invalid transaction amount';
    }
    
    if (transaction.transactionType == null || transaction.transactionType!.isEmpty) {
      return 'Transaction type is required';
    }
    
    return null;
  }
}

class UpdateTransactionParams {
  final int id;
  final Transaction transaction;

  UpdateTransactionParams({required this.id, required this.transaction});
}