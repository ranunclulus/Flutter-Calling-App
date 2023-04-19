import 'package:calling/utils/universal_variables.dart';
import 'package:flutter/material.dart';

class StatsGrid extends StatefulWidget {
  const StatsGrid({Key? key}) : super(key: key);

  @override
  State<StatsGrid> createState() => _StatsGridState();
}

class _StatsGridState extends State<StatsGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('축구', '23.8%', UniversalVariables.blueone),
                _buildStatCard('월드컵', '33.2%', UniversalVariables.bluetwo),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('황희찬', '11.8%', UniversalVariables.bluethree),
                _buildStatCard('포르투갈', '8.7%', UniversalVariables.bluefour),
                _buildStatCard('호날두', '12.4%', UniversalVariables.bluefive),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Expanded _buildStatCard(String title, String count, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
