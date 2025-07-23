import 'dart:convert';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final bool? success;
  final List<Transaction>? allTransaction;
  final String? message;
  final String? merchantName;
  final num? totalSuccessAmount;
  final num? totalFailedAmount;
  final num? totalTransactionAmount;
  final MerchantDetails? merchantDetails;

  const TransactionModel({
    this.success,
    this.allTransaction,
    this.message,
    this.merchantName,
    this.totalSuccessAmount,
    this.totalFailedAmount,
    this.totalTransactionAmount,
    this.merchantDetails,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      success: json['success'],
      allTransaction: json['allTransaction'] != null
          ? (json['allTransaction'] as List)
              .map((e) => Transaction.fromJson(e))
              .toList()
          : null,
      message: json['message'],
      merchantName: json['merchantName'],
      totalSuccessAmount: json['totalSuccessAmount'],
      totalFailedAmount: json['totalFailedAmount'],
      totalTransactionAmount: json['totalTransactionAmount'],
      merchantDetails: json['merchantDetails'] != null
          ? MerchantDetails.fromJson(json['merchantDetails'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'allTransaction': allTransaction?.map((e) => e.toJson()).toList(),
      'message': message,
      'merchantName': merchantName,
      'totalSuccessAmount': totalSuccessAmount,
      'totalFailedAmount': totalFailedAmount,
      'totalTransactionAmount': totalTransactionAmount,
      'merchantDetails': merchantDetails?.toJson(),
    };
  }

  TransactionModel copyWith({
    bool? success,
    List<Transaction>? allTransaction,
    String? message,
    String? merchantName,
    num? totalSuccessAmount,
    num? totalFailedAmount,
    num? totalTransactionAmount,
    MerchantDetails? merchantDetails,
  }) {
    return TransactionModel(
      success: success ?? this.success,
      allTransaction: allTransaction ?? this.allTransaction,
      message: message ?? this.message,
      merchantName: merchantName ?? this.merchantName,
      totalSuccessAmount: totalSuccessAmount ?? this.totalSuccessAmount,
      totalFailedAmount: totalFailedAmount ?? this.totalFailedAmount,
      totalTransactionAmount: totalTransactionAmount ?? this.totalTransactionAmount,
      merchantDetails: merchantDetails ?? this.merchantDetails,
    );
  }

  @override
  List<Object?> get props => [
        success,
        allTransaction,
        message,
        merchantName,
        totalSuccessAmount,
        totalFailedAmount,
        totalTransactionAmount,
        merchantDetails,
      ];
}

class Transaction extends Equatable {
  final String? amount;
  final String? rRN;
  final String? sTAN;
  final String? accountBalance;
  final String? acquiringInstitutionIdCode;
  final String? authCode;
  final String? cardCardSequenceNum;
  final String? cardExpireData;
  final String? forwardingInstCode;
  final InstitutionData? institutionData;
  final String? pan;
  final String? pinBlock;
  final String? receiptNumber;
  final String? respCode;
  final String? responseMessage;
  final bool? status;
  final String? successResponse;
  final String? systemTraceAuditNo;
  final String? terminalId;
  final String? transactionDate;
  final String? transactionDateTime;
  final String? transactionTime;
  final String? transactionType;
  final String? createdAt;
  final String? updatedAt;

  const Transaction({
    this.amount,
    this.rRN,
    this.sTAN,
    this.accountBalance,
    this.acquiringInstitutionIdCode,
    this.authCode,
    this.cardCardSequenceNum,
    this.cardExpireData,
    this.forwardingInstCode,
    this.institutionData,
    this.pan,
    this.pinBlock,
    this.receiptNumber,
    this.respCode,
    this.responseMessage,
    this.status,
    this.successResponse,
    this.systemTraceAuditNo,
    this.terminalId,
    this.transactionDate,
    this.transactionDateTime,
    this.transactionTime,
    this.transactionType,
    this.createdAt,
    this.updatedAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      amount: json['amount'],
      rRN: json['RRN'],
      sTAN: json['STAN'],
      accountBalance: json['accountBalance'],
      acquiringInstitutionIdCode: json['acquiringInstitutionIdCode'],
      authCode: json['authCode'],
      cardCardSequenceNum: json['cardCardSequenceNum'],
      cardExpireData: json['cardExpireData'],
      forwardingInstCode: json['forwardingInstCode'],
      institutionData: json['institutionData'] != null
          ? InstitutionData.fromJson(json['institutionData'])
          : null,
      pan: json['pan'],
      pinBlock: json['pinBlock'],
      receiptNumber: json['receiptNumber'],
      respCode: json['respCode'],
      responseMessage: json['responseMessage'],
      status: json['status'],
      successResponse: json['successResponse'],
      systemTraceAuditNo: json['systemTraceAuditNo'],
      terminalId: json['terminalId'],
      transactionDate: json['transactionDate'],
      transactionDateTime: json['transactionDateTime'],
      transactionTime: json['transactionTime'],
      transactionType: json['transactionType'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'RRN': rRN,
      'STAN': sTAN,
      'accountBalance': accountBalance,
      'acquiringInstitutionIdCode': acquiringInstitutionIdCode,
      'authCode': authCode,
      'cardCardSequenceNum': cardCardSequenceNum,
      'cardExpireData': cardExpireData,
      'forwardingInstCode': forwardingInstCode,
      'institutionData': institutionData?.toJson(),
      'pan': pan,
      'pinBlock': pinBlock,
      'receiptNumber': receiptNumber,
      'respCode': respCode,
      'responseMessage': responseMessage,
      'status': status,
      'successResponse': successResponse,
      'systemTraceAuditNo': systemTraceAuditNo,
      'terminalId': terminalId,
      'transactionDate': transactionDate,
      'transactionDateTime': transactionDateTime,
      'transactionTime': transactionTime,
      'transactionType': transactionType,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  Transaction copyWith({
    String? amount,
    String? rRN,
    String? sTAN,
    String? accountBalance,
    String? acquiringInstitutionIdCode,
    String? authCode,
    String? cardCardSequenceNum,
    String? cardExpireData,
    String? forwardingInstCode,
    InstitutionData? institutionData,
    String? pan,
    String? pinBlock,
    String? receiptNumber,
    String? respCode,
    String? responseMessage,
    bool? status,
    String? successResponse,
    String? systemTraceAuditNo,
    String? terminalId,
    String? transactionDate,
    String? transactionDateTime,
    String? transactionTime,
    String? transactionType,
    String? createdAt,
    String? updatedAt,
  }) {
    return Transaction(
      amount: amount ?? this.amount,
      rRN: rRN ?? this.rRN,
      sTAN: sTAN ?? this.sTAN,
      accountBalance: accountBalance ?? this.accountBalance,
      acquiringInstitutionIdCode: acquiringInstitutionIdCode ?? this.acquiringInstitutionIdCode,
      authCode: authCode ?? this.authCode,
      cardCardSequenceNum: cardCardSequenceNum ?? this.cardCardSequenceNum,
      cardExpireData: cardExpireData ?? this.cardExpireData,
      forwardingInstCode: forwardingInstCode ?? this.forwardingInstCode,
      institutionData: institutionData ?? this.institutionData,
      pan: pan ?? this.pan,
      pinBlock: pinBlock ?? this.pinBlock,
      receiptNumber: receiptNumber ?? this.receiptNumber,
      respCode: respCode ?? this.respCode,
      responseMessage: responseMessage ?? this.responseMessage,
      status: status ?? this.status,
      successResponse: successResponse ?? this.successResponse,
      systemTraceAuditNo: systemTraceAuditNo ?? this.systemTraceAuditNo,
      terminalId: terminalId ?? this.terminalId,
      transactionDate: transactionDate ?? this.transactionDate,
      transactionDateTime: transactionDateTime ?? this.transactionDateTime,
      transactionTime: transactionTime ?? this.transactionTime,
      transactionType: transactionType ?? this.transactionType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        amount,
        rRN,
        sTAN,
        accountBalance,
        acquiringInstitutionIdCode,
        authCode,
        cardCardSequenceNum,
        cardExpireData,
        forwardingInstCode,
        institutionData,
        pan,
        pinBlock,
        receiptNumber,
        respCode,
        responseMessage,
        status,
        successResponse,
        systemTraceAuditNo,
        terminalId,
        transactionDate,
        transactionDateTime,
        transactionTime,
        transactionType,
        createdAt,
        updatedAt,
      ];
}

class InstitutionData extends Equatable {
  final String? merchantNo;
  final String? amount;
  final String? accountType;
  final String? transactionType;
  final String? merchantName;
  final String? tid;

  const InstitutionData({
    this.merchantNo,
    this.amount,
    this.accountType,
    this.transactionType,
    this.merchantName,
    this.tid,
  });

  factory InstitutionData.fromJson(Map<String, dynamic> json) {
    return InstitutionData(
      merchantNo: json['merchantNo'],
      amount: json['amount'],
      accountType: json['accountType'],
      transactionType: json['transactionType'],
      merchantName: json['merchantName'],
      tid: json['tid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'merchantNo': merchantNo,
      'amount': amount,
      'accountType': accountType,
      'transactionType': transactionType,
      'merchantName': merchantName,
      'tid': tid,
    };
  }

  InstitutionData copyWith({
    String? merchantNo,
    String? amount,
    String? accountType,
    String? transactionType,
    String? merchantName,
    String? tid,
  }) {
    return InstitutionData(
      merchantNo: merchantNo ?? this.merchantNo,
      amount: amount ?? this.amount,
      accountType: accountType ?? this.accountType,
      transactionType: transactionType ?? this.transactionType,
      merchantName: merchantName ?? this.merchantName,
      tid: tid ?? this.tid,
    );
  }

  @override
  List<Object?> get props => [
        merchantNo,
        amount,
        accountType,
        transactionType,
        merchantName,
        tid,
      ];
}

class MerchantDetails extends Equatable {
  final String? merchantName;
  final String? serialnumber;
  final String? mid;
  final String? tid;
  final String? merchantaddress;

  const MerchantDetails({
    this.merchantName,
    this.serialnumber,
    this.mid,
    this.tid,
    this.merchantaddress,
  });

  factory MerchantDetails.fromJson(Map<String, dynamic> json) {
    return MerchantDetails(
      merchantName: json['merchantName'],
      serialnumber: json['serialnumber'],
      mid: json['mid'],
      tid: json['tid'],
      merchantaddress: json['merchantaddress'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'merchantName': merchantName,
      'serialnumber': serialnumber,
      'mid': mid,
      'tid': tid,
      'merchantaddress': merchantaddress,
    };
  }

  MerchantDetails copyWith({
    String? merchantName,
    String? serialnumber,
    String? mid,
    String? tid,
    String? merchantaddress,
  }) {
    return MerchantDetails(
      merchantName: merchantName ?? this.merchantName,
      serialnumber: serialnumber ?? this.serialnumber,
      mid: mid ?? this.mid,
      tid: tid ?? this.tid,
      merchantaddress: merchantaddress ?? this.merchantaddress,
    );
  }

  @override
  List<Object?> get props => [
        merchantName,
        serialnumber,
        mid,
        tid,
        merchantaddress,
      ];
}