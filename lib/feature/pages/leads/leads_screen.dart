import 'package:flutter/material.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_size.dart';
import '../../../widgets/lead_card.dart';

import '../../../core/routes/app_routes.dart';

class LeadsScreen extends StatelessWidget {
  const LeadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize.init(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: AppColors.primaryBlue,
          size: AppSize.width(0.06),
        ),
        title: Text(
          "Leads",
          style: TextStyle(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.bold,
            fontSize: AppSize.width(0.05),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: AppColors.primaryBlue,
              size: AppSize.width(0.06),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(AppSize.width(0.04)),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: AppSize.height(0.06),
                        padding: EdgeInsets.symmetric(horizontal: AppSize.width(0.04)),
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(AppSize.width(0.08)),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search, color: Colors.grey, size: AppSize.width(0.05)),
                            SizedBox(width: AppSize.width(0.02)),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Search leads...",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: AppSize.width(0.035),
                                  ),
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: AppSize.width(0.04)),
                    Icon(
                      Icons.filter_list,
                      color: AppColors.primaryBlue,
                      size: AppSize.width(0.07),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: AppSize.width(0.02)),
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.leadDetails,
                        arguments: {
                          'name': "Amit Sharma",
                          'mobile': "9876543210",
                          'status': "New Lead",
                        },
                      ),
                      child: const LeadCard(
                        name: "Amit Sharma",
                        mobile: "9876543210",
                        status: "New Lead",
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.leadDetails,
                        arguments: {
                          'name': "Rahul Verma",
                          'mobile': "8765432109",
                          'status': "Follow Up",
                        },
                      ),
                      child: const LeadCard(
                        name: "Rahul Verma",
                        mobile: "8765432109",
                        status: "Follow Up",
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.leadDetails,
                        arguments: {
                          'name': "Neha Gupta",
                          'mobile': "7654321098",
                          'status': "Qualified",
                        },
                      ),
                      child: const LeadCard(
                        name: "Neha Gupta",
                        mobile: "7654321098",
                        status: "Qualified",
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.leadDetails,
                        arguments: {
                          'name': "Vikram Singh",
                          'mobile': "6543210987",
                          'status': "Proposal",
                        },
                      ),
                      child: const LeadCard(
                        name: "Vikram Singh",
                        mobile: "6543210987",
                        status: "Proposal",
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.leadDetails,
                        arguments: {
                          'name': "Pooja Mehta",
                          'mobile': "5432109876",
                          'status': "New Lead",
                        },
                      ),
                      child: const LeadCard(
                        name: "Pooja Mehta",
                        mobile: "5432109876",
                        status: "New Lead",
                      ),
                    ),
                    // Add more space at bottom for the button
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: AppSize.height(0.04),
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/addLead');
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.width(0.08),
                    vertical: AppSize.height(0.015),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue,
                    borderRadius: BorderRadius.circular(AppSize.width(0.08)),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryBlue.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add, color: Colors.white, size: AppSize.width(0.05)),
                      SizedBox(width: AppSize.width(0.02)),
                      Text(
                        "Add Lead",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: AppSize.width(0.04),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
