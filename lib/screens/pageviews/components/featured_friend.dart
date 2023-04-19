import 'package:flutter/material.dart';


class FeaturedFriend extends StatelessWidget {
  const FeaturedFriend({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          FeaturePlantCard(
            profile: "assets/proone.jpeg",
            press: () {},
          ),
          FeaturePlantCard(
            profile: "assets/protwo.jpeg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class FeaturePlantCard extends StatelessWidget {
  const FeaturePlantCard({
    Key? key,
    required this.profile,
    required this.press,
  }) : super(key: key);
  final String profile;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.only(
          left: 20,
          top: 20 / 2,
          bottom: 20 / 2,
        ),
        width: size.width * 0.8,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(profile),
          ),
        ),
      ),
    );
  }
}