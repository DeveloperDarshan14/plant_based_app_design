import 'package:flutter/material.dart';
import 'package:plant_based_app/Screens/widgets/plant_widget.dart';

import '../constants.dart';
import '../models/plants.dart';



class favorite_Page extends StatefulWidget {
  final List<Plant> favoritedPlants;
  const favorite_Page({Key? key, required this.favoritedPlants})
      : super(key: key);
  @override
  State<favorite_Page> createState() => _favorite_PageState();
}

class _favorite_PageState extends State<favorite_Page> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      body: widget.favoritedPlants.isEmpty
          ? Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Image.asset('assets/images/favorited.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Your favorited Plants',
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
            ),
          ],
        ),
      )
          : Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        height: size.height * .5,
        child: ListView.builder(
            itemCount: widget.favoritedPlants.length,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return PlantWidget(
                  index: index, plantList: widget.favoritedPlants);
            }),
      ),
    );
  }
}
