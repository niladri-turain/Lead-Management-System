import 'package:flutter/material.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_size.dart';
import '../../../widgets/follow_up_card.dart';

class FollowUpScreen extends StatefulWidget {
  const FollowUpScreen({super.key});

  @override
  State<FollowUpScreen> createState() => _FollowUpScreenState();
}

class _FollowUpScreenState extends State<FollowUpScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
          "Follow Up",
          style: TextStyle(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.bold,
            fontSize: AppSize.width(0.05),
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primaryBlue,
          unselectedLabelColor: Colors.grey,
          indicatorColor: AppColors.primaryBlue,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: TextStyle(
            fontSize: AppSize.width(0.035),
            fontWeight: FontWeight.bold,
          ),
          tabs: const [
            Tab(text: "Today"),
            Tab(text: "Upcoming"),
            Tab(text: "Overdue"),
            Tab(text: "Completed"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildListView("Today"),
          _buildListView("Upcoming"),
          _buildListView("Overdue"),
          _buildListView("Completed"),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/addFollowUp');
        },
        backgroundColor: AppColors.primaryBlue,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text("Add Follow Up", style: TextStyle(color: Colors.white)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildListView(String category) {
    return ListView(
      padding: EdgeInsets.all(AppSize.width(0.04)),
      children: [
        FollowUpCard(
          name: "Amit Sharma",
          type: "Meeting",
          time: "10:00 AM",
          priority: "High",
          onTap: () => Navigator.pushNamed(context, '/followUpDetails'),
        ),
        FollowUpCard(
          name: "Rahul Verma",
          type: "Call",
          time: "11:30 AM",
          priority: "High",
          onTap: () => Navigator.pushNamed(context, '/followUpDetails'),
        ),
        FollowUpCard(
          name: "Nisha Gupta",
          type: "Meeting",
          time: "02:00 PM",
          priority: "Medium",
          onTap: () => Navigator.pushNamed(context, '/followUpDetails'),
        ),
        FollowUpCard(
          name: "Vikram Singh",
          type: "Demo",
          time: "04:00 PM",
          priority: "Low",
          onTap: () => Navigator.pushNamed(context, '/followUpDetails'),
        ),
        SizedBox(height: AppSize.height(0.1)),
      ],
    );
  }
}
