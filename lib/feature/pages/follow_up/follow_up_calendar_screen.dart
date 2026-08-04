import 'package:flutter/material.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_size.dart';
import '../../../widgets/follow_up_card.dart';

class FollowUpCalendarScreen extends StatelessWidget {
  const FollowUpCalendarScreen({super.key});

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
          "January 2024",
          style: TextStyle(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.bold,
            fontSize: AppSize.width(0.05),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.chevron_left, color: AppColors.primaryBlue),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right, color: AppColors.primaryBlue),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildCalendar(),
          Padding(
            padding: EdgeInsets.all(AppSize.width(0.04)),
            child: Row(
              children: [
                Text(
                  "12 Jan 2024",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppSize.width(0.04),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: AppSize.width(0.04)),
              children: [
                FollowUpCard(
                  name: "Amit Sharma",
                  type: "Meeting",
                  time: "10:00 AM",
                  priority: "High",
                ),
                FollowUpCard(
                  name: "Rahul Verma",
                  type: "Call",
                  time: "11:30 AM",
                  priority: "High",
                ),
                FollowUpCard(
                  name: "Neha Gupta",
                  type: "Follow Up",
                  time: "02:00 PM",
                  priority: "Medium",
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(AppSize.width(0.05)),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/addFollowUp'),
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text("Add Follow Up", style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
                .map((d) => Text(d, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)))
                .toList(),
          ),
          const SizedBox(height: 10),
          // Simplified Calendar Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
            itemCount: 31,
            itemBuilder: (context, index) {
              int day = index + 1;
              bool isSelected = day == 12;
              return Center(
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primaryBlue : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "$day",
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
