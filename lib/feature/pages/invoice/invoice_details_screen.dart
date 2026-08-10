import 'package:flutter/material.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_size.dart';

class InvoiceDetailsScreen extends StatelessWidget {
  const InvoiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryBlue),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Invoice Details",
          style: TextStyle(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.bold,
            fontSize: AppSize.width(0.05),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSize.width(0.05)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "INV-1001",
                  style: TextStyle(
                    fontSize: AppSize.width(0.06),
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    "Paid",
                    style: TextStyle(color: AppColors.green, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSize.height(0.01)),
            Text(
              "Amit Sharma",
              style: TextStyle(fontSize: AppSize.width(0.04), fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("12 Jan 2024", style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
                Text("Due: 22 Jan 2024", style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
              ],
            ),
            SizedBox(height: AppSize.height(0.03)),
            Text(
              "₹25,000",
              style: TextStyle(
                fontSize: AppSize.width(0.07),
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: AppSize.height(0.04)),
            const Text(
              "Items",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            SizedBox(height: AppSize.height(0.02)),
            _buildItemRow("Website Development", "₹15,000"),
            _buildItemRow("Hosting (1 Year)", "₹5,000"),
            _buildItemRow("Maintenance (3 Months)", "₹5,000"),
            const Divider(height: 32),
            _buildSummaryRow("Subtotal", "₹25,000"),
            _buildSummaryRow("Tax (0%)", "₹0"),
            _buildSummaryRow("Total Amount", "₹25,000", isTotal: true),
            SizedBox(height: AppSize.height(0.05)),
            SizedBox(
              width: double.infinity,
              height: AppSize.height(0.06),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                ),
                child: const Text("Download PDF", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: AppSize.height(0.015)),
            SizedBox(
              width: double.infinity,
              height: AppSize.height(0.06),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.grey, width: 0.5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("Share Invoice", style: TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemRow(String title, String price) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSize.height(0.01)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSize.height(0.008)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? AppSize.width(0.04) : AppSize.width(0.035),
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
              color: isTotal ? AppColors.primaryBlue : Colors.grey.shade600,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? AppSize.width(0.045) : AppSize.width(0.035),
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
              color: isTotal ? AppColors.primaryBlue : AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
