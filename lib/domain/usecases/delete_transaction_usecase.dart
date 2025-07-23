import 'package:dartz/dartz.dart';
import 'package:transaction_app/data/repositories/transaction_repository.dart';
import 'dart:developer' as developer;
import '../../core/error/failures.dart'; 

class DeleteTransactionUseCase {
  final TransactionRepository repository;

  DeleteTransactionUseCase({required this.repository});

  Future<Either<Failure, bool>> call(DeleteTransactionParams params) async {
    try {
      developer.log('Executing DeleteTransactionUseCase for id: ${params.id}', name: 'DeleteTransactionUseCase');
      
      // Check if transaction exists
      final existingTransaction = await repository.getTransactionById(params.id);
      final transactionExists = existingTransaction.fold(
        (failure) => false,
        (transaction) => transaction != null,
      );
      
      if (!transactionExists) {
        developer.log('Transaction with id ${params.id} not found', name: 'DeleteTransactionUseCase');
        return const Left(NotFoundFailure(message: 'Transaction not found'));
      }
      
      final result = await repository.deleteTransaction(params.id);
      return result.fold(
        (failure) {
          developer.log('DeleteTransactionUseCase failed: ${failure.message}', name: 'DeleteTransactionUseCase');
          return Left(failure);
        },
        (success) {
          developer.log('DeleteTransactionUseCase succeeded: $success', name: 'DeleteTransactionUseCase');
          return Right(success);
        },
      );
    } catch (e) {
      developer.log('Unexpected error in DeleteTransactionUseCase: $e', name: 'DeleteTransactionUseCase');
      return Left(UnknownFailure(message: 'Unexpected error occurred: $e', code: null));
    }
  }
}

class DeleteTransactionParams {
  final int id;

  DeleteTransactionParams({required this.id});
}