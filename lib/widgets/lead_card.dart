import 'package:flutter/material.dart';
import '../core/constant/app_color.dart';
import '../core/constant/app_size.dart';

class LeadCard extends StatelessWidget {
  final String name;
  final String mobile;
  final String status;
  final String? imageUrl;

  const LeadCard({
    super.key,
    required this.name,
    required this.mobile,
    required this.status,
    this.imageUrl,
  });

  Color _getStatusColor() {
    switch (status.toLowerCase()) {
      case 'new lead':
        return AppColors.statusNew;
      case 'follow up':
      case 'contacted':
        return AppColors.statusFollowUp;
      case 'qualified':
        return AppColors.statusQualified;
      case 'proposal':
        return AppColors.statusProposal;
      case 'won':
        return AppColors.statusWon;
      case 'lost':
        return AppColors.statusLost;
      default:
        return AppColors.statusNew;
    }
  }

  Color _getStatusTextColor() {
    switch (status.toLowerCase()) {
      case 'new lead':
        return AppColors.statusNewText;
      case 'follow up':
      case 'contacted':
        return AppColors.statusFollowUpText;
      case 'qualified':
        return AppColors.statusQualifiedText;
      case 'proposal':
        return AppColors.statusProposalText;
      case 'won':
        return AppColors.statusWonText;
      case 'lost':
        return AppColors.statusLostText;
      default:
        return AppColors.statusNewText;
    }
  }

  @override
  Widget build(BuildContext context) {
    AppSize.init(context);
    return Container(
      margin: EdgeInsets.only(bottom: AppSize.height(0.015)),
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.width(0.04),
        vertical: AppSize.height(0.012),
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: AppSize.width(0.06),
            backgroundColor: AppColors.primaryBlue.withOpacity(0.1),
            backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
            child: imageUrl == null
                ? Icon(Icons.person, color: AppColors.primaryBlue, size: AppSize.width(0.06))
                : null,
          ),
          SizedBox(width: AppSize.width(0.04)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: AppSize.width(0.04),
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: AppSize.height(0.005)),
                Text(
                  "Mobile: $mobile",
                  style: TextStyle(
                    fontSize: AppSize.width(0.03),
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.width(0.03),
              vertical: AppSize.height(0.005),
            ),
            decoration: BoxDecoration(
              color: _getStatusColor(),
              borderRadius: BorderRadius.circular(AppSize.width(0.04)),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: AppSize.width(0.028),
                fontWeight: FontWeight.w600,
                color: _getStatusTextColor(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
