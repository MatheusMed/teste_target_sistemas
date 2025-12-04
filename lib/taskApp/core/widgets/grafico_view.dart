import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraficoView extends StatelessWidget {
  final double letras;
  final double numeros;

  const GraficoView({super.key, required this.letras, required this.numeros});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 100,
          minY: 0,
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return const Text("Letras");
                    case 1:
                      return const Text("Números");
                  }
                  return const SizedBox();
                },
              ),
            ),
          ),
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(
                  toY: letras,
                  width: 50,
                  color: const Color(0xFF6D0000),
                  borderSide: const BorderSide(width: 3, color: Colors.black),
                ),
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  toY: numeros,
                  width: 50,
                  color: const Color(0xFFFF8A00),
                  borderSide: const BorderSide(width: 3, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
