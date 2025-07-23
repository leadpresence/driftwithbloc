import 'package:dartz/dartz.dart';
import 'package:transaction_app/data/database/all_app_database.dart';
import 'package:transaction_app/data/repositories/transaction_repository.dart';
import 'dart:developer' as developer;
import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../domain/models/transaction_model.dart';
import '../mappers/transaction_mapper.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final AppDatabase database;

  TransactionRepositoryImpl({required this.database});

  @override
  Future<Either<Failure, List<Transaction>>> getAllTransactions() async {
    try {
      developer.log('Fetching all transactions from repository', name: 'TransactionRepositoryImpl');
      final entities = await database.getAllTransactions();
      final transactions = TransactionMapper.fromEntityList(entities);
      developer.log('Successfully fetched ${transactions.length} transactions', name: 'TransactionRepositoryImpl');
      return Right(transactions);
    } on DatabaseException catch (e) {
      developer.log('Database exception in getAllTransactions: ${e.message}', name: 'TransactionRepositoryImpl');
      return Left(DatabaseFailure(message: e.message, code: e.code));
    } catch (e) {
      developer.log('Unknown exception in getAllTransactions: $e', name: 'TransactionRepositoryImpl');
      return Left(UnknownFailure(message: 'Failed to fetch transactions: $e', code: null));
    }
  }

  @override
  Future<Either<Failure, Transaction?>> getTransactionById(int id) async {
    try {
      developer.log('Fetching transaction with id: $id', name: 'TransactionRepositoryImpl');
      final entity = await database.getTransactionById(id);
      if (entity == null) {
        developer.log('Transaction with id $id not found', name: 'TransactionRepositoryImpl');
        return const Right(null);
      }
      final transaction = TransactionMapper.fromEntity(entity);
      developer.log('Successfully fetched transaction with id: $id', name: 'TransactionRepositoryImpl');
      return Right(transaction);
    } on DatabaseException catch (e) {
      developer.log('Database exception in getTransactionById: ${e.message}', name: 'TransactionRepositoryImpl');
      return Left(DatabaseFailure(message: e.message, code: e.code));
    } catch (e) {
      developer.log('Unknown exception in getTransactionById: $e', name: 'TransactionRepositoryImpl');
      return Left(UnknownFailure(message: 'Failed to fetch transaction: $e', code: null));
    }
  }

  @override
  Future<Either<Failure, List<Transaction>>> getTransactionsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      developer.log('Fetching transactions from $startDate to $endDate', name: 'TransactionRepositoryImpl');
      final entities = await database.getTransactionsByDateRange(startDate, endDate);
      final transactions = TransactionMapper.fromEntityList(entities);
      developer.log('Successfully fetched ${transactions.length} transactions for date range', name: 'TransactionRepositoryImpl');
      return Right(transactions);
    } on DatabaseException catch (e) {
      developer.log('Database exception in getTransactionsByDateRange: ${e.message}', name: 'TransactionRepositoryImpl');
      return Left(DatabaseFailure(message: e.message, code: e.code));
    } catch (e) {
      developer.log('Unknown exception in getTransactionsByDateRange: $e', name: 'TransactionRepositoryImpl');
      return Left(UnknownFailure(message: 'Failed to fetch transactions by date range: $e', code: null));
    }
  }

  @override
  Future<Either<Failure, int>> createTransaction(Transaction transaction) async {
    try {
      developer.log('Creating new transaction', name: 'TransactionRepositoryImpl');
      final companion = TransactionMapper.toCompanion(transaction);
      final id = await database.insertTransaction(companion);
      developer.log('Successfully created transaction with id: $id', name: 'TransactionRepositoryImpl');
      return Right(id);
    } on DatabaseException catch (e) {
      developer.log('Database exception in createTransaction: ${e.message}', name: 'TransactionRepositoryImpl');
      return Left(DatabaseFailure(message: e.message, code: e.code));
    } catch (e) {
      developer.log('Unknown exception in createTransaction: $e', name: 'TransactionRepositoryImpl');
      return Left(UnknownFailure(message: 'Failed to create transaction: $e', code: null));
    }
  }

  @override
  Future<Either<Failure, bool>> updateTransaction(Transaction transaction, int id) async {
    try {
      developer.log('Updating transaction with id: $id', name: 'TransactionRepositoryImpl');
      final companion = TransactionMapper.toCompanion(transaction, id: id);
      final result = await database.updateTransaction(companion);
      developer.log('Successfully updated transaction with id: $id', name: 'TransactionRepositoryImpl');
      return Right(result);
    } on DatabaseException catch (e) {
      developer.log('Database exception in updateTransaction: ${e.message}', name: 'TransactionRepositoryImpl');
      return Left(DatabaseFailure(message: e.message, code: e.code));
    } catch (e) {
      developer.log('Unknown exception in updateTransaction: $e', name: 'TransactionRepositoryImpl');
      return Left(UnknownFailure(message: 'Failed to update transaction: $e', code: null));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteTransaction(int id) async {
    try {
      developer.log('Deleting transaction with id: $id', name: 'TransactionRepositoryImpl');
      final result = await database.deleteTransaction(id);
      final success = result > 0;
      developer.log('Successfully deleted transaction with id: $id, result: $success', name: 'TransactionRepositoryImpl');
      return Right(success);
    } on DatabaseException catch (e) {
      developer.log('Database exception in deleteTransaction: ${e.message}', name: 'TransactionRepositoryImpl');
      return Left(DatabaseFailure(message: e.message, code: e.code));
    } catch (e) {
      developer.log('Unknown exception in deleteTransaction: $e', name: 'TransactionRepositoryImpl');
      return Left(UnknownFailure(message: 'Failed to delete transaction: $e', code: null));
    }
  }

  @override
  Future<Either<Failure, TransactionModel>> getTransactionSummary(
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      developer.log('Generating transaction summary from $startDate to $endDate', name: 'TransactionRepositoryImpl');
      
      final transactionsResult = await getTransactionsByDateRange(startDate, endDate);
      
      return transactionsResult.fold(
        (failure) => Left(failure),
        (transactions) {
          developer.log('Calculating summary for ${transactions.length} transactions', name: 'TransactionRepositoryImpl');
          
          final successfulTransactions = transactions.where((t) => t.status == true).toList();
          final failedTransactions = transactions.where((t) => t.status == false).toList();
          
          final totalSuccessAmount = successfulTransactions.fold<double>(
            0.0,
            (sum, transaction) => sum + (double.tryParse(transaction.amount ?? '0') ?? 0.0),
          );
          
          final totalFailedAmount = failedTransactions.fold<double>(
            0.0,
            (sum, transaction) => sum + (double.tryParse(transaction.amount ?? '0') ?? 0.0),
          );
          
          final totalTransactionAmount = totalSuccessAmount + totalFailedAmount;
          
          final summary = TransactionModel(
            success: true,
            allTransaction: transactions,
            message: 'Transaction summary generated successfully',
            totalSuccessAmount: totalSuccessAmount,
            totalFailedAmount: totalFailedAmount,
            totalTransactionAmount: totalTransactionAmount,
          );
          
          developer.log('Successfully generated transaction summary', name: 'TransactionRepositoryImpl');
          developer.log('Total transactions: ${transactions.length}', name: 'TransactionRepositoryImpl');
          developer.log('Successful transactions: ${successfulTransactions.length}', name: 'TransactionRepositoryImpl');
          developer.log('Failed transactions: ${failedTransactions.length}', name: 'TransactionRepositoryImpl');
          developer.log('Total success amount: $totalSuccessAmount', name: 'TransactionRepositoryImpl');
          developer.log('Total failed amount: $totalFailedAmount', name: 'TransactionRepositoryImpl');
          
          return Right(summary);
        },
      );
    } catch (e) {
      developer.log('Unknown exception in getTransactionSummary: $e', name: 'TransactionRepositoryImpl');
      return Left(UnknownFailure(message: 'Failed to generate transaction summary: $e', code: null));
    }
  }
}