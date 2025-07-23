import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/models/transaction_model.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const TransactionListItem({
    super.key,
    required this.transaction,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isSuccess = transaction.status == true;
    final amount = double.tryParse(transaction.amount ?? '0') ?? 0.0;
    final merchantName = transaction.institutionData?.merchantName ?? 
                        transaction.responseMessage ?? 
                        'Unknown Merchant';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isSuccess ? Colors.green.shade100 : Colors.red.shade100,
          child: Icon(
            isSuccess ? Icons.check : Icons.close,
            color: isSuccess ? Colors.green.shade700 : Colors.red.shade700,
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                merchantName,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              '₦${NumberFormat('#,##0.00').format(amount)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isSuccess ? Colors.green.shade700 : Colors.red.shade700,
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: Text(
                    transaction.transactionType ?? 'Unknown Type',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                ),
                if (transaction.transactionDate != null || transaction.transactionTime != null)
                  Text(
                    _formatDateTime(),
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: isSuccess ? Colors.green.shade50 : Colors.red.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSuccess ? Colors.green.shade200 : Colors.red.shade200,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    isSuccess ? 'SUCCESS' : 'FAILED',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: isSuccess ? Colors.green.shade700 : Colors.red.shade700,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                if (transaction.rRN != null)
                  Expanded(
                    child: Text(
                      'RRN: ${transaction.rRN}',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 10,
                        fontFamily: 'monospace',
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            ),
          ],
        ),
        trailing: onDelete != null
            ? IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                onPressed: onDelete,
                tooltip: 'Delete transaction',
              )
            : const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }

  String _formatDateTime() {
    if (transaction.transactionDateTime != null) {
      try {
        final dateTime = DateTime.parse(transaction.transactionDateTime!);
        return DateFormat('MMM dd, HH:mm').format(dateTime);
      } catch (e) {
        // Fallback to separate date and time fields
      }
    }

    final date = transaction.transactionDate;
    final time = transaction.transactionTime;

    if (date != null && time != null) {
      try {
        // Parse date in DDMM format and time in HHMMSS format
        if (date.length >= 4 && time.length >= 6) {
          final day = int.parse(date.substring(0, 2));
          final month = int.parse(date.substring(2, 4));
          final hour = int.parse(time.substring(0, 2));
          final minute = int.parse(time.substring(2, 4));
          
          final now = DateTime.now();
          final dateTime = DateTime(now.year, month, day, hour, minute);
          return DateFormat('MMM dd, HH:mm').format(dateTime);
        }
      } catch (e) {
        // Fallback to raw strings
      }
    }

    if (date != null && time != null) {
      return '$date $time';
    } else if (date != null) {
      return date;
    } else if (time != null) {
      return time;
    }

    return 'Unknown Time';
  }
}