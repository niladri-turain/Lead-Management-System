import 'package:flutter/material.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_size.dart';
import '../../../core/routes/app_routes.dart';
import '../../../widgets/invoice_card.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.menu, color: AppColors.primaryBlue),
        title: Text(
          "Invoices",
          style: TextStyle(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.bold,
            fontSize: AppSize.width(0.05),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(AppSize.width(0.04)),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: AppSize.height(0.055),
                    padding: EdgeInsets.symmetric(horizontal: AppSize.width(0.03)),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey, size: 20),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search invoice...",
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Icon(Icons.filter_list, color: AppColors.primaryBlue),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: AppSize.width(0.04)),
              children: [
                InvoiceCard(
                  invoiceNo: "INV-1001",
                  name: "Amit Sharma",
                  date: "12 Jan 2024",
                  amount: "25,000",
                  status: "Paid",
                  onTap: () => Navigator.pushNamed(context, '/invoiceDetails'),
                ),
                InvoiceCard(
                  invoiceNo: "INV-1002",
                  name: "Rahul Verma",
                  date: "11 Jan 2024",
                  amount: "10,500",
                  status: "Pending",
                  onTap: () => Navigator.pushNamed(context, '/invoiceDetails'),
                ),
                InvoiceCard(
                  invoiceNo: "INV-1003",
                  name: "Neha Gupta",
                  date: "10 Jan 2024",
                  amount: "32,000",
                  status: "Overdue",
                  onTap: () => Navigator.pushNamed(context, '/invoiceDetails'),
                ),
                InvoiceCard(
                  invoiceNo: "INV-1004",
                  name: "Vikram Singh",
                  date: "09 Jan 2024",
                  amount: "15,000",
                  status: "Paid",
                  onTap: () => Navigator.pushNamed(context, '/invoiceDetails'),
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, '/createInvoice'),
        backgroundColor: AppColors.primaryBlue,
        icon: Icon(Icons.add, color: Colors.white),
        label: Text("Create Invoice", style: TextStyle(color: Colors.white)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
