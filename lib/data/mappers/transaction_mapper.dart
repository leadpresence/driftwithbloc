import 'dart:convert';
import 'dart:developer' as developer;
import 'package:drift/drift.dart';
import 'package:transaction_app/data/database/all_app_database.dart';
import '../../domain/models/transaction_model.dart';
 

class TransactionMapper {
  static TransactionEntity toEntity(Transaction transaction) {
    try {
      developer.log('Mapping Transaction to TransactionEntity', name: 'TransactionMapper');
      
      return TransactionEntity(
        id: 0, // Auto-incremented
        amount: transaction.amount,
        rRN: transaction.rRN,
        sTAN: transaction.sTAN,
        accountBalance: transaction.accountBalance,
        acquiringInstitutionIdCode: transaction.acquiringInstitutionIdCode,
        authCode: transaction.authCode,
        cardCardSequenceNum: transaction.cardCardSequenceNum,
        cardExpireData: transaction.cardExpireData,
        forwardingInstCode: transaction.forwardingInstCode,
        institutionDataJson: transaction.institutionData != null
            ? jsonEncode(transaction.institutionData!.toJson())
            : null,
        pan: transaction.pan,
        pinBlock: transaction.pinBlock,
        receiptNumber: transaction.receiptNumber,
        respCode: transaction.respCode,
        responseMessage: transaction.responseMessage,
        status: transaction.status,
        successResponse: transaction.successResponse,
        systemTraceAuditNo: transaction.systemTraceAuditNo,
        terminalId: transaction.terminalId,
        transactionDate: transaction.transactionDate,
        transactionDateTime: transaction.transactionDateTime,
        transactionTime: transaction.transactionTime,
        transactionType: transaction.transactionType,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
    } catch (e) {
      developer.log('Error mapping Transaction to TransactionEntity: $e', name: 'TransactionMapper');
      rethrow;
    }
  }

  static TransactionsCompanion toCompanion(Transaction transaction, {int? id}) {
    try {
      developer.log('Mapping Transaction to TransactionsCompanion', name: 'TransactionMapper');
      
      return TransactionsCompanion(
        id: id != null ? Value(id) : const Value.absent(),
        amount: Value(transaction.amount),
        rRN: Value(transaction.rRN),
        sTAN: Value(transaction.sTAN),
        accountBalance: Value(transaction.accountBalance),
        acquiringInstitutionIdCode: Value(transaction.acquiringInstitutionIdCode),
        authCode: Value(transaction.authCode),
        cardCardSequenceNum: Value(transaction.cardCardSequenceNum),
        cardExpireData: Value(transaction.cardExpireData),
        forwardingInstCode: Value(transaction.forwardingInstCode),
        institutionDataJson: Value(
          transaction.institutionData != null
              ? jsonEncode(transaction.institutionData!.toJson())
              : null,
        ),
        pan: Value(transaction.pan),
        pinBlock: Value(transaction.pinBlock),
        receiptNumber: Value(transaction.receiptNumber),
        respCode: Value(transaction.respCode),
        responseMessage: Value(transaction.responseMessage),
        status: Value(transaction.status),
        successResponse: Value(transaction.successResponse),
        systemTraceAuditNo: Value(transaction.systemTraceAuditNo),
        terminalId: Value(transaction.terminalId),
        transactionDate: Value(transaction.transactionDate),
        transactionDateTime: Value(transaction.transactionDateTime),
        transactionTime: Value(transaction.transactionTime),
        transactionType: Value(transaction.transactionType),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      );
    } catch (e) {
      developer.log('Error mapping Transaction to TransactionsCompanion: $e', name: 'TransactionMapper');
      rethrow;
    }
  }

  static Transaction fromEntity(TransactionEntity entity) {
    try {
      developer.log('Mapping TransactionEntity to Transaction', name: 'TransactionMapper');
      
      InstitutionData? institutionData;
      if (entity.institutionDataJson != null) {
        try {
          final json = jsonDecode(entity.institutionDataJson!);
          institutionData = InstitutionData.fromJson(json);
        } catch (e) {
          developer.log('Error parsing institution data JSON: $e', name: 'TransactionMapper');
        }
      }

      return Transaction(
        amount: entity.amount,
        rRN: entity.rRN,
        sTAN: entity.sTAN,
        accountBalance: entity.accountBalance,
        acquiringInstitutionIdCode: entity.acquiringInstitutionIdCode,
        authCode: entity.authCode,
        cardCardSequenceNum: entity.cardCardSequenceNum,
        cardExpireData: entity.cardExpireData,
        forwardingInstCode: entity.forwardingInstCode,
        institutionData: institutionData,
        pan: entity.pan,
        pinBlock: entity.pinBlock,
        receiptNumber: entity.receiptNumber,
        respCode: entity.respCode,
        responseMessage: entity.responseMessage,
        status: entity.status,
        successResponse: entity.successResponse,
        systemTraceAuditNo: entity.systemTraceAuditNo,
        terminalId: entity.terminalId,
        transactionDate: entity.transactionDate,
        transactionDateTime: entity.transactionDateTime,
        transactionTime: entity.transactionTime,
        transactionType: entity.transactionType,
        createdAt: entity.createdAt.toIso8601String(),
        updatedAt: entity.updatedAt.toIso8601String(),
      );
    } catch (e) {
      developer.log('Error mapping TransactionEntity to Transaction: $e', name: 'TransactionMapper');
      rethrow;
    }
  }

  static List<Transaction> fromEntityList(List<TransactionEntity> entities) {
    try {
      developer.log('Mapping ${entities.length} TransactionEntity objects to Transaction list', name: 'TransactionMapper');
      return entities.map((entity) => fromEntity(entity)).toList();
    } catch (e) {
      developer.log('Error mapping TransactionEntity list to Transaction list: $e', name: 'TransactionMapper');
      rethrow;
    }
  }

  static List<TransactionEntity> toEntityList(List<Transaction> transactions) {
    try {
      developer.log('Mapping ${transactions.length} Transaction objects to TransactionEntity list', name: 'TransactionMapper');
      return transactions.map((transaction) => toEntity(transaction)).toList();
    } catch (e) {
      developer.log('Error mapping Transaction list to TransactionEntity list: $e', name: 'TransactionMapper');
      rethrow;
    }
  }
}

class MerchantMapper {
  static MerchantEntity toEntity(MerchantDetails merchant) {
    try {
      developer.log('Mapping MerchantDetails to MerchantEntity', name: 'MerchantMapper');
      
      return MerchantEntity(
        id: 0, // Auto-incremented
        merchantName: merchant.merchantName,
        serialnumber: merchant.serialnumber,
        mid: merchant.mid,
        tid: merchant.tid,
        merchantaddress: merchant.merchantaddress,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
    } catch (e) {
      developer.log('Error mapping MerchantDetails to MerchantEntity: $e', name: 'MerchantMapper');
      rethrow;
    }
  }

  static MerchantsCompanion toCompanion(MerchantDetails merchant, {int? id}) {
    try {
      developer.log('Mapping MerchantDetails to MerchantsCompanion', name: 'MerchantMapper');
      
      return MerchantsCompanion(
        id: id != null ? Value(id) : const Value.absent(),
        merchantName: Value(merchant.merchantName),
        serialnumber: Value(merchant.serialnumber),
        mid: Value(merchant.mid),
        tid: Value(merchant.tid),
        merchantaddress: Value(merchant.merchantaddress),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      );
    } catch (e) {
      developer.log('Error mapping MerchantDetails to MerchantsCompanion: $e', name: 'MerchantMapper');
      rethrow;
    }
  }

  static MerchantDetails fromEntity(MerchantEntity entity) {
    try {
      developer.log('Mapping MerchantEntity to MerchantDetails', name: 'MerchantMapper');
      
      return MerchantDetails(
        merchantName: entity.merchantName,
        serialnumber: entity.serialnumber,
        mid: entity.mid,
        tid: entity.tid,
        merchantaddress: entity.merchantaddress,
      );
    } catch (e) {
      developer.log('Error mapping MerchantEntity to MerchantDetails: $e', name: 'MerchantMapper');
      rethrow;
    }
  }

  static List<MerchantDetails> fromEntityList(List<MerchantEntity> entities) {
    try {
      developer.log('Mapping ${entities.length} MerchantEntity objects to MerchantDetails list', name: 'MerchantMapper');
      return entities.map((entity) => fromEntity(entity)).toList();
    } catch (e) {
      developer.log('Error mapping MerchantEntity list to MerchantDetails list: $e', name: 'MerchantMapper');
      rethrow;
    }
  }

  static List<MerchantEntity> toEntityList(List<MerchantDetails> merchants) {
    try {
      developer.log('Mapping ${merchants.length} MerchantDetails objects to MerchantEntity list', name: 'MerchantMapper');
      return merchants.map((merchant) => toEntity(merchant)).toList();
    } catch (e) {
      developer.log('Error mapping MerchantDetails list to MerchantEntity list: $e', name: 'MerchantMapper');
      rethrow;
    }
  }
}