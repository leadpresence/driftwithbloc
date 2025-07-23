// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_app_database.dart';

// ignore_for_file: type=lint
class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, TransactionEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<String> amount = GeneratedColumn<String>(
      'amount', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _rRNMeta = const VerificationMeta('rRN');
  @override
  late final GeneratedColumn<String> rRN = GeneratedColumn<String>(
      'r_r_n', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sTANMeta = const VerificationMeta('sTAN');
  @override
  late final GeneratedColumn<String> sTAN = GeneratedColumn<String>(
      's_t_a_n', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _accountBalanceMeta =
      const VerificationMeta('accountBalance');
  @override
  late final GeneratedColumn<String> accountBalance = GeneratedColumn<String>(
      'account_balance', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _acquiringInstitutionIdCodeMeta =
      const VerificationMeta('acquiringInstitutionIdCode');
  @override
  late final GeneratedColumn<String> acquiringInstitutionIdCode =
      GeneratedColumn<String>(
          'acquiring_institution_id_code', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _authCodeMeta =
      const VerificationMeta('authCode');
  @override
  late final GeneratedColumn<String> authCode = GeneratedColumn<String>(
      'auth_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cardCardSequenceNumMeta =
      const VerificationMeta('cardCardSequenceNum');
  @override
  late final GeneratedColumn<String> cardCardSequenceNum =
      GeneratedColumn<String>('card_card_sequence_num', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cardExpireDataMeta =
      const VerificationMeta('cardExpireData');
  @override
  late final GeneratedColumn<String> cardExpireData = GeneratedColumn<String>(
      'card_expire_data', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _forwardingInstCodeMeta =
      const VerificationMeta('forwardingInstCode');
  @override
  late final GeneratedColumn<String> forwardingInstCode =
      GeneratedColumn<String>('forwarding_inst_code', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _institutionDataJsonMeta =
      const VerificationMeta('institutionDataJson');
  @override
  late final GeneratedColumn<String> institutionDataJson =
      GeneratedColumn<String>('institution_data_json', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _panMeta = const VerificationMeta('pan');
  @override
  late final GeneratedColumn<String> pan = GeneratedColumn<String>(
      'pan', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _pinBlockMeta =
      const VerificationMeta('pinBlock');
  @override
  late final GeneratedColumn<String> pinBlock = GeneratedColumn<String>(
      'pin_block', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _receiptNumberMeta =
      const VerificationMeta('receiptNumber');
  @override
  late final GeneratedColumn<String> receiptNumber = GeneratedColumn<String>(
      'receipt_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _respCodeMeta =
      const VerificationMeta('respCode');
  @override
  late final GeneratedColumn<String> respCode = GeneratedColumn<String>(
      'resp_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _responseMessageMeta =
      const VerificationMeta('responseMessage');
  @override
  late final GeneratedColumn<String> responseMessage = GeneratedColumn<String>(
      'response_message', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<bool> status = GeneratedColumn<bool>(
      'status', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("status" IN (0, 1))'));
  static const VerificationMeta _successResponseMeta =
      const VerificationMeta('successResponse');
  @override
  late final GeneratedColumn<String> successResponse = GeneratedColumn<String>(
      'success_response', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _systemTraceAuditNoMeta =
      const VerificationMeta('systemTraceAuditNo');
  @override
  late final GeneratedColumn<String> systemTraceAuditNo =
      GeneratedColumn<String>('system_trace_audit_no', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _terminalIdMeta =
      const VerificationMeta('terminalId');
  @override
  late final GeneratedColumn<String> terminalId = GeneratedColumn<String>(
      'terminal_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _transactionDateMeta =
      const VerificationMeta('transactionDate');
  @override
  late final GeneratedColumn<String> transactionDate = GeneratedColumn<String>(
      'transaction_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _transactionDateTimeMeta =
      const VerificationMeta('transactionDateTime');
  @override
  late final GeneratedColumn<String> transactionDateTime =
      GeneratedColumn<String>('transaction_date_time', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _transactionTimeMeta =
      const VerificationMeta('transactionTime');
  @override
  late final GeneratedColumn<String> transactionTime = GeneratedColumn<String>(
      'transaction_time', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _transactionTypeMeta =
      const VerificationMeta('transactionType');
  @override
  late final GeneratedColumn<String> transactionType = GeneratedColumn<String>(
      'transaction_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        amount,
        rRN,
        sTAN,
        accountBalance,
        acquiringInstitutionIdCode,
        authCode,
        cardCardSequenceNum,
        cardExpireData,
        forwardingInstCode,
        institutionDataJson,
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
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<TransactionEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    }
    if (data.containsKey('r_r_n')) {
      context.handle(
          _rRNMeta, rRN.isAcceptableOrUnknown(data['r_r_n']!, _rRNMeta));
    }
    if (data.containsKey('s_t_a_n')) {
      context.handle(
          _sTANMeta, sTAN.isAcceptableOrUnknown(data['s_t_a_n']!, _sTANMeta));
    }
    if (data.containsKey('account_balance')) {
      context.handle(
          _accountBalanceMeta,
          accountBalance.isAcceptableOrUnknown(
              data['account_balance']!, _accountBalanceMeta));
    }
    if (data.containsKey('acquiring_institution_id_code')) {
      context.handle(
          _acquiringInstitutionIdCodeMeta,
          acquiringInstitutionIdCode.isAcceptableOrUnknown(
              data['acquiring_institution_id_code']!,
              _acquiringInstitutionIdCodeMeta));
    }
    if (data.containsKey('auth_code')) {
      context.handle(_authCodeMeta,
          authCode.isAcceptableOrUnknown(data['auth_code']!, _authCodeMeta));
    }
    if (data.containsKey('card_card_sequence_num')) {
      context.handle(
          _cardCardSequenceNumMeta,
          cardCardSequenceNum.isAcceptableOrUnknown(
              data['card_card_sequence_num']!, _cardCardSequenceNumMeta));
    }
    if (data.containsKey('card_expire_data')) {
      context.handle(
          _cardExpireDataMeta,
          cardExpireData.isAcceptableOrUnknown(
              data['card_expire_data']!, _cardExpireDataMeta));
    }
    if (data.containsKey('forwarding_inst_code')) {
      context.handle(
          _forwardingInstCodeMeta,
          forwardingInstCode.isAcceptableOrUnknown(
              data['forwarding_inst_code']!, _forwardingInstCodeMeta));
    }
    if (data.containsKey('institution_data_json')) {
      context.handle(
          _institutionDataJsonMeta,
          institutionDataJson.isAcceptableOrUnknown(
              data['institution_data_json']!, _institutionDataJsonMeta));
    }
    if (data.containsKey('pan')) {
      context.handle(
          _panMeta, pan.isAcceptableOrUnknown(data['pan']!, _panMeta));
    }
    if (data.containsKey('pin_block')) {
      context.handle(_pinBlockMeta,
          pinBlock.isAcceptableOrUnknown(data['pin_block']!, _pinBlockMeta));
    }
    if (data.containsKey('receipt_number')) {
      context.handle(
          _receiptNumberMeta,
          receiptNumber.isAcceptableOrUnknown(
              data['receipt_number']!, _receiptNumberMeta));
    }
    if (data.containsKey('resp_code')) {
      context.handle(_respCodeMeta,
          respCode.isAcceptableOrUnknown(data['resp_code']!, _respCodeMeta));
    }
    if (data.containsKey('response_message')) {
      context.handle(
          _responseMessageMeta,
          responseMessage.isAcceptableOrUnknown(
              data['response_message']!, _responseMessageMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('success_response')) {
      context.handle(
          _successResponseMeta,
          successResponse.isAcceptableOrUnknown(
              data['success_response']!, _successResponseMeta));
    }
    if (data.containsKey('system_trace_audit_no')) {
      context.handle(
          _systemTraceAuditNoMeta,
          systemTraceAuditNo.isAcceptableOrUnknown(
              data['system_trace_audit_no']!, _systemTraceAuditNoMeta));
    }
    if (data.containsKey('terminal_id')) {
      context.handle(
          _terminalIdMeta,
          terminalId.isAcceptableOrUnknown(
              data['terminal_id']!, _terminalIdMeta));
    }
    if (data.containsKey('transaction_date')) {
      context.handle(
          _transactionDateMeta,
          transactionDate.isAcceptableOrUnknown(
              data['transaction_date']!, _transactionDateMeta));
    }
    if (data.containsKey('transaction_date_time')) {
      context.handle(
          _transactionDateTimeMeta,
          transactionDateTime.isAcceptableOrUnknown(
              data['transaction_date_time']!, _transactionDateTimeMeta));
    }
    if (data.containsKey('transaction_time')) {
      context.handle(
          _transactionTimeMeta,
          transactionTime.isAcceptableOrUnknown(
              data['transaction_time']!, _transactionTimeMeta));
    }
    if (data.containsKey('transaction_type')) {
      context.handle(
          _transactionTypeMeta,
          transactionType.isAcceptableOrUnknown(
              data['transaction_type']!, _transactionTypeMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}amount']),
      rRN: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}r_r_n']),
      sTAN: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}s_t_a_n']),
      accountBalance: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_balance']),
      acquiringInstitutionIdCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}acquiring_institution_id_code']),
      authCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}auth_code']),
      cardCardSequenceNum: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}card_card_sequence_num']),
      cardExpireData: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}card_expire_data']),
      forwardingInstCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}forwarding_inst_code']),
      institutionDataJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}institution_data_json']),
      pan: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pan']),
      pinBlock: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pin_block']),
      receiptNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}receipt_number']),
      respCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resp_code']),
      responseMessage: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}response_message']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}status']),
      successResponse: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}success_response']),
      systemTraceAuditNo: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}system_trace_audit_no']),
      terminalId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}terminal_id']),
      transactionDate: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}transaction_date']),
      transactionDateTime: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}transaction_date_time']),
      transactionTime: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}transaction_time']),
      transactionType: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}transaction_type']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class TransactionEntity extends DataClass
    implements Insertable<TransactionEntity> {
  final int id;
  final String? amount;
  final String? rRN;
  final String? sTAN;
  final String? accountBalance;
  final String? acquiringInstitutionIdCode;
  final String? authCode;
  final String? cardCardSequenceNum;
  final String? cardExpireData;
  final String? forwardingInstCode;
  final String? institutionDataJson;
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
  final DateTime createdAt;
  final DateTime updatedAt;
  const TransactionEntity(
      {required this.id,
      this.amount,
      this.rRN,
      this.sTAN,
      this.accountBalance,
      this.acquiringInstitutionIdCode,
      this.authCode,
      this.cardCardSequenceNum,
      this.cardExpireData,
      this.forwardingInstCode,
      this.institutionDataJson,
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
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<String>(amount);
    }
    if (!nullToAbsent || rRN != null) {
      map['r_r_n'] = Variable<String>(rRN);
    }
    if (!nullToAbsent || sTAN != null) {
      map['s_t_a_n'] = Variable<String>(sTAN);
    }
    if (!nullToAbsent || accountBalance != null) {
      map['account_balance'] = Variable<String>(accountBalance);
    }
    if (!nullToAbsent || acquiringInstitutionIdCode != null) {
      map['acquiring_institution_id_code'] =
          Variable<String>(acquiringInstitutionIdCode);
    }
    if (!nullToAbsent || authCode != null) {
      map['auth_code'] = Variable<String>(authCode);
    }
    if (!nullToAbsent || cardCardSequenceNum != null) {
      map['card_card_sequence_num'] = Variable<String>(cardCardSequenceNum);
    }
    if (!nullToAbsent || cardExpireData != null) {
      map['card_expire_data'] = Variable<String>(cardExpireData);
    }
    if (!nullToAbsent || forwardingInstCode != null) {
      map['forwarding_inst_code'] = Variable<String>(forwardingInstCode);
    }
    if (!nullToAbsent || institutionDataJson != null) {
      map['institution_data_json'] = Variable<String>(institutionDataJson);
    }
    if (!nullToAbsent || pan != null) {
      map['pan'] = Variable<String>(pan);
    }
    if (!nullToAbsent || pinBlock != null) {
      map['pin_block'] = Variable<String>(pinBlock);
    }
    if (!nullToAbsent || receiptNumber != null) {
      map['receipt_number'] = Variable<String>(receiptNumber);
    }
    if (!nullToAbsent || respCode != null) {
      map['resp_code'] = Variable<String>(respCode);
    }
    if (!nullToAbsent || responseMessage != null) {
      map['response_message'] = Variable<String>(responseMessage);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<bool>(status);
    }
    if (!nullToAbsent || successResponse != null) {
      map['success_response'] = Variable<String>(successResponse);
    }
    if (!nullToAbsent || systemTraceAuditNo != null) {
      map['system_trace_audit_no'] = Variable<String>(systemTraceAuditNo);
    }
    if (!nullToAbsent || terminalId != null) {
      map['terminal_id'] = Variable<String>(terminalId);
    }
    if (!nullToAbsent || transactionDate != null) {
      map['transaction_date'] = Variable<String>(transactionDate);
    }
    if (!nullToAbsent || transactionDateTime != null) {
      map['transaction_date_time'] = Variable<String>(transactionDateTime);
    }
    if (!nullToAbsent || transactionTime != null) {
      map['transaction_time'] = Variable<String>(transactionTime);
    }
    if (!nullToAbsent || transactionType != null) {
      map['transaction_type'] = Variable<String>(transactionType);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      rRN: rRN == null && nullToAbsent ? const Value.absent() : Value(rRN),
      sTAN: sTAN == null && nullToAbsent ? const Value.absent() : Value(sTAN),
      accountBalance: accountBalance == null && nullToAbsent
          ? const Value.absent()
          : Value(accountBalance),
      acquiringInstitutionIdCode:
          acquiringInstitutionIdCode == null && nullToAbsent
              ? const Value.absent()
              : Value(acquiringInstitutionIdCode),
      authCode: authCode == null && nullToAbsent
          ? const Value.absent()
          : Value(authCode),
      cardCardSequenceNum: cardCardSequenceNum == null && nullToAbsent
          ? const Value.absent()
          : Value(cardCardSequenceNum),
      cardExpireData: cardExpireData == null && nullToAbsent
          ? const Value.absent()
          : Value(cardExpireData),
      forwardingInstCode: forwardingInstCode == null && nullToAbsent
          ? const Value.absent()
          : Value(forwardingInstCode),
      institutionDataJson: institutionDataJson == null && nullToAbsent
          ? const Value.absent()
          : Value(institutionDataJson),
      pan: pan == null && nullToAbsent ? const Value.absent() : Value(pan),
      pinBlock: pinBlock == null && nullToAbsent
          ? const Value.absent()
          : Value(pinBlock),
      receiptNumber: receiptNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(receiptNumber),
      respCode: respCode == null && nullToAbsent
          ? const Value.absent()
          : Value(respCode),
      responseMessage: responseMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(responseMessage),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      successResponse: successResponse == null && nullToAbsent
          ? const Value.absent()
          : Value(successResponse),
      systemTraceAuditNo: systemTraceAuditNo == null && nullToAbsent
          ? const Value.absent()
          : Value(systemTraceAuditNo),
      terminalId: terminalId == null && nullToAbsent
          ? const Value.absent()
          : Value(terminalId),
      transactionDate: transactionDate == null && nullToAbsent
          ? const Value.absent()
          : Value(transactionDate),
      transactionDateTime: transactionDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(transactionDateTime),
      transactionTime: transactionTime == null && nullToAbsent
          ? const Value.absent()
          : Value(transactionTime),
      transactionType: transactionType == null && nullToAbsent
          ? const Value.absent()
          : Value(transactionType),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TransactionEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionEntity(
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<String?>(json['amount']),
      rRN: serializer.fromJson<String?>(json['rRN']),
      sTAN: serializer.fromJson<String?>(json['sTAN']),
      accountBalance: serializer.fromJson<String?>(json['accountBalance']),
      acquiringInstitutionIdCode:
          serializer.fromJson<String?>(json['acquiringInstitutionIdCode']),
      authCode: serializer.fromJson<String?>(json['authCode']),
      cardCardSequenceNum:
          serializer.fromJson<String?>(json['cardCardSequenceNum']),
      cardExpireData: serializer.fromJson<String?>(json['cardExpireData']),
      forwardingInstCode:
          serializer.fromJson<String?>(json['forwardingInstCode']),
      institutionDataJson:
          serializer.fromJson<String?>(json['institutionDataJson']),
      pan: serializer.fromJson<String?>(json['pan']),
      pinBlock: serializer.fromJson<String?>(json['pinBlock']),
      receiptNumber: serializer.fromJson<String?>(json['receiptNumber']),
      respCode: serializer.fromJson<String?>(json['respCode']),
      responseMessage: serializer.fromJson<String?>(json['responseMessage']),
      status: serializer.fromJson<bool?>(json['status']),
      successResponse: serializer.fromJson<String?>(json['successResponse']),
      systemTraceAuditNo:
          serializer.fromJson<String?>(json['systemTraceAuditNo']),
      terminalId: serializer.fromJson<String?>(json['terminalId']),
      transactionDate: serializer.fromJson<String?>(json['transactionDate']),
      transactionDateTime:
          serializer.fromJson<String?>(json['transactionDateTime']),
      transactionTime: serializer.fromJson<String?>(json['transactionTime']),
      transactionType: serializer.fromJson<String?>(json['transactionType']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<String?>(amount),
      'rRN': serializer.toJson<String?>(rRN),
      'sTAN': serializer.toJson<String?>(sTAN),
      'accountBalance': serializer.toJson<String?>(accountBalance),
      'acquiringInstitutionIdCode':
          serializer.toJson<String?>(acquiringInstitutionIdCode),
      'authCode': serializer.toJson<String?>(authCode),
      'cardCardSequenceNum': serializer.toJson<String?>(cardCardSequenceNum),
      'cardExpireData': serializer.toJson<String?>(cardExpireData),
      'forwardingInstCode': serializer.toJson<String?>(forwardingInstCode),
      'institutionDataJson': serializer.toJson<String?>(institutionDataJson),
      'pan': serializer.toJson<String?>(pan),
      'pinBlock': serializer.toJson<String?>(pinBlock),
      'receiptNumber': serializer.toJson<String?>(receiptNumber),
      'respCode': serializer.toJson<String?>(respCode),
      'responseMessage': serializer.toJson<String?>(responseMessage),
      'status': serializer.toJson<bool?>(status),
      'successResponse': serializer.toJson<String?>(successResponse),
      'systemTraceAuditNo': serializer.toJson<String?>(systemTraceAuditNo),
      'terminalId': serializer.toJson<String?>(terminalId),
      'transactionDate': serializer.toJson<String?>(transactionDate),
      'transactionDateTime': serializer.toJson<String?>(transactionDateTime),
      'transactionTime': serializer.toJson<String?>(transactionTime),
      'transactionType': serializer.toJson<String?>(transactionType),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  TransactionEntity copyWith(
          {int? id,
          Value<String?> amount = const Value.absent(),
          Value<String?> rRN = const Value.absent(),
          Value<String?> sTAN = const Value.absent(),
          Value<String?> accountBalance = const Value.absent(),
          Value<String?> acquiringInstitutionIdCode = const Value.absent(),
          Value<String?> authCode = const Value.absent(),
          Value<String?> cardCardSequenceNum = const Value.absent(),
          Value<String?> cardExpireData = const Value.absent(),
          Value<String?> forwardingInstCode = const Value.absent(),
          Value<String?> institutionDataJson = const Value.absent(),
          Value<String?> pan = const Value.absent(),
          Value<String?> pinBlock = const Value.absent(),
          Value<String?> receiptNumber = const Value.absent(),
          Value<String?> respCode = const Value.absent(),
          Value<String?> responseMessage = const Value.absent(),
          Value<bool?> status = const Value.absent(),
          Value<String?> successResponse = const Value.absent(),
          Value<String?> systemTraceAuditNo = const Value.absent(),
          Value<String?> terminalId = const Value.absent(),
          Value<String?> transactionDate = const Value.absent(),
          Value<String?> transactionDateTime = const Value.absent(),
          Value<String?> transactionTime = const Value.absent(),
          Value<String?> transactionType = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      TransactionEntity(
        id: id ?? this.id,
        amount: amount.present ? amount.value : this.amount,
        rRN: rRN.present ? rRN.value : this.rRN,
        sTAN: sTAN.present ? sTAN.value : this.sTAN,
        accountBalance:
            accountBalance.present ? accountBalance.value : this.accountBalance,
        acquiringInstitutionIdCode: acquiringInstitutionIdCode.present
            ? acquiringInstitutionIdCode.value
            : this.acquiringInstitutionIdCode,
        authCode: authCode.present ? authCode.value : this.authCode,
        cardCardSequenceNum: cardCardSequenceNum.present
            ? cardCardSequenceNum.value
            : this.cardCardSequenceNum,
        cardExpireData:
            cardExpireData.present ? cardExpireData.value : this.cardExpireData,
        forwardingInstCode: forwardingInstCode.present
            ? forwardingInstCode.value
            : this.forwardingInstCode,
        institutionDataJson: institutionDataJson.present
            ? institutionDataJson.value
            : this.institutionDataJson,
        pan: pan.present ? pan.value : this.pan,
        pinBlock: pinBlock.present ? pinBlock.value : this.pinBlock,
        receiptNumber:
            receiptNumber.present ? receiptNumber.value : this.receiptNumber,
        respCode: respCode.present ? respCode.value : this.respCode,
        responseMessage: responseMessage.present
            ? responseMessage.value
            : this.responseMessage,
        status: status.present ? status.value : this.status,
        successResponse: successResponse.present
            ? successResponse.value
            : this.successResponse,
        systemTraceAuditNo: systemTraceAuditNo.present
            ? systemTraceAuditNo.value
            : this.systemTraceAuditNo,
        terminalId: terminalId.present ? terminalId.value : this.terminalId,
        transactionDate: transactionDate.present
            ? transactionDate.value
            : this.transactionDate,
        transactionDateTime: transactionDateTime.present
            ? transactionDateTime.value
            : this.transactionDateTime,
        transactionTime: transactionTime.present
            ? transactionTime.value
            : this.transactionTime,
        transactionType: transactionType.present
            ? transactionType.value
            : this.transactionType,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  TransactionEntity copyWithCompanion(TransactionsCompanion data) {
    return TransactionEntity(
      id: data.id.present ? data.id.value : this.id,
      amount: data.amount.present ? data.amount.value : this.amount,
      rRN: data.rRN.present ? data.rRN.value : this.rRN,
      sTAN: data.sTAN.present ? data.sTAN.value : this.sTAN,
      accountBalance: data.accountBalance.present
          ? data.accountBalance.value
          : this.accountBalance,
      acquiringInstitutionIdCode: data.acquiringInstitutionIdCode.present
          ? data.acquiringInstitutionIdCode.value
          : this.acquiringInstitutionIdCode,
      authCode: data.authCode.present ? data.authCode.value : this.authCode,
      cardCardSequenceNum: data.cardCardSequenceNum.present
          ? data.cardCardSequenceNum.value
          : this.cardCardSequenceNum,
      cardExpireData: data.cardExpireData.present
          ? data.cardExpireData.value
          : this.cardExpireData,
      forwardingInstCode: data.forwardingInstCode.present
          ? data.forwardingInstCode.value
          : this.forwardingInstCode,
      institutionDataJson: data.institutionDataJson.present
          ? data.institutionDataJson.value
          : this.institutionDataJson,
      pan: data.pan.present ? data.pan.value : this.pan,
      pinBlock: data.pinBlock.present ? data.pinBlock.value : this.pinBlock,
      receiptNumber: data.receiptNumber.present
          ? data.receiptNumber.value
          : this.receiptNumber,
      respCode: data.respCode.present ? data.respCode.value : this.respCode,
      responseMessage: data.responseMessage.present
          ? data.responseMessage.value
          : this.responseMessage,
      status: data.status.present ? data.status.value : this.status,
      successResponse: data.successResponse.present
          ? data.successResponse.value
          : this.successResponse,
      systemTraceAuditNo: data.systemTraceAuditNo.present
          ? data.systemTraceAuditNo.value
          : this.systemTraceAuditNo,
      terminalId:
          data.terminalId.present ? data.terminalId.value : this.terminalId,
      transactionDate: data.transactionDate.present
          ? data.transactionDate.value
          : this.transactionDate,
      transactionDateTime: data.transactionDateTime.present
          ? data.transactionDateTime.value
          : this.transactionDateTime,
      transactionTime: data.transactionTime.present
          ? data.transactionTime.value
          : this.transactionTime,
      transactionType: data.transactionType.present
          ? data.transactionType.value
          : this.transactionType,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionEntity(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('rRN: $rRN, ')
          ..write('sTAN: $sTAN, ')
          ..write('accountBalance: $accountBalance, ')
          ..write('acquiringInstitutionIdCode: $acquiringInstitutionIdCode, ')
          ..write('authCode: $authCode, ')
          ..write('cardCardSequenceNum: $cardCardSequenceNum, ')
          ..write('cardExpireData: $cardExpireData, ')
          ..write('forwardingInstCode: $forwardingInstCode, ')
          ..write('institutionDataJson: $institutionDataJson, ')
          ..write('pan: $pan, ')
          ..write('pinBlock: $pinBlock, ')
          ..write('receiptNumber: $receiptNumber, ')
          ..write('respCode: $respCode, ')
          ..write('responseMessage: $responseMessage, ')
          ..write('status: $status, ')
          ..write('successResponse: $successResponse, ')
          ..write('systemTraceAuditNo: $systemTraceAuditNo, ')
          ..write('terminalId: $terminalId, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('transactionDateTime: $transactionDateTime, ')
          ..write('transactionTime: $transactionTime, ')
          ..write('transactionType: $transactionType, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        amount,
        rRN,
        sTAN,
        accountBalance,
        acquiringInstitutionIdCode,
        authCode,
        cardCardSequenceNum,
        cardExpireData,
        forwardingInstCode,
        institutionDataJson,
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
        updatedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionEntity &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.rRN == this.rRN &&
          other.sTAN == this.sTAN &&
          other.accountBalance == this.accountBalance &&
          other.acquiringInstitutionIdCode == this.acquiringInstitutionIdCode &&
          other.authCode == this.authCode &&
          other.cardCardSequenceNum == this.cardCardSequenceNum &&
          other.cardExpireData == this.cardExpireData &&
          other.forwardingInstCode == this.forwardingInstCode &&
          other.institutionDataJson == this.institutionDataJson &&
          other.pan == this.pan &&
          other.pinBlock == this.pinBlock &&
          other.receiptNumber == this.receiptNumber &&
          other.respCode == this.respCode &&
          other.responseMessage == this.responseMessage &&
          other.status == this.status &&
          other.successResponse == this.successResponse &&
          other.systemTraceAuditNo == this.systemTraceAuditNo &&
          other.terminalId == this.terminalId &&
          other.transactionDate == this.transactionDate &&
          other.transactionDateTime == this.transactionDateTime &&
          other.transactionTime == this.transactionTime &&
          other.transactionType == this.transactionType &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TransactionsCompanion extends UpdateCompanion<TransactionEntity> {
  final Value<int> id;
  final Value<String?> amount;
  final Value<String?> rRN;
  final Value<String?> sTAN;
  final Value<String?> accountBalance;
  final Value<String?> acquiringInstitutionIdCode;
  final Value<String?> authCode;
  final Value<String?> cardCardSequenceNum;
  final Value<String?> cardExpireData;
  final Value<String?> forwardingInstCode;
  final Value<String?> institutionDataJson;
  final Value<String?> pan;
  final Value<String?> pinBlock;
  final Value<String?> receiptNumber;
  final Value<String?> respCode;
  final Value<String?> responseMessage;
  final Value<bool?> status;
  final Value<String?> successResponse;
  final Value<String?> systemTraceAuditNo;
  final Value<String?> terminalId;
  final Value<String?> transactionDate;
  final Value<String?> transactionDateTime;
  final Value<String?> transactionTime;
  final Value<String?> transactionType;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.rRN = const Value.absent(),
    this.sTAN = const Value.absent(),
    this.accountBalance = const Value.absent(),
    this.acquiringInstitutionIdCode = const Value.absent(),
    this.authCode = const Value.absent(),
    this.cardCardSequenceNum = const Value.absent(),
    this.cardExpireData = const Value.absent(),
    this.forwardingInstCode = const Value.absent(),
    this.institutionDataJson = const Value.absent(),
    this.pan = const Value.absent(),
    this.pinBlock = const Value.absent(),
    this.receiptNumber = const Value.absent(),
    this.respCode = const Value.absent(),
    this.responseMessage = const Value.absent(),
    this.status = const Value.absent(),
    this.successResponse = const Value.absent(),
    this.systemTraceAuditNo = const Value.absent(),
    this.terminalId = const Value.absent(),
    this.transactionDate = const Value.absent(),
    this.transactionDateTime = const Value.absent(),
    this.transactionTime = const Value.absent(),
    this.transactionType = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.rRN = const Value.absent(),
    this.sTAN = const Value.absent(),
    this.accountBalance = const Value.absent(),
    this.acquiringInstitutionIdCode = const Value.absent(),
    this.authCode = const Value.absent(),
    this.cardCardSequenceNum = const Value.absent(),
    this.cardExpireData = const Value.absent(),
    this.forwardingInstCode = const Value.absent(),
    this.institutionDataJson = const Value.absent(),
    this.pan = const Value.absent(),
    this.pinBlock = const Value.absent(),
    this.receiptNumber = const Value.absent(),
    this.respCode = const Value.absent(),
    this.responseMessage = const Value.absent(),
    this.status = const Value.absent(),
    this.successResponse = const Value.absent(),
    this.systemTraceAuditNo = const Value.absent(),
    this.terminalId = const Value.absent(),
    this.transactionDate = const Value.absent(),
    this.transactionDateTime = const Value.absent(),
    this.transactionTime = const Value.absent(),
    this.transactionType = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<TransactionEntity> custom({
    Expression<int>? id,
    Expression<String>? amount,
    Expression<String>? rRN,
    Expression<String>? sTAN,
    Expression<String>? accountBalance,
    Expression<String>? acquiringInstitutionIdCode,
    Expression<String>? authCode,
    Expression<String>? cardCardSequenceNum,
    Expression<String>? cardExpireData,
    Expression<String>? forwardingInstCode,
    Expression<String>? institutionDataJson,
    Expression<String>? pan,
    Expression<String>? pinBlock,
    Expression<String>? receiptNumber,
    Expression<String>? respCode,
    Expression<String>? responseMessage,
    Expression<bool>? status,
    Expression<String>? successResponse,
    Expression<String>? systemTraceAuditNo,
    Expression<String>? terminalId,
    Expression<String>? transactionDate,
    Expression<String>? transactionDateTime,
    Expression<String>? transactionTime,
    Expression<String>? transactionType,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (rRN != null) 'r_r_n': rRN,
      if (sTAN != null) 's_t_a_n': sTAN,
      if (accountBalance != null) 'account_balance': accountBalance,
      if (acquiringInstitutionIdCode != null)
        'acquiring_institution_id_code': acquiringInstitutionIdCode,
      if (authCode != null) 'auth_code': authCode,
      if (cardCardSequenceNum != null)
        'card_card_sequence_num': cardCardSequenceNum,
      if (cardExpireData != null) 'card_expire_data': cardExpireData,
      if (forwardingInstCode != null)
        'forwarding_inst_code': forwardingInstCode,
      if (institutionDataJson != null)
        'institution_data_json': institutionDataJson,
      if (pan != null) 'pan': pan,
      if (pinBlock != null) 'pin_block': pinBlock,
      if (receiptNumber != null) 'receipt_number': receiptNumber,
      if (respCode != null) 'resp_code': respCode,
      if (responseMessage != null) 'response_message': responseMessage,
      if (status != null) 'status': status,
      if (successResponse != null) 'success_response': successResponse,
      if (systemTraceAuditNo != null)
        'system_trace_audit_no': systemTraceAuditNo,
      if (terminalId != null) 'terminal_id': terminalId,
      if (transactionDate != null) 'transaction_date': transactionDate,
      if (transactionDateTime != null)
        'transaction_date_time': transactionDateTime,
      if (transactionTime != null) 'transaction_time': transactionTime,
      if (transactionType != null) 'transaction_type': transactionType,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TransactionsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? amount,
      Value<String?>? rRN,
      Value<String?>? sTAN,
      Value<String?>? accountBalance,
      Value<String?>? acquiringInstitutionIdCode,
      Value<String?>? authCode,
      Value<String?>? cardCardSequenceNum,
      Value<String?>? cardExpireData,
      Value<String?>? forwardingInstCode,
      Value<String?>? institutionDataJson,
      Value<String?>? pan,
      Value<String?>? pinBlock,
      Value<String?>? receiptNumber,
      Value<String?>? respCode,
      Value<String?>? responseMessage,
      Value<bool?>? status,
      Value<String?>? successResponse,
      Value<String?>? systemTraceAuditNo,
      Value<String?>? terminalId,
      Value<String?>? transactionDate,
      Value<String?>? transactionDateTime,
      Value<String?>? transactionTime,
      Value<String?>? transactionType,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      rRN: rRN ?? this.rRN,
      sTAN: sTAN ?? this.sTAN,
      accountBalance: accountBalance ?? this.accountBalance,
      acquiringInstitutionIdCode:
          acquiringInstitutionIdCode ?? this.acquiringInstitutionIdCode,
      authCode: authCode ?? this.authCode,
      cardCardSequenceNum: cardCardSequenceNum ?? this.cardCardSequenceNum,
      cardExpireData: cardExpireData ?? this.cardExpireData,
      forwardingInstCode: forwardingInstCode ?? this.forwardingInstCode,
      institutionDataJson: institutionDataJson ?? this.institutionDataJson,
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
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<String>(amount.value);
    }
    if (rRN.present) {
      map['r_r_n'] = Variable<String>(rRN.value);
    }
    if (sTAN.present) {
      map['s_t_a_n'] = Variable<String>(sTAN.value);
    }
    if (accountBalance.present) {
      map['account_balance'] = Variable<String>(accountBalance.value);
    }
    if (acquiringInstitutionIdCode.present) {
      map['acquiring_institution_id_code'] =
          Variable<String>(acquiringInstitutionIdCode.value);
    }
    if (authCode.present) {
      map['auth_code'] = Variable<String>(authCode.value);
    }
    if (cardCardSequenceNum.present) {
      map['card_card_sequence_num'] =
          Variable<String>(cardCardSequenceNum.value);
    }
    if (cardExpireData.present) {
      map['card_expire_data'] = Variable<String>(cardExpireData.value);
    }
    if (forwardingInstCode.present) {
      map['forwarding_inst_code'] = Variable<String>(forwardingInstCode.value);
    }
    if (institutionDataJson.present) {
      map['institution_data_json'] =
          Variable<String>(institutionDataJson.value);
    }
    if (pan.present) {
      map['pan'] = Variable<String>(pan.value);
    }
    if (pinBlock.present) {
      map['pin_block'] = Variable<String>(pinBlock.value);
    }
    if (receiptNumber.present) {
      map['receipt_number'] = Variable<String>(receiptNumber.value);
    }
    if (respCode.present) {
      map['resp_code'] = Variable<String>(respCode.value);
    }
    if (responseMessage.present) {
      map['response_message'] = Variable<String>(responseMessage.value);
    }
    if (status.present) {
      map['status'] = Variable<bool>(status.value);
    }
    if (successResponse.present) {
      map['success_response'] = Variable<String>(successResponse.value);
    }
    if (systemTraceAuditNo.present) {
      map['system_trace_audit_no'] = Variable<String>(systemTraceAuditNo.value);
    }
    if (terminalId.present) {
      map['terminal_id'] = Variable<String>(terminalId.value);
    }
    if (transactionDate.present) {
      map['transaction_date'] = Variable<String>(transactionDate.value);
    }
    if (transactionDateTime.present) {
      map['transaction_date_time'] =
          Variable<String>(transactionDateTime.value);
    }
    if (transactionTime.present) {
      map['transaction_time'] = Variable<String>(transactionTime.value);
    }
    if (transactionType.present) {
      map['transaction_type'] = Variable<String>(transactionType.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('rRN: $rRN, ')
          ..write('sTAN: $sTAN, ')
          ..write('accountBalance: $accountBalance, ')
          ..write('acquiringInstitutionIdCode: $acquiringInstitutionIdCode, ')
          ..write('authCode: $authCode, ')
          ..write('cardCardSequenceNum: $cardCardSequenceNum, ')
          ..write('cardExpireData: $cardExpireData, ')
          ..write('forwardingInstCode: $forwardingInstCode, ')
          ..write('institutionDataJson: $institutionDataJson, ')
          ..write('pan: $pan, ')
          ..write('pinBlock: $pinBlock, ')
          ..write('receiptNumber: $receiptNumber, ')
          ..write('respCode: $respCode, ')
          ..write('responseMessage: $responseMessage, ')
          ..write('status: $status, ')
          ..write('successResponse: $successResponse, ')
          ..write('systemTraceAuditNo: $systemTraceAuditNo, ')
          ..write('terminalId: $terminalId, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('transactionDateTime: $transactionDateTime, ')
          ..write('transactionTime: $transactionTime, ')
          ..write('transactionType: $transactionType, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $MerchantsTable extends Merchants
    with TableInfo<$MerchantsTable, MerchantEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MerchantsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _merchantNameMeta =
      const VerificationMeta('merchantName');
  @override
  late final GeneratedColumn<String> merchantName = GeneratedColumn<String>(
      'merchant_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _serialnumberMeta =
      const VerificationMeta('serialnumber');
  @override
  late final GeneratedColumn<String> serialnumber = GeneratedColumn<String>(
      'serialnumber', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _midMeta = const VerificationMeta('mid');
  @override
  late final GeneratedColumn<String> mid = GeneratedColumn<String>(
      'mid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _tidMeta = const VerificationMeta('tid');
  @override
  late final GeneratedColumn<String> tid = GeneratedColumn<String>(
      'tid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _merchantaddressMeta =
      const VerificationMeta('merchantaddress');
  @override
  late final GeneratedColumn<String> merchantaddress = GeneratedColumn<String>(
      'merchantaddress', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        merchantName,
        serialnumber,
        mid,
        tid,
        merchantaddress,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'merchants';
  @override
  VerificationContext validateIntegrity(Insertable<MerchantEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('merchant_name')) {
      context.handle(
          _merchantNameMeta,
          merchantName.isAcceptableOrUnknown(
              data['merchant_name']!, _merchantNameMeta));
    }
    if (data.containsKey('serialnumber')) {
      context.handle(
          _serialnumberMeta,
          serialnumber.isAcceptableOrUnknown(
              data['serialnumber']!, _serialnumberMeta));
    }
    if (data.containsKey('mid')) {
      context.handle(
          _midMeta, mid.isAcceptableOrUnknown(data['mid']!, _midMeta));
    }
    if (data.containsKey('tid')) {
      context.handle(
          _tidMeta, tid.isAcceptableOrUnknown(data['tid']!, _tidMeta));
    }
    if (data.containsKey('merchantaddress')) {
      context.handle(
          _merchantaddressMeta,
          merchantaddress.isAcceptableOrUnknown(
              data['merchantaddress']!, _merchantaddressMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MerchantEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MerchantEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      merchantName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}merchant_name']),
      serialnumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}serialnumber']),
      mid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mid']),
      tid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tid']),
      merchantaddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}merchantaddress']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $MerchantsTable createAlias(String alias) {
    return $MerchantsTable(attachedDatabase, alias);
  }
}

class MerchantEntity extends DataClass implements Insertable<MerchantEntity> {
  final int id;
  final String? merchantName;
  final String? serialnumber;
  final String? mid;
  final String? tid;
  final String? merchantaddress;
  final DateTime createdAt;
  final DateTime updatedAt;
  const MerchantEntity(
      {required this.id,
      this.merchantName,
      this.serialnumber,
      this.mid,
      this.tid,
      this.merchantaddress,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || merchantName != null) {
      map['merchant_name'] = Variable<String>(merchantName);
    }
    if (!nullToAbsent || serialnumber != null) {
      map['serialnumber'] = Variable<String>(serialnumber);
    }
    if (!nullToAbsent || mid != null) {
      map['mid'] = Variable<String>(mid);
    }
    if (!nullToAbsent || tid != null) {
      map['tid'] = Variable<String>(tid);
    }
    if (!nullToAbsent || merchantaddress != null) {
      map['merchantaddress'] = Variable<String>(merchantaddress);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MerchantsCompanion toCompanion(bool nullToAbsent) {
    return MerchantsCompanion(
      id: Value(id),
      merchantName: merchantName == null && nullToAbsent
          ? const Value.absent()
          : Value(merchantName),
      serialnumber: serialnumber == null && nullToAbsent
          ? const Value.absent()
          : Value(serialnumber),
      mid: mid == null && nullToAbsent ? const Value.absent() : Value(mid),
      tid: tid == null && nullToAbsent ? const Value.absent() : Value(tid),
      merchantaddress: merchantaddress == null && nullToAbsent
          ? const Value.absent()
          : Value(merchantaddress),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory MerchantEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MerchantEntity(
      id: serializer.fromJson<int>(json['id']),
      merchantName: serializer.fromJson<String?>(json['merchantName']),
      serialnumber: serializer.fromJson<String?>(json['serialnumber']),
      mid: serializer.fromJson<String?>(json['mid']),
      tid: serializer.fromJson<String?>(json['tid']),
      merchantaddress: serializer.fromJson<String?>(json['merchantaddress']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'merchantName': serializer.toJson<String?>(merchantName),
      'serialnumber': serializer.toJson<String?>(serialnumber),
      'mid': serializer.toJson<String?>(mid),
      'tid': serializer.toJson<String?>(tid),
      'merchantaddress': serializer.toJson<String?>(merchantaddress),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  MerchantEntity copyWith(
          {int? id,
          Value<String?> merchantName = const Value.absent(),
          Value<String?> serialnumber = const Value.absent(),
          Value<String?> mid = const Value.absent(),
          Value<String?> tid = const Value.absent(),
          Value<String?> merchantaddress = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      MerchantEntity(
        id: id ?? this.id,
        merchantName:
            merchantName.present ? merchantName.value : this.merchantName,
        serialnumber:
            serialnumber.present ? serialnumber.value : this.serialnumber,
        mid: mid.present ? mid.value : this.mid,
        tid: tid.present ? tid.value : this.tid,
        merchantaddress: merchantaddress.present
            ? merchantaddress.value
            : this.merchantaddress,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  MerchantEntity copyWithCompanion(MerchantsCompanion data) {
    return MerchantEntity(
      id: data.id.present ? data.id.value : this.id,
      merchantName: data.merchantName.present
          ? data.merchantName.value
          : this.merchantName,
      serialnumber: data.serialnumber.present
          ? data.serialnumber.value
          : this.serialnumber,
      mid: data.mid.present ? data.mid.value : this.mid,
      tid: data.tid.present ? data.tid.value : this.tid,
      merchantaddress: data.merchantaddress.present
          ? data.merchantaddress.value
          : this.merchantaddress,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MerchantEntity(')
          ..write('id: $id, ')
          ..write('merchantName: $merchantName, ')
          ..write('serialnumber: $serialnumber, ')
          ..write('mid: $mid, ')
          ..write('tid: $tid, ')
          ..write('merchantaddress: $merchantaddress, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, merchantName, serialnumber, mid, tid,
      merchantaddress, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MerchantEntity &&
          other.id == this.id &&
          other.merchantName == this.merchantName &&
          other.serialnumber == this.serialnumber &&
          other.mid == this.mid &&
          other.tid == this.tid &&
          other.merchantaddress == this.merchantaddress &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MerchantsCompanion extends UpdateCompanion<MerchantEntity> {
  final Value<int> id;
  final Value<String?> merchantName;
  final Value<String?> serialnumber;
  final Value<String?> mid;
  final Value<String?> tid;
  final Value<String?> merchantaddress;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const MerchantsCompanion({
    this.id = const Value.absent(),
    this.merchantName = const Value.absent(),
    this.serialnumber = const Value.absent(),
    this.mid = const Value.absent(),
    this.tid = const Value.absent(),
    this.merchantaddress = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  MerchantsCompanion.insert({
    this.id = const Value.absent(),
    this.merchantName = const Value.absent(),
    this.serialnumber = const Value.absent(),
    this.mid = const Value.absent(),
    this.tid = const Value.absent(),
    this.merchantaddress = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<MerchantEntity> custom({
    Expression<int>? id,
    Expression<String>? merchantName,
    Expression<String>? serialnumber,
    Expression<String>? mid,
    Expression<String>? tid,
    Expression<String>? merchantaddress,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (merchantName != null) 'merchant_name': merchantName,
      if (serialnumber != null) 'serialnumber': serialnumber,
      if (mid != null) 'mid': mid,
      if (tid != null) 'tid': tid,
      if (merchantaddress != null) 'merchantaddress': merchantaddress,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  MerchantsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? merchantName,
      Value<String?>? serialnumber,
      Value<String?>? mid,
      Value<String?>? tid,
      Value<String?>? merchantaddress,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return MerchantsCompanion(
      id: id ?? this.id,
      merchantName: merchantName ?? this.merchantName,
      serialnumber: serialnumber ?? this.serialnumber,
      mid: mid ?? this.mid,
      tid: tid ?? this.tid,
      merchantaddress: merchantaddress ?? this.merchantaddress,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (merchantName.present) {
      map['merchant_name'] = Variable<String>(merchantName.value);
    }
    if (serialnumber.present) {
      map['serialnumber'] = Variable<String>(serialnumber.value);
    }
    if (mid.present) {
      map['mid'] = Variable<String>(mid.value);
    }
    if (tid.present) {
      map['tid'] = Variable<String>(tid.value);
    }
    if (merchantaddress.present) {
      map['merchantaddress'] = Variable<String>(merchantaddress.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MerchantsCompanion(')
          ..write('id: $id, ')
          ..write('merchantName: $merchantName, ')
          ..write('serialnumber: $serialnumber, ')
          ..write('mid: $mid, ')
          ..write('tid: $tid, ')
          ..write('merchantaddress: $merchantaddress, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $MerchantsTable merchants = $MerchantsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [transactions, merchants];
}

typedef $$TransactionsTableCreateCompanionBuilder = TransactionsCompanion
    Function({
  Value<int> id,
  Value<String?> amount,
  Value<String?> rRN,
  Value<String?> sTAN,
  Value<String?> accountBalance,
  Value<String?> acquiringInstitutionIdCode,
  Value<String?> authCode,
  Value<String?> cardCardSequenceNum,
  Value<String?> cardExpireData,
  Value<String?> forwardingInstCode,
  Value<String?> institutionDataJson,
  Value<String?> pan,
  Value<String?> pinBlock,
  Value<String?> receiptNumber,
  Value<String?> respCode,
  Value<String?> responseMessage,
  Value<bool?> status,
  Value<String?> successResponse,
  Value<String?> systemTraceAuditNo,
  Value<String?> terminalId,
  Value<String?> transactionDate,
  Value<String?> transactionDateTime,
  Value<String?> transactionTime,
  Value<String?> transactionType,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$TransactionsTableUpdateCompanionBuilder = TransactionsCompanion
    Function({
  Value<int> id,
  Value<String?> amount,
  Value<String?> rRN,
  Value<String?> sTAN,
  Value<String?> accountBalance,
  Value<String?> acquiringInstitutionIdCode,
  Value<String?> authCode,
  Value<String?> cardCardSequenceNum,
  Value<String?> cardExpireData,
  Value<String?> forwardingInstCode,
  Value<String?> institutionDataJson,
  Value<String?> pan,
  Value<String?> pinBlock,
  Value<String?> receiptNumber,
  Value<String?> respCode,
  Value<String?> responseMessage,
  Value<bool?> status,
  Value<String?> successResponse,
  Value<String?> systemTraceAuditNo,
  Value<String?> terminalId,
  Value<String?> transactionDate,
  Value<String?> transactionDateTime,
  Value<String?> transactionTime,
  Value<String?> transactionType,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$TransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get rRN => $composableBuilder(
      column: $table.rRN, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sTAN => $composableBuilder(
      column: $table.sTAN, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accountBalance => $composableBuilder(
      column: $table.accountBalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get acquiringInstitutionIdCode => $composableBuilder(
      column: $table.acquiringInstitutionIdCode,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get authCode => $composableBuilder(
      column: $table.authCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cardCardSequenceNum => $composableBuilder(
      column: $table.cardCardSequenceNum,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cardExpireData => $composableBuilder(
      column: $table.cardExpireData,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get forwardingInstCode => $composableBuilder(
      column: $table.forwardingInstCode,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get institutionDataJson => $composableBuilder(
      column: $table.institutionDataJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pan => $composableBuilder(
      column: $table.pan, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pinBlock => $composableBuilder(
      column: $table.pinBlock, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get receiptNumber => $composableBuilder(
      column: $table.receiptNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get respCode => $composableBuilder(
      column: $table.respCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get responseMessage => $composableBuilder(
      column: $table.responseMessage,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get successResponse => $composableBuilder(
      column: $table.successResponse,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get systemTraceAuditNo => $composableBuilder(
      column: $table.systemTraceAuditNo,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get terminalId => $composableBuilder(
      column: $table.terminalId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get transactionDate => $composableBuilder(
      column: $table.transactionDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get transactionDateTime => $composableBuilder(
      column: $table.transactionDateTime,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get transactionTime => $composableBuilder(
      column: $table.transactionTime,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get transactionType => $composableBuilder(
      column: $table.transactionType,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$TransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get rRN => $composableBuilder(
      column: $table.rRN, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sTAN => $composableBuilder(
      column: $table.sTAN, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accountBalance => $composableBuilder(
      column: $table.accountBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get acquiringInstitutionIdCode => $composableBuilder(
      column: $table.acquiringInstitutionIdCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get authCode => $composableBuilder(
      column: $table.authCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cardCardSequenceNum => $composableBuilder(
      column: $table.cardCardSequenceNum,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cardExpireData => $composableBuilder(
      column: $table.cardExpireData,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get forwardingInstCode => $composableBuilder(
      column: $table.forwardingInstCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get institutionDataJson => $composableBuilder(
      column: $table.institutionDataJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pan => $composableBuilder(
      column: $table.pan, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pinBlock => $composableBuilder(
      column: $table.pinBlock, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get receiptNumber => $composableBuilder(
      column: $table.receiptNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get respCode => $composableBuilder(
      column: $table.respCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get responseMessage => $composableBuilder(
      column: $table.responseMessage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get successResponse => $composableBuilder(
      column: $table.successResponse,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get systemTraceAuditNo => $composableBuilder(
      column: $table.systemTraceAuditNo,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get terminalId => $composableBuilder(
      column: $table.terminalId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transactionDate => $composableBuilder(
      column: $table.transactionDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transactionDateTime => $composableBuilder(
      column: $table.transactionDateTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transactionTime => $composableBuilder(
      column: $table.transactionTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transactionType => $composableBuilder(
      column: $table.transactionType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$TransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get rRN =>
      $composableBuilder(column: $table.rRN, builder: (column) => column);

  GeneratedColumn<String> get sTAN =>
      $composableBuilder(column: $table.sTAN, builder: (column) => column);

  GeneratedColumn<String> get accountBalance => $composableBuilder(
      column: $table.accountBalance, builder: (column) => column);

  GeneratedColumn<String> get acquiringInstitutionIdCode => $composableBuilder(
      column: $table.acquiringInstitutionIdCode, builder: (column) => column);

  GeneratedColumn<String> get authCode =>
      $composableBuilder(column: $table.authCode, builder: (column) => column);

  GeneratedColumn<String> get cardCardSequenceNum => $composableBuilder(
      column: $table.cardCardSequenceNum, builder: (column) => column);

  GeneratedColumn<String> get cardExpireData => $composableBuilder(
      column: $table.cardExpireData, builder: (column) => column);

  GeneratedColumn<String> get forwardingInstCode => $composableBuilder(
      column: $table.forwardingInstCode, builder: (column) => column);

  GeneratedColumn<String> get institutionDataJson => $composableBuilder(
      column: $table.institutionDataJson, builder: (column) => column);

  GeneratedColumn<String> get pan =>
      $composableBuilder(column: $table.pan, builder: (column) => column);

  GeneratedColumn<String> get pinBlock =>
      $composableBuilder(column: $table.pinBlock, builder: (column) => column);

  GeneratedColumn<String> get receiptNumber => $composableBuilder(
      column: $table.receiptNumber, builder: (column) => column);

  GeneratedColumn<String> get respCode =>
      $composableBuilder(column: $table.respCode, builder: (column) => column);

  GeneratedColumn<String> get responseMessage => $composableBuilder(
      column: $table.responseMessage, builder: (column) => column);

  GeneratedColumn<bool> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get successResponse => $composableBuilder(
      column: $table.successResponse, builder: (column) => column);

  GeneratedColumn<String> get systemTraceAuditNo => $composableBuilder(
      column: $table.systemTraceAuditNo, builder: (column) => column);

  GeneratedColumn<String> get terminalId => $composableBuilder(
      column: $table.terminalId, builder: (column) => column);

  GeneratedColumn<String> get transactionDate => $composableBuilder(
      column: $table.transactionDate, builder: (column) => column);

  GeneratedColumn<String> get transactionDateTime => $composableBuilder(
      column: $table.transactionDateTime, builder: (column) => column);

  GeneratedColumn<String> get transactionTime => $composableBuilder(
      column: $table.transactionTime, builder: (column) => column);

  GeneratedColumn<String> get transactionType => $composableBuilder(
      column: $table.transactionType, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$TransactionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransactionsTable,
    TransactionEntity,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableAnnotationComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (
      TransactionEntity,
      BaseReferences<_$AppDatabase, $TransactionsTable, TransactionEntity>
    ),
    TransactionEntity,
    PrefetchHooks Function()> {
  $$TransactionsTableTableManager(_$AppDatabase db, $TransactionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> amount = const Value.absent(),
            Value<String?> rRN = const Value.absent(),
            Value<String?> sTAN = const Value.absent(),
            Value<String?> accountBalance = const Value.absent(),
            Value<String?> acquiringInstitutionIdCode = const Value.absent(),
            Value<String?> authCode = const Value.absent(),
            Value<String?> cardCardSequenceNum = const Value.absent(),
            Value<String?> cardExpireData = const Value.absent(),
            Value<String?> forwardingInstCode = const Value.absent(),
            Value<String?> institutionDataJson = const Value.absent(),
            Value<String?> pan = const Value.absent(),
            Value<String?> pinBlock = const Value.absent(),
            Value<String?> receiptNumber = const Value.absent(),
            Value<String?> respCode = const Value.absent(),
            Value<String?> responseMessage = const Value.absent(),
            Value<bool?> status = const Value.absent(),
            Value<String?> successResponse = const Value.absent(),
            Value<String?> systemTraceAuditNo = const Value.absent(),
            Value<String?> terminalId = const Value.absent(),
            Value<String?> transactionDate = const Value.absent(),
            Value<String?> transactionDateTime = const Value.absent(),
            Value<String?> transactionTime = const Value.absent(),
            Value<String?> transactionType = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              TransactionsCompanion(
            id: id,
            amount: amount,
            rRN: rRN,
            sTAN: sTAN,
            accountBalance: accountBalance,
            acquiringInstitutionIdCode: acquiringInstitutionIdCode,
            authCode: authCode,
            cardCardSequenceNum: cardCardSequenceNum,
            cardExpireData: cardExpireData,
            forwardingInstCode: forwardingInstCode,
            institutionDataJson: institutionDataJson,
            pan: pan,
            pinBlock: pinBlock,
            receiptNumber: receiptNumber,
            respCode: respCode,
            responseMessage: responseMessage,
            status: status,
            successResponse: successResponse,
            systemTraceAuditNo: systemTraceAuditNo,
            terminalId: terminalId,
            transactionDate: transactionDate,
            transactionDateTime: transactionDateTime,
            transactionTime: transactionTime,
            transactionType: transactionType,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> amount = const Value.absent(),
            Value<String?> rRN = const Value.absent(),
            Value<String?> sTAN = const Value.absent(),
            Value<String?> accountBalance = const Value.absent(),
            Value<String?> acquiringInstitutionIdCode = const Value.absent(),
            Value<String?> authCode = const Value.absent(),
            Value<String?> cardCardSequenceNum = const Value.absent(),
            Value<String?> cardExpireData = const Value.absent(),
            Value<String?> forwardingInstCode = const Value.absent(),
            Value<String?> institutionDataJson = const Value.absent(),
            Value<String?> pan = const Value.absent(),
            Value<String?> pinBlock = const Value.absent(),
            Value<String?> receiptNumber = const Value.absent(),
            Value<String?> respCode = const Value.absent(),
            Value<String?> responseMessage = const Value.absent(),
            Value<bool?> status = const Value.absent(),
            Value<String?> successResponse = const Value.absent(),
            Value<String?> systemTraceAuditNo = const Value.absent(),
            Value<String?> terminalId = const Value.absent(),
            Value<String?> transactionDate = const Value.absent(),
            Value<String?> transactionDateTime = const Value.absent(),
            Value<String?> transactionTime = const Value.absent(),
            Value<String?> transactionType = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              TransactionsCompanion.insert(
            id: id,
            amount: amount,
            rRN: rRN,
            sTAN: sTAN,
            accountBalance: accountBalance,
            acquiringInstitutionIdCode: acquiringInstitutionIdCode,
            authCode: authCode,
            cardCardSequenceNum: cardCardSequenceNum,
            cardExpireData: cardExpireData,
            forwardingInstCode: forwardingInstCode,
            institutionDataJson: institutionDataJson,
            pan: pan,
            pinBlock: pinBlock,
            receiptNumber: receiptNumber,
            respCode: respCode,
            responseMessage: responseMessage,
            status: status,
            successResponse: successResponse,
            systemTraceAuditNo: systemTraceAuditNo,
            terminalId: terminalId,
            transactionDate: transactionDate,
            transactionDateTime: transactionDateTime,
            transactionTime: transactionTime,
            transactionType: transactionType,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TransactionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TransactionsTable,
    TransactionEntity,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableAnnotationComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (
      TransactionEntity,
      BaseReferences<_$AppDatabase, $TransactionsTable, TransactionEntity>
    ),
    TransactionEntity,
    PrefetchHooks Function()>;
typedef $$MerchantsTableCreateCompanionBuilder = MerchantsCompanion Function({
  Value<int> id,
  Value<String?> merchantName,
  Value<String?> serialnumber,
  Value<String?> mid,
  Value<String?> tid,
  Value<String?> merchantaddress,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$MerchantsTableUpdateCompanionBuilder = MerchantsCompanion Function({
  Value<int> id,
  Value<String?> merchantName,
  Value<String?> serialnumber,
  Value<String?> mid,
  Value<String?> tid,
  Value<String?> merchantaddress,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$MerchantsTableFilterComposer
    extends Composer<_$AppDatabase, $MerchantsTable> {
  $$MerchantsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get merchantName => $composableBuilder(
      column: $table.merchantName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get serialnumber => $composableBuilder(
      column: $table.serialnumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mid => $composableBuilder(
      column: $table.mid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tid => $composableBuilder(
      column: $table.tid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get merchantaddress => $composableBuilder(
      column: $table.merchantaddress,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$MerchantsTableOrderingComposer
    extends Composer<_$AppDatabase, $MerchantsTable> {
  $$MerchantsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get merchantName => $composableBuilder(
      column: $table.merchantName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get serialnumber => $composableBuilder(
      column: $table.serialnumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mid => $composableBuilder(
      column: $table.mid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tid => $composableBuilder(
      column: $table.tid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get merchantaddress => $composableBuilder(
      column: $table.merchantaddress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$MerchantsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MerchantsTable> {
  $$MerchantsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get merchantName => $composableBuilder(
      column: $table.merchantName, builder: (column) => column);

  GeneratedColumn<String> get serialnumber => $composableBuilder(
      column: $table.serialnumber, builder: (column) => column);

  GeneratedColumn<String> get mid =>
      $composableBuilder(column: $table.mid, builder: (column) => column);

  GeneratedColumn<String> get tid =>
      $composableBuilder(column: $table.tid, builder: (column) => column);

  GeneratedColumn<String> get merchantaddress => $composableBuilder(
      column: $table.merchantaddress, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$MerchantsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MerchantsTable,
    MerchantEntity,
    $$MerchantsTableFilterComposer,
    $$MerchantsTableOrderingComposer,
    $$MerchantsTableAnnotationComposer,
    $$MerchantsTableCreateCompanionBuilder,
    $$MerchantsTableUpdateCompanionBuilder,
    (
      MerchantEntity,
      BaseReferences<_$AppDatabase, $MerchantsTable, MerchantEntity>
    ),
    MerchantEntity,
    PrefetchHooks Function()> {
  $$MerchantsTableTableManager(_$AppDatabase db, $MerchantsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MerchantsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MerchantsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MerchantsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> merchantName = const Value.absent(),
            Value<String?> serialnumber = const Value.absent(),
            Value<String?> mid = const Value.absent(),
            Value<String?> tid = const Value.absent(),
            Value<String?> merchantaddress = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              MerchantsCompanion(
            id: id,
            merchantName: merchantName,
            serialnumber: serialnumber,
            mid: mid,
            tid: tid,
            merchantaddress: merchantaddress,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> merchantName = const Value.absent(),
            Value<String?> serialnumber = const Value.absent(),
            Value<String?> mid = const Value.absent(),
            Value<String?> tid = const Value.absent(),
            Value<String?> merchantaddress = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              MerchantsCompanion.insert(
            id: id,
            merchantName: merchantName,
            serialnumber: serialnumber,
            mid: mid,
            tid: tid,
            merchantaddress: merchantaddress,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MerchantsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MerchantsTable,
    MerchantEntity,
    $$MerchantsTableFilterComposer,
    $$MerchantsTableOrderingComposer,
    $$MerchantsTableAnnotationComposer,
    $$MerchantsTableCreateCompanionBuilder,
    $$MerchantsTableUpdateCompanionBuilder,
    (
      MerchantEntity,
      BaseReferences<_$AppDatabase, $MerchantsTable, MerchantEntity>
    ),
    MerchantEntity,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
  $$MerchantsTableTableManager get merchants =>
      $$MerchantsTableTableManager(_db, _db.merchants);
}
