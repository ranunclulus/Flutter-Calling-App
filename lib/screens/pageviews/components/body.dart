import 'package:calling/screens/pageviews/components/featured_friend.dart';
import 'package:calling/screens/pageviews/components/header_with_search_box.dart';
import 'package:calling/screens/pageviews/components/recomend_plants.dart';
import 'package:calling/screens/pageviews/components/title_with_more_button.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "추천하는 말벗", press: () {}),
          RecomendsPlants(),
          TitleWithMoreBtn(title: "지난 만남을 가졌던 말벗", press: () {}),
          FeaturedFriend(),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}