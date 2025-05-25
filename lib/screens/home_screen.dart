import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'main_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentPage: HomeScreen,
      content: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome!',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard('Enquiries', '678', Icons.question_answer),
                _buildStatCard('Leads', '347', Icons.leaderboard),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard('Visits', '650', Icons.event),
                _buildStatCard('Calls', '478', Icons.phone),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Quick Actions',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionButton(context, 'Add Customer', Icons.person_add, () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Add Customer functionality not implemented yet.')),
                  );
                }),
                _buildActionButton(context, 'Add Enquiry', Icons.question_answer, () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Add Enquiry functionality not implemented yet.')),
                  );
                }),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionButton(context, 'Log Call', Icons.phone, () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Log Call functionality not implemented yet.')),
                  );
                }),
                _buildActionButton(context, 'Schedule Visit', Icons.event, () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Schedule Visit functionality not implemented yet.')),
                  );
                }),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Report Summary',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildOverviewCard('Enquiries Today', '62'),
                _buildOverviewCard('Visits Today', '12'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildOverviewCard('Leads Today', '30'),
                _buildOverviewCard('Calls Today', '30'),
              ],
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'View Report',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        DropdownButton<String>(
                          value: 'Daily',
                          items: const [
                            DropdownMenuItem(value: 'Daily', child: Text('Daily')),
                            DropdownMenuItem(value: 'Weekly', child: Text('Weekly')),
                            DropdownMenuItem(value: 'Monthly', child: Text('Monthly')),
                          ],
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          maxY: 100,
                          barGroups: [
                            _buildBarGroup(15, 40, 20),
                            _buildBarGroup(16, 60, 30),
                            _buildBarGroup(17, 50, 25),
                            _buildBarGroup(18, 30, 15),
                            _buildBarGroup(19, 70, 35),
                            _buildBarGroup(20, 80, 40),
                            _buildBarGroup(21, 60, 30),
                            _buildBarGroup(22, 50, 25),
                            _buildBarGroup(23, 40, 20),
                            _buildBarGroup(24, 30, 15),
                            _buildBarGroup(25, 20, 10),
                            _buildBarGroup(26, 10, 5),
                          ],
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    'Apr ${value.toInt()}',
                                    style: GoogleFonts.poppins(fontSize: 12),
                                  );
                                },
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 40,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toInt().toString(),
                                    style: GoogleFonts.poppins(fontSize: 12),
                                  );
                                },
                              ),
                            ),
                            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          ),
                          borderData: FlBorderData(show: false),
                          gridData: const FlGridData(show: false),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              color: const Color(0xFFCE93D8),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Validated',
                              style: GoogleFonts.poppins(fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              color: const Color(0xFF7B1FA2),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Closed',
                              style: GoogleFonts.poppins(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sales Report',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            _buildTimeFilterButton('Day', false),
                            _buildTimeFilterButton('Week', false),
                            _buildTimeFilterButton('Month', false),
                            _buildTimeFilterButton('Year', true),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      child: LineChart(
                        LineChartData(
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                const FlSpot(0, 1.5),
                                const FlSpot(1, 1.8),
                                const FlSpot(2, 1.2),
                                const FlSpot(3, 2.13),
                              ],
                              isCurved: true,
                              color: const Color(0xFF7B1FA2),
                              dotData: const FlDotData(show: false),
                            ),
                          ],
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  const labels = ['Mar', 'Apr', 'May', 'Jun'];
                                  return Text(
                                    labels[value.toInt()],
                                    style: GoogleFonts.poppins(fontSize: 12),
                                  );
                                },
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 40,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    '${value}K',
                                    style: GoogleFonts.poppins(fontSize: 12),
                                  );
                                },
                              ),
                            ),
                            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          ),
                          borderData: FlBorderData(show: false),
                          gridData: const FlGridData(show: false),
                          minY: 0,
                          maxY: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String count, IconData icon) {
    return Expanded(
      child: Card(
        color: const Color(0xFFF3E5F5), // Light purple background
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, color: Colors.black),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    count,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, String title, IconData icon, VoidCallback onPressed) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF7B1FA2), // Purple button color
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 8),
            Text(
              title,
              style: GoogleFonts.poppins(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewCard(String title, String count) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                count,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData _buildBarGroup(int x, double validated, double closed) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: validated,
          color: const Color(0xFFCE93D8), // Light purple for Validated
          width: 8,
        ),
        BarChartRodData(
          toY: closed,
          color: const Color(0xFF7B1FA2), // Dark purple for Closed
          width: 8,
        ),
      ],
    );
  }

  Widget _buildTimeFilterButton(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected ? const Color(0xFFF3E5F5) : Colors.white,
          side: const BorderSide(color: Colors.grey),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}