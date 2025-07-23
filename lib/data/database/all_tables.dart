import 'package:drift/drift.dart';

@DataClassName('TransactionEntity')
class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get amount => text().nullable()();
  TextColumn get rRN => text().nullable()();
  TextColumn get sTAN => text().nullable()();
  TextColumn get accountBalance => text().nullable()();
  TextColumn get acquiringInstitutionIdCode => text().nullable()();
  TextColumn get authCode => text().nullable()();
  TextColumn get cardCardSequenceNum => text().nullable()();
  TextColumn get cardExpireData => text().nullable()();
  TextColumn get forwardingInstCode => text().nullable()();
  TextColumn get institutionDataJson => text().nullable()();
  TextColumn get pan => text().nullable()();
  TextColumn get pinBlock => text().nullable()();
  TextColumn get receiptNumber => text().nullable()();
  TextColumn get respCode => text().nullable()();
  TextColumn get responseMessage => text().nullable()();
  BoolColumn get status => boolean().nullable()();
  TextColumn get successResponse => text().nullable()();
  TextColumn get systemTraceAuditNo => text().nullable()();
  TextColumn get terminalId => text().nullable()();
  TextColumn get transactionDate => text().nullable()();
  TextColumn get transactionDateTime => text().nullable()();
  TextColumn get transactionTime => text().nullable()();
  TextColumn get transactionType => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('MerchantEntity')
class Merchants extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get merchantName => text().nullable()();
  TextColumn get serialnumber => text().nullable()();
  TextColumn get mid => text().nullable()();
  TextColumn get tid => text().nullable()();
  TextColumn get merchantaddress => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}