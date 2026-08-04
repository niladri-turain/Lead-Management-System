import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_size.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize.init(context);
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu, color: AppColors.primaryBlue),
        title: Text(
          "Dashboard",
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
            icon: const Icon(Icons.notifications_none, color: AppColors.primaryBlue),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSize.width(0.04)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: AppSize.width(0.04),
              mainAxisSpacing: AppSize.height(0.02),
              childAspectRatio: 1.5,
              children: [
                _buildStatCard("Total Leads", "1,245", Icons.person_outline, Colors.blue),
                _buildStatCard("New Leads", "234", Icons.person_add_alt_1_outlined, Colors.purple),
                _buildStatCard("Follow Ups", "82", Icons.edit_note, Colors.orange),
                _buildStatCard("Today's Meetings", "18", Icons.calendar_today_outlined, Colors.blueAccent),
                _buildStatCard("Invoice Pending", "32", Icons.description_outlined, Colors.deepOrange),
                _buildStatCard("Invoice Paid", "56", Icons.check_circle_outline, Colors.green),
              ],
            ),
            SizedBox(height: AppSize.height(0.03)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Leads Overview",
                  style: TextStyle(
                    fontSize: AppSize.width(0.045),
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBlue,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.width(0.02),
                    vertical: AppSize.height(0.005),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AppSize.width(0.02)),
                  ),
                  child: Row(
                    children: [
                      Text("This Month", style: TextStyle(fontSize: AppSize.width(0.03))),
                      Icon(Icons.keyboard_arrow_down, size: AppSize.width(0.04)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSize.height(0.02)),
            Container(
              height: AppSize.height(0.3),
              width: double.infinity,
              padding: EdgeInsets.only(
                top: AppSize.height(0.03),
                right: AppSize.width(0.06),
                left: AppSize.width(0.02),
                bottom: AppSize.height(0.01),
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppSize.width(0.04)),
              ),
              child: _buildLeadsChart(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeadsChart() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 100,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.grey.shade200,
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: AppSize.height(0.04),
              interval: 1,
              getTitlesWidget: (value, meta) {
                final style = TextStyle(
                  color: Colors.grey,
                  fontSize: AppSize.width(0.03),
                );
                if (value == 1 || value == 7 || value == 14 || value == 21 || value == 28 || value == 31) {
                  return SideTitleWidget(
                    meta: meta,
                    space: AppSize.width(0.02),
                    child: Text(value.toInt().toString(), style: style),
                  );
                }
                return Container();
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 100,
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  meta: meta,
                  space: AppSize.width(0.02),
                  child: Text(
                    value.toInt().toString(),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: AppSize.width(0.03),
                    ),
                  ),
                );
              },
              reservedSize: AppSize.width(0.12),
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        minX: 1,
        maxX: 31,
        minY: 0,
        maxY: 300,
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(1, 20),
              FlSpot(7, 120),
              FlSpot(12, 60),
              FlSpot(16, 150),
              FlSpot(20, 260),
              FlSpot(24, 140),
              FlSpot(28, 200),
              FlSpot(31, 140),
            ],
            isCurved: true,
            curveSmoothness: 0.35,
            color: AppColors.primaryBlue,
            barWidth: AppSize.width(0.008),
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: AppSize.width(0.008),
                  color: AppColors.primaryBlue,
                  strokeWidth: AppSize.width(0.003),
                  strokeColor: Colors.white,
                );
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryBlue.withOpacity(0.15),
                  AppColors.primaryBlue.withOpacity(0.01),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String count, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(AppSize.width(0.03)),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSize.width(0.04)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: AppSize.width(0.025),
            offset: Offset(0, AppSize.height(0.005)),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: AppSize.width(0.05)),
              SizedBox(width: AppSize.width(0.02)),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: AppSize.width(0.03),
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Text(
            count,
            style: TextStyle(
              fontSize: AppSize.width(0.05),
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlue,
            ),
          ),
        ],
      ),
    );
  }
}
