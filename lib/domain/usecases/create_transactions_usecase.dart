import 'package:dartz/dartz.dart';
import 'package:transaction_app/data/repositories/transaction_repository.dart';
import 'dart:developer' as developer;
import '../../core/error/failures.dart';
import '../models/transaction_model.dart'; 

class CreateTransactionUseCase {
  final TransactionRepository repository;

  CreateTransactionUseCase({required this.repository});

  Future<Either<Failure, int>> call(CreateTransactionParams params) async {
    try {
      developer.log('Executing CreateTransactionUseCase', name: 'CreateTransactionUseCase');
      
      // Validate transaction data
      final validationResult = _validateTransaction(params.transaction);
      if (validationResult != null) {
        developer.log('Transaction validation failed: $validationResult', name: 'CreateTransactionUseCase');
        return Left(ValidationFailure(message: validationResult));
      }
      
      final result = await repository.createTransaction(params.transaction);
      return result.fold(
        (failure) {
          developer.log('CreateTransactionUseCase failed: ${failure.message}', name: 'CreateTransactionUseCase');
          return Left(failure);
        },
        (id) {
          developer.log('CreateTransactionUseCase succeeded with id: $id', name: 'CreateTransactionUseCase');
          return Right(id);
        },
      );
    } catch (e) {
      developer.log('Unexpected error in CreateTransactionUseCase: $e', name: 'CreateTransactionUseCase');
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

class CreateTransactionParams {
  final Transaction transaction;

  CreateTransactionParams({required this.transaction});
}