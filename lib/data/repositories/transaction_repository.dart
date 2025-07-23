import 'package:dartz/dartz.dart';
import 'package:transaction_app/domain/models/transaction_model.dart';
import '../../core/error/failures.dart';
 

abstract class TransactionRepository {
  Future<Either<Failure, List<Transaction>>> getAllTransactions();
  Future<Either<Failure, Transaction?>> getTransactionById(int id);
  Future<Either<Failure, List<Transaction>>> getTransactionsByDateRange(
    DateTime startDate,
    DateTime endDate,
  );
  Future<Either<Failure, int>> createTransaction(Transaction transaction);
  Future<Either<Failure, bool>> updateTransaction(Transaction transaction, int id);
  Future<Either<Failure, bool>> deleteTransaction(int id);
  Future<Either<Failure, TransactionModel>> getTransactionSummary(
    DateTime startDate,
    DateTime endDate,
  );
}