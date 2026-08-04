import 'package:flutter/material.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_size.dart';

class LeadDetailsScreen extends StatelessWidget {
  const LeadDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Extracting arguments
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>? ?? {};
    final String name = args['name'] ?? "Unknown";
    final String mobile = args['mobile'] ?? "No mobile";
    final String status = args['status'] ?? "New Lead";

    AppSize.init(context);

    // Get status colors
    Color getStatusColor(String status) {
      switch (status.toLowerCase()) {
        case 'new lead': return AppColors.statusNew;
        case 'follow up':
        case 'contacted': return AppColors.statusFollowUp;
        case 'qualified': return AppColors.statusQualified;
        case 'proposal': return AppColors.statusProposal;
        case 'won': return AppColors.statusWon;
        case 'lost': return AppColors.statusLost;
        default: return AppColors.statusNew;
      }
    }

    Color getStatusTextColor(String status) {
      switch (status.toLowerCase()) {
        case 'new lead': return AppColors.statusNewText;
        case 'follow up':
        case 'contacted': return AppColors.statusFollowUpText;
        case 'qualified': return AppColors.statusQualifiedText;
        case 'proposal': return AppColors.statusProposalText;
        case 'won': return AppColors.statusWonText;
        case 'lost': return AppColors.statusLostText;
        default: return AppColors.statusNewText;
      }
    }

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
          "Lead Details",
          style: TextStyle(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.bold,
            fontSize: AppSize.width(0.05),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: AppColors.primaryBlue),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Padding(
              padding: EdgeInsets.all(AppSize.width(0.05)),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: AppSize.width(0.1),
                    backgroundColor: AppColors.primaryBlue,
                    child: Text(
                      name.isNotEmpty ? name.substring(0, 1).toUpperCase() : "L",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: AppSize.width(0.06),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: AppSize.width(0.04)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: AppSize.width(0.05),
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                          mobile,
                          style: TextStyle(
                            fontSize: AppSize.width(0.035),
                            color: Colors.grey.shade600,
                          ),
                        ),
                        Text(
                          "${name.toLowerCase().replaceAll(' ', '.')}@example.com",
                          style: TextStyle(
                            fontSize: AppSize.width(0.035),
                            color: Colors.grey.shade600,
                          ),
                        ),
                        SizedBox(height: AppSize.height(0.005)),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSize.width(0.03),
                            vertical: AppSize.height(0.004),
                          ),
                          decoration: BoxDecoration(
                            color: getStatusColor(status),
                            borderRadius: BorderRadius.circular(AppSize.width(0.04)),
                          ),
                          child: Text(
                            status,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: getStatusTextColor(status),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Action Buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.width(0.05)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildActionButton(Icons.call, "Call", () {}),
                  _buildActionButton(Icons.chat_bubble_outline, "WhatsApp", () {}),
                  _buildActionButton(Icons.mail_outline, "Email", () {}),
                  _buildActionButton(Icons.more_horiz, "More", () {}),
                ],
              ),
            ),

            const Divider(height: 40, thickness: 1, color: Color(0xFFF0F0F0)),

            // Details Section
            _buildSectionTitle("Details"),
            _buildDetailRow("Company", "Tech Solutions Pvt. Ltd."),
            _buildDetailRow("Source", "Website"),
            _buildDetailRow("Assigned To", "Rahul Sharma"),
            _buildDetailRow("Created On", "12 Jan 2024"),
            _buildDetailRow("Service", "Web Development"),
            _buildDetailRow("Address", "123, Salt Lake, Sector V, Kolkata, West Bengal - 700091"),

            const Divider(height: 40, thickness: 1, color: Color(0xFFF0F0F0)),

            // Notes Section
            _buildSectionTitle("Notes"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.width(0.05)),
              child: Text(
                "Interested in our premium plan and looking for a long-term collaboration.",
                style: TextStyle(
                  fontSize: AppSize.width(0.038),
                  color: Colors.black87,
                ),
              ),
            ),

            const Divider(height: 40, thickness: 1, color: Color(0xFFF0F0F0)),

            // Activities Section
            _buildSectionTitle("Activities"),
            _buildActivityItem(
              icon: Icons.call,
              title: "Called",
              subtitle: "12 Jan 2024 • 11:30 AM",
              description: "Discussed requirement and sent proposal.",
            ),
            SizedBox(height: AppSize.height(0.1)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryBlue,
        child: const Icon(Icons.edit, color: Colors.white),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F7FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.primaryBlue, size: 24),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(AppSize.width(0.05), 0, AppSize.width(0.05), AppSize.height(0.02)),
      child: Text(
        title,
        style: TextStyle(
          fontSize: AppSize.width(0.045),
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.width(0.05), vertical: AppSize.height(0.008)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: AppSize.width(0.3),
            child: Text(
              label,
              style: TextStyle(
                fontSize: AppSize.width(0.038),
                color: Colors.grey.shade600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: AppSize.width(0.038),
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String description,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.width(0.05)),
      child: Container(
        padding: EdgeInsets.all(AppSize.width(0.04)),
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.primaryBlue, size: 20),
            SizedBox(width: AppSize.width(0.03)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: AppSize.width(0.04),
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: AppSize.width(0.032),
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.005)),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: AppSize.width(0.035),
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
