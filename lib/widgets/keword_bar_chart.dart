/*

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class KeywordBarChart extends StatefulWidget {


  const KeywordBarChart({Key? key}) : super(key: key);

  @override
  State<KeywordBarChart> createState() => _KeywordBarChartState();
}

class _KeywordBarChartState extends State<KeywordBarChart> {
  List<double> keyword = [23.8, 33.2, 11.8, 8.7, 12.4];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            child: Text(
              '나의 관심사',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 16.0,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    margin: 10.0,
                    showTitles: true,
                    //textStyle: Styles.chartLabelsTextStyle,
                    rotateAngle: 35.0,
                    getTitles: (double value) {
                      switch (value.toInt()) {
                        case 0:
                          return '축구';
                        case 1:
                          return '월드컵';
                        case 2:
                          return '황희찬';
                        case 3:
                          return '포르투갈';
                        case 4:
                          return '호날두';
                        default:
                          return '';
                      }
                    },
                  ),
                  leftTitles: AxisTitles(
                      margin: 10.0,
                      showTitles: true,
                      //textStyle: Styles.chartLabelsTextStyle,
                      getTitles: (value) {
                        if (value == 0) {
                          return '0';
                        } else if (value % 3 == 0) {
                          return '${value ~/ 3 * 5}K';
                        }
                        return '';
                      }),
                ),
                gridData: FlGridData(
                  show: true,
                  checkToShowHorizontalLine: (value) => value % 3 == 0,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.black12,
                    strokeWidth: 1.0,
                    dashArray: [5],
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: keyword
                    .asMap()
                    .map((key, value) => MapEntry(
                    key,
                    BarChartGroupData(
                      x: key,
                      barRods: [
                        BarChartRodData(
                          y: value,
                          color: Colors.red,
                        ),
                      ],
                    )))
                    .values
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


*/
