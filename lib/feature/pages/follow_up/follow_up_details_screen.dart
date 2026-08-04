import 'package:flutter/material.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_size.dart';

class FollowUpDetailsScreen extends StatelessWidget {
  const FollowUpDetailsScreen({super.key});

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
          "Follow Up Details",
          style: TextStyle(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.bold,
            fontSize: AppSize.width(0.05),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: AppColors.primaryBlue),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSize.width(0.05)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: AppSize.width(0.08),
                  backgroundColor: AppColors.primaryBlue,
                  child: Text("RV", style: TextStyle(color: Colors.white, fontSize: AppSize.width(0.05))),
                ),
                SizedBox(width: AppSize.width(0.04)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Rahul Verma", style: TextStyle(fontSize: AppSize.width(0.045), fontWeight: FontWeight.bold)),
                    Text("Verma Enterprises", style: TextStyle(color: Colors.grey, fontSize: AppSize.width(0.035))),
                    Text("+91 98765 43210", style: TextStyle(color: Colors.grey, fontSize: AppSize.width(0.035))),
                  ],
                ),
                const Spacer(),
                const Text("Pending", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: AppSize.height(0.04)),
            _buildInfoRow(Icons.calendar_today_outlined, "Type", "Meeting"),
            _buildInfoRow(Icons.calendar_today, "Date", "12 Jan 2024"),
            _buildInfoRow(Icons.access_time, "Time", "11:30 AM"),
            _buildInfoRow(Icons.notifications_none, "Reminder", "30 mins before"),
            _buildInfoRow(Icons.flag_outlined, "Priority", "High", valueColor: Colors.red),
            _buildInfoRow(Icons.person_outline, "Assigned To", "Rahul Sharma"),
            SizedBox(height: AppSize.height(0.02)),
            Text("Remarks", style: TextStyle(color: Colors.grey, fontSize: AppSize.width(0.035))),
            SizedBox(height: AppSize.height(0.01)),
            Text("Discussed about requirements.", style: TextStyle(fontSize: AppSize.width(0.04))),
            SizedBox(height: AppSize.height(0.03)),
            Container(
              padding: EdgeInsets.all(AppSize.width(0.04)),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Next Follow Up", style: TextStyle(color: Colors.grey, fontSize: AppSize.width(0.035))),
                       const Text("High", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                     ],
                   ),
                   SizedBox(height: AppSize.height(0.01)),
                   Row(
                     children: [
                       Icon(Icons.access_time, size: 16, color: AppColors.primaryBlue),
                       SizedBox(width: 8),
                       Text("15 Jan 2024, 10:00 AM", style: TextStyle(fontWeight: FontWeight.w600)),
                     ],
                   )
                ],
              ),
            ),
            SizedBox(height: AppSize.height(0.05)),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.green),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text("Mark Completed", style: TextStyle(color: Colors.green)),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.primaryBlue),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text("Reschedule", style: TextStyle(color: AppColors.primaryBlue)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value, {Color? valueColor}) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSize.height(0.02)),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.primaryBlue),
          SizedBox(width: AppSize.width(0.04)),
          Text(label, style: TextStyle(color: Colors.grey, fontSize: AppSize.width(0.038))),
          const Spacer(),
          Text(value, style: TextStyle(fontWeight: FontWeight.w600, fontSize: AppSize.width(0.038), color: valueColor ?? AppColors.black)),
        ],
      ),
    );
  }
}
