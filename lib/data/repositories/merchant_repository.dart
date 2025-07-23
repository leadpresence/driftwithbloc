import 'package:dartz/dartz.dart';
import 'package:transaction_app/domain/models/transaction_model.dart';
import '../../core/error/failures.dart';
 

abstract class MerchantRepository {
  Future<Either<Failure, List<MerchantDetails>>> getAllMerchants();
  Future<Either<Failure, MerchantDetails?>> getMerchantById(int id);
  Future<Either<Failure, int>> createMerchant(MerchantDetails merchant);
  Future<Either<Failure, bool>> updateMerchant(MerchantDetails merchant, int id);
  Future<Either<Failure, bool>> deleteMerchant(int id);
}