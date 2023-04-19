import 'package:calling/screens/pageviews/dash_board_screen.dart';
import 'package:calling/utils/universal_variables.dart';
import 'package:flutter/material.dart';

class RecomendsPlants extends StatefulWidget {
  const RecomendsPlants({
    Key? key,
  }) : super(key: key);

  @override
  State<RecomendsPlants> createState() => _RecomendsPlantsState();
}

class _RecomendsPlantsState extends State<RecomendsPlants> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          RecomendPlantCard(
            profile: "assets/proone.jpeg",
            name: "고길동",
            keyword1: "육아",
            keyword2: "집안일",
            keyword3: "저금",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DashBoardScreen(),
                ),
              );
            },
          ),
          RecomendPlantCard(
            profile: "assets/protwo.jpeg",
            name: "유명한",
            keyword1: "탐정",
            keyword2: "범죄",
            keyword3: "수사",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DashBoardScreen(),
                ),
              );
            },
          ),
          RecomendPlantCard(
            profile: "assets/prothree.jpeg",
            name: "신형만",
            keyword1: "발냄새",
            keyword2: "맥주",
            keyword3: "가장",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    Key? key,
    required this.profile,
    required this.name,
    required this.keyword1,
    required this.keyword2,
    required this.keyword3,
    required this.press,
  }) : super(key: key);

  final String profile, name, keyword1, keyword2, keyword3;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        top: 20 / 2,
        bottom: 20 * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(profile),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DashBoardScreen(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(20 / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: UniversalVariables.blueColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$name\n".toUpperCase(),
                            style: TextStyle(
                              color: UniversalVariables.blackColor,
                              fontWeight: FontWeight.bold
                            )),
                        TextSpan(
                          text: "$keyword1\n".toUpperCase(),
                          style: TextStyle(
                            color: UniversalVariables.greyColor,
                          ),
                        ),
                        TextSpan(
                          text: "$keyword2\n".toUpperCase(),
                          style: TextStyle(
                            color: UniversalVariables.greyColor,
                          ),
                        ),
                        TextSpan(
                          text: "$keyword3".toUpperCase(),
                          style: TextStyle(
                            color: UniversalVariables.greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.favorite, color: Colors.red,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}