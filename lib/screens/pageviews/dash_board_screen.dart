import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:calling/widgets/appbar.dart';
import 'package:flutter/material.dart';

import '../../utils/universal_variables.dart';
import '../../widgets/keword_bar_chart.dart';
import '../../widgets/stats_grid.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  CustomAppBar dashAppBar(BuildContext context) {
    return CustomAppBar(
        title: Text("STATISTIC"),
        actions: <Widget> [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, "/search_screen");
            },
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        centerTitle: true
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dashAppBar(context),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(),
          _buildWeekTabBar(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            sliver: SliverToBoxAdapter(
              child: StatsGrid(),
            )
          ),
          SliverPadding(
              padding: const EdgeInsets.only(top: 20.0),
              sliver: SliverToBoxAdapter(
                //child: KeywordBarChart(),
              )
          ),
        ]
      ),
    );
  }

  SliverPadding _buildHeader() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          "나의 대화 관심사",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildWeekTabBar() {
    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: 2,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(25.0)
          ),
          child: TabBar(
            indicator: BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 40.0,
              indicatorColor: UniversalVariables.blackColor,
            ),
            labelStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
            indicatorColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Text("이번 주"),
              Text("지난 주"),
            ],
            onTap: (index) {},
          ),
        ),
      ),
    );

  }
}

