import 'package:flutter/material.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_size.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/custom_dropdown.dart';

class CreateInvoiceScreen extends StatefulWidget {
  const CreateInvoiceScreen({super.key});

  @override
  State<CreateInvoiceScreen> createState() => _CreateInvoiceScreenState();
}

class _CreateInvoiceScreenState extends State<CreateInvoiceScreen> {
  String selectedLead = "Amit Sharma";

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
          "Create Invoice",
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
            CustomDropdown(
              label: "Select Lead*",
              value: selectedLead,
              items: const ["Amit Sharma", "Rahul Verma", "Neha Gupta", "Vikram Singh"],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedLead = value;
                  });
                }
              },
            ),
            SizedBox(height: AppSize.height(0.02)),
            const CustomTextField(
              label: "Invoice Number",
              hintText: "INV-1005",
            ),
            SizedBox(height: AppSize.height(0.02)),
            CustomTextField(
              label: "Invoice Date",
              hintText: "12 Jan 2024",
              suffixIcon: Icon(Icons.calendar_today_outlined, size: 20, color: Colors.grey.shade400),
            ),
            SizedBox(height: AppSize.height(0.02)),
            CustomTextField(
              label: "Due Date",
              hintText: "22 Jan 2024",
              suffixIcon: Icon(Icons.calendar_today_outlined, size: 20, color: Colors.grey.shade400),
            ),
            SizedBox(height: AppSize.height(0.02)),
            Center(
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, size: 18),
                label: const Text("Add Item"),
                style: TextButton.styleFrom(foregroundColor: AppColors.primaryBlue),
              ),
            ),
            SizedBox(height: AppSize.height(0.02)),
            const Divider(),
            _buildSummaryRow("Subtotal", "₹0,000"),
            _buildSummaryRow("Tax (0%)", "₹0,000"),
            _buildSummaryRow("Total Amount", "₹0,00", isTotal: true),
            SizedBox(height: AppSize.height(0.05)),
            SizedBox(
              width: double.infinity,
              height: AppSize.height(0.065),
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                ),
                child: const Text("Save Invoice", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
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
