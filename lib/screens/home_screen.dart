import 'package:calling/provider/user_provider.dart';
import 'package:calling/screens/callscreens/pickup/pickup_layout.dart';
import 'package:calling/screens/pageviews/chat_list_screen.dart';
import 'package:calling/screens/pageviews/dash_board_screen.dart';
import 'package:calling/utils/universal_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calling/provider/user_provider.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController(
    initialPage: 0,
  );
  int _page = 0;
  UserProvider? userProvider;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider?.refreshUser();
    });
    pageController = PageController();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    double _labelFontSize = 10;
    return Scaffold(
        backgroundColor: UniversalVariables.blackColor,
        body: PageView(
          children: <Widget>[
            Container(child: ChatListScreen(),),
            Center(
              child: Text("Chat List Screen"),
            ),
            Container(child: DashBoardScreen(),),
            Center(
              child: Text("Call Log"),
            ),
            Center(
              child: Text("Contact Screen"),
            )
          ],
          controller: pageController,
          onPageChanged: onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: BottomNavigationBar(
              backgroundColor: UniversalVariables.blackColor,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat,
                      color: (_page == 0)
                          ? UniversalVariables.lightBlueColor
                          : UniversalVariables.greyColor),
                  label: "대화방",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.call,
                      color: (_page == 1)
                          ? UniversalVariables.lightBlueColor
                          : UniversalVariables.greyColor),
                  label: "전화",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.contact_phone,
                      color: (_page == 2)
                          ? UniversalVariables.lightBlueColor
                          : UniversalVariables.greyColor),
                  label: "연락처",
                ),
              ],
              onTap: navigationTapped,
              currentIndex: _page,
              selectedFontSize: _labelFontSize,
              selectedLabelStyle: TextStyle(
                  color: (_page == 0)
                      ? UniversalVariables.lightBlueColor
                      : Colors.grey),
              ),
            ),
          ),
    );
  }
}
