import 'package:flutter/material.dart';
import '../core/constant/app_color.dart';
import '../core/constant/app_size.dart';

class InvoiceCard extends StatelessWidget {
  final String invoiceNo;
  final String name;
  final String date;
  final String amount;
  final String status;
  final VoidCallback? onTap;

  const InvoiceCard({
    super.key,
    required this.invoiceNo,
    required this.name,
    required this.date,
    required this.amount,
    required this.status,
    this.onTap,
  });

  Color _getStatusColor() {
    switch (status.toLowerCase()) {
      case 'paid':
        return AppColors.green;
      case 'pending':
        return AppColors.orange;
      case 'overdue':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: AppSize.height(0.015)),
        padding: EdgeInsets.all(AppSize.width(0.04)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSize.width(0.03)),
          border: Border.all(color: Colors.grey.shade100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  invoiceNo,
                  style: TextStyle(
                    fontSize: AppSize.width(0.04),
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: AppSize.height(0.005)),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: AppSize.width(0.035),
                    color: Colors.grey.shade700,
                  ),
                ),
                SizedBox(height: AppSize.height(0.005)),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: AppSize.width(0.03),
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "₹$amount",
                  style: TextStyle(
                    fontSize: AppSize.width(0.04),
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: AppSize.height(0.015)),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.width(0.025),
                    vertical: AppSize.height(0.004),
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor().withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: AppSize.width(0.028),
                      fontWeight: FontWeight.bold,
                      color: _getStatusColor(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
