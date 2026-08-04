import 'package:flutter/material.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_size.dart';
import '../../../widgets/custom_textfield.dart';

class LeadCreateScreen extends StatefulWidget {
  const LeadCreateScreen({super.key});

  @override
  State<LeadCreateScreen> createState() => _LeadCreateScreenState();
}

class _LeadCreateScreenState extends State<LeadCreateScreen> {
  String? selectedSource;
  String? selectedDesignation;
  String? selectedEmployee;
  String? selectedState;
  String? selectedDistrict;
  bool saveAsWhatsapp = false;

  @override
  Widget build(BuildContext context) {
    AppSize.init(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primaryBlue, size: AppSize.width(0.06)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Add New Lead",
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
            CustomTextField(
              label: "Company Name",
              hintText: "Enter company name",
            ),
            SizedBox(height: AppSize.height(0.02)),
            CustomTextField(
              label: "Contact Person",
              hintText: "Enter contact person name",
            ),
            SizedBox(height: AppSize.height(0.02)),
            CustomTextField(
              label: "Email ID",
              hintText: "Enter email ID",
            ),
            SizedBox(height: AppSize.height(0.02)),
            Row(
              children: [
                Text(
                  "Mobile No",
                  style: TextStyle(
                    fontSize: AppSize.width(0.035),
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade600,
                  ),
                ),
                const Spacer(),
                Checkbox(
                  value: saveAsWhatsapp,
                  onChanged: (val) {
                    setState(() {
                      saveAsWhatsapp = val ?? false;
                    });
                  },
                  activeColor: AppColors.primaryBlue,
                  visualDensity: VisualDensity.compact,
                ),
                Text(
                  "Save As Whatsapp No",
                  style: TextStyle(
                    fontSize: AppSize.width(0.03),
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            CustomTextField(
              label: "",
              hintText: "Enter mobile number",
            ),
            SizedBox(height: AppSize.height(0.02)),
            CustomTextField(
              label: "WhatsApp No",
              hintText: "Enter WhatsApp number",
            ),
            SizedBox(height: AppSize.height(0.02)),
            _buildDropdownField("Designation", "Select Designation", ["Manager", "Developer", "Designer"], selectedDesignation, (val) {
              setState(() => selectedDesignation = val);
            }),
            SizedBox(height: AppSize.height(0.02)),
            _buildDropdownField("Lead Source", "Select Source", ["Website", "Social Media", "Referral", "Cold Call"], selectedSource, (val) {
              setState(() => selectedSource = val);
            }),
            SizedBox(height: AppSize.height(0.02)),
            CustomTextField(
              label: "Type Of Service",
              hintText: "Enter type of service",
            ),
            SizedBox(height: AppSize.height(0.02)),
            _buildDropdownField("Account Manager", "Select Employee", ["Samrat", "Rahul", "Amit"], selectedEmployee, (val) {
              setState(() => selectedEmployee = val);
            }),
            SizedBox(height: AppSize.height(0.02)),
            _buildDropdownField("State", "Select State", ["West Bengal", "Delhi", "Maharashtra"], selectedState, (val) {
              setState(() => selectedState = val);
            }),
            SizedBox(height: AppSize.height(0.02)),
            _buildDropdownField("District", "Select District", ["Kolkata", "North 24 Parganas", "South 24 Parganas"], selectedDistrict, (val) {
              setState(() => selectedDistrict = val);
            }),
            SizedBox(height: AppSize.height(0.02)),
            CustomTextField(
              label: "Pincode",
              hintText: "Enter pincode",
            ),
            SizedBox(height: AppSize.height(0.02)),
            CustomTextField(
              label: "Address",
              hintText: "Enter full address",
              maxLines: 4,
            ),
            SizedBox(height: AppSize.height(0.04)),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                minimumSize: Size(double.infinity, AppSize.height(0.065)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.width(0.02)),
                ),
              ),
              child: Text(
                "Add Lead",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppSize.width(0.045),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: AppSize.height(0.04)),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label, String hint, List<String> items, String? value, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: AppSize.width(0.035),
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade600,
          ),
        ),
        SizedBox(height: AppSize.height(0.01)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: AppSize.width(0.04)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.width(0.03)),
            border: Border.all(color: Colors.grey.shade500),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              hint: Text(
                hint,
                style: TextStyle(color: Colors.grey.shade400, fontSize: AppSize.width(0.04)),
              ),
              isExpanded: true,
              items: items
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
