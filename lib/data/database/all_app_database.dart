import 'dart:io';
import 'dart:developer' as developer;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import 'all_tables.dart';

part 'all_app_database.g.dart';

@DriftDatabase(tables: [Transactions, Merchants])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          developer.log('Creating database tables', name: 'AppDatabase');
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          developer.log('Upgrading database from version $from to $to', name: 'AppDatabase');
          // Handle future migrations here
        },
      );

  // Transaction operations
  Future<List<TransactionEntity>> getAllTransactions() async {
    try {
      developer.log('Fetching all transactions', name: 'AppDatabase');
      return await select(transactions).get();
    } catch (e) {
      developer.log('Error fetching all transactions: $e', name: 'AppDatabase');
      rethrow;
    }
  }

  Future<TransactionEntity?> getTransactionById(int id) async {
    try {
      developer.log('Fetching transaction with id: $id', name: 'AppDatabase');
      return await (select(transactions)..where((t) => t.id.equals(id))).getSingleOrNull();
    } catch (e) {
      developer.log('Error fetching transaction by id: $e', name: 'AppDatabase');
      rethrow;
    }
  }

  Future<List<TransactionEntity>> getTransactionsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      developer.log('Fetching transactions from $startDate to $endDate', name: 'AppDatabase');
      return await (select(transactions)
            ..where((t) => t.createdAt.isBetweenValues(startDate, endDate))
            ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
          .get();
    } catch (e) {
      developer.log('Error fetching transactions by date range: $e', name: 'AppDatabase');
      rethrow;
    }
  }

  Future<int> insertTransaction(TransactionsCompanion transaction) async {
    try {
      developer.log('Inserting new transaction', name: 'AppDatabase');
      final id = await into(transactions).insert(transaction);
      developer.log('Transaction inserted with id: $id', name: 'AppDatabase');
      return id;
    } catch (e) {
      developer.log('Error inserting transaction: $e', name: 'AppDatabase');
      rethrow;
    }
  }

  Future<bool> updateTransaction(TransactionsCompanion transaction) async {
    try {
      developer.log('Updating transaction with id: ${transaction.id.value}', name: 'AppDatabase');
      final result = await update(transactions).replace(transaction);
      developer.log('Transaction update result: $result', name: 'AppDatabase');
      return result;
    } catch (e) {
      developer.log('Error updating transaction: $e', name: 'AppDatabase');
      rethrow;
    }
  }

  Future<int> deleteTransaction(int id) async {
    try {
      developer.log('Deleting transaction with id: $id', name: 'AppDatabase');
      final result = await (delete(transactions)..where((t) => t.id.equals(id))).go();
      developer.log('Transaction deletion result: $result', name: 'AppDatabase');
      return result;
    } catch (e) {
      developer.log('Error deleting transaction: $e', name: 'AppDatabase');
      rethrow;
    }
  }

  // Merchant operations
  Future<List<MerchantEntity>> getAllMerchants() async {
    try {
      developer.log('Fetching all merchants', name: 'AppDatabase');
      return await select(merchants).get();
    } catch (e) {
      developer.log('Error fetching all merchants: $e', name: 'AppDatabase');
      rethrow;
    }
  }

  Future<MerchantEntity?> getMerchantById(int id) async {
    try {
      developer.log('Fetching merchant with id: $id', name: 'AppDatabase');
      return await (select(merchants)..where((m) => m.id.equals(id))).getSingleOrNull();
    } catch (e) {
      developer.log('Error fetching merchant by id: $e', name: 'AppDatabase');
      rethrow;
    }
  }

  Future<int> insertMerchant(MerchantsCompanion merchant) async {
    try {
      developer.log('Inserting new merchant', name: 'AppDatabase');
      final id = await into(merchants).insert(merchant);
      developer.log('Merchant inserted with id: $id', name: 'AppDatabase');
      return id;
    } catch (e) {
      developer.log('Error inserting merchant: $e', name: 'AppDatabase');
      rethrow;
    }
  }

  Future<bool> updateMerchant(MerchantsCompanion merchant) async {
    try {
      developer.log('Updating merchant with id: ${merchant.id.value}', name: 'AppDatabase');
      final result = await update(merchants).replace(merchant);
      developer.log('Merchant update result: $result', name: 'AppDatabase');
      return result;
    } catch (e) {
      developer.log('Error updating merchant: $e', name: 'AppDatabase');
      rethrow;
    }
  }

  Future<int> deleteMerchant(int id) async {
    try {
      developer.log('Deleting merchant with id: $id', name: 'AppDatabase');
      final result = await (delete(merchants)..where((m) => m.id.equals(id))).go();
      developer.log('Merchant deletion result: $result', name: 'AppDatabase');
      return result;
    } catch (e) {
      developer.log('Error deleting merchant: $e', name: 'AppDatabase');
      rethrow;
    }
  }

  // Close database connection
  @override
  Future<void> close() async {
    developer.log('Closing database connection', name: 'AppDatabase');
    await super.close();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'transactions.db'));
    
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }
    
    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;
    
    developer.log('Opening database connection at: ${file.path}', name: 'AppDatabase');
    
    return NativeDatabase.createInBackground(file);
  });
}