import 'package:dartz/dartz.dart';
import 'package:transaction_app/data/database/all_app_database.dart';
import 'package:transaction_app/data/repositories/merchant_repository.dart';
import 'dart:developer' as developer;
import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../domain/models/transaction_model.dart';
 
import '../mappers/transaction_mapper.dart';

class MerchantRepositoryImpl implements MerchantRepository {
  final AppDatabase database;

  MerchantRepositoryImpl({required this.database});

  @override
  Future<Either<Failure, List<MerchantDetails>>> getAllMerchants() async {
    try {
      developer.log('Fetching all merchants from repository', name: 'MerchantRepositoryImpl');
      final entities = await database.getAllMerchants();
      final merchants = MerchantMapper.fromEntityList(entities);
      developer.log('Successfully fetched ${merchants.length} merchants', name: 'MerchantRepositoryImpl');
      return Right(merchants);
    } on DatabaseException catch (e) {
      developer.log('Database exception in getAllMerchants: ${e.message}', name: 'MerchantRepositoryImpl');
      return Left(DatabaseFailure(message: e.message, code: e.code));
    } catch (e) {
      developer.log('Unknown exception in getAllMerchants: $e', name: 'MerchantRepositoryImpl');
      return Left(UnknownFailure(message: 'Failed to fetch merchants: $e', code: null));
    }
  }

  @override
  Future<Either<Failure, MerchantDetails?>> getMerchantById(int id) async {
    try {
      developer.log('Fetching merchant with id: $id', name: 'MerchantRepositoryImpl');
      final entity = await database.getMerchantById(id);
      if (entity == null) {
        developer.log('Merchant with id $id not found', name: 'MerchantRepositoryImpl');
        return const Right(null);
      }
      final merchant = MerchantMapper.fromEntity(entity);
      developer.log('Successfully fetched merchant with id: $id', name: 'MerchantRepositoryImpl');
      return Right(merchant);
    } on DatabaseException catch (e) {
      developer.log('Database exception in getMerchantById: ${e.message}', name: 'MerchantRepositoryImpl');
      return Left(DatabaseFailure(message: e.message, code: e.code));
    } catch (e) {
      developer.log('Unknown exception in getMerchantById: $e', name: 'MerchantRepositoryImpl');
      return Left(UnknownFailure(message: 'Failed to fetch merchant: $e', code: null));
    }
  }

  @override
  Future<Either<Failure, int>> createMerchant(MerchantDetails merchant) async {
    try {
      developer.log('Creating new merchant', name: 'MerchantRepositoryImpl');
      final companion = MerchantMapper.toCompanion(merchant);
      final id = await database.insertMerchant(companion);
      developer.log('Successfully created merchant with id: $id', name: 'MerchantRepositoryImpl');
      return Right(id);
    } on DatabaseException catch (e) {
      developer.log('Database exception in createMerchant: ${e.message}', name: 'MerchantRepositoryImpl');
      return Left(DatabaseFailure(message: e.message, code: e.code));
    } catch (e) {
      developer.log('Unknown exception in createMerchant: $e', name: 'MerchantRepositoryImpl');
      return Left(UnknownFailure(message: 'Failed to create merchant: $e', code: null));
    }
  }

  @override
  Future<Either<Failure, bool>> updateMerchant(MerchantDetails merchant, int id) async {
    try {
      developer.log('Updating merchant with id: $id', name: 'MerchantRepositoryImpl');
      final companion = MerchantMapper.toCompanion(merchant, id: id);
      final result = await database.updateMerchant(companion);
      developer.log('Successfully updated merchant with id: $id', name: 'MerchantRepositoryImpl');
      return Right(result);
    } on DatabaseException catch (e) {
      developer.log('Database exception in updateMerchant: ${e.message}', name: 'MerchantRepositoryImpl');
      return Left(DatabaseFailure(message: e.message, code: e.code));
    } catch (e) {
      developer.log('Unknown exception in updateMerchant: $e', name: 'MerchantRepositoryImpl');
      return Left(UnknownFailure(message: 'Failed to update merchant: $e', code: null));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteMerchant(int id) async {
    try {
      developer.log('Deleting merchant with id: $id', name: 'MerchantRepositoryImpl');
      final result = await database.deleteMerchant(id);
      final success = result > 0;
      developer.log('Successfully deleted merchant with id: $id, result: $success', name: 'MerchantRepositoryImpl');
      return Right(success);
    } on DatabaseException catch (e) {
      developer.log('Database exception in deleteMerchant: ${e.message}', name: 'MerchantRepositoryImpl');
      return Left(DatabaseFailure(message: e.message, code: e.code));
    } catch (e) {
      developer.log('Unknown exception in deleteMerchant: $e', name: 'MerchantRepositoryImpl');
      return Left(UnknownFailure(message: 'Failed to delete merchant: $e', code: null));
    }
  }
}