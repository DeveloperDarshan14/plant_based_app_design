import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:plant_based_app/constants/constants.dart';

import '../models/plants.dart';


class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {

  @override
  Widget build(BuildContext context) {
    int selectedIndex=0;
    Size size= MediaQuery.of(context).size;

    List<Plant> _plantList = Plant.plantList;

    //Plant category
    List<String> _plantTypes =  [
      'Recommended',
      'Indoor',
      'Outdoor',
      'Garden',
      'Supplement',
    ];

    bool toggleIsFavorated(bool isFavorited){
      return !isFavorited;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Container(
             padding: const EdgeInsets.only(top: 20),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Container(
                   padding: const EdgeInsets.symmetric(horizontal: 16),
                   width: size.width * .9,
                   decoration: BoxDecoration(
                     color: Constants.primaryColor.withOpacity(.1),
                     borderRadius: BorderRadius.circular(20)
                   ),
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Icon(Icons.search,color: Colors.black54.withOpacity(.6),),
                       const Expanded(child: TextField(
                         showCursor: false,
                         decoration: InputDecoration(
                           hintText: "Search Plant",
                           border: InputBorder.none,
                           focusedBorder: InputBorder.none
                         ),
                       )),
                       Icon(Icons.mic,color: Colors.black54.withOpacity(.6),),
                     ],
                   ),
                 )
               ],
             ),
           ),
           Container(
             padding: const EdgeInsets.symmetric(horizontal: 12),
             height: 50,
             child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                 itemCount: _plantTypes.length,
                 itemBuilder: (BuildContext context,int index){
               return Padding(padding:const EdgeInsets.all(8.0),
                 child: GestureDetector(
                     onTap: (){
                       setState(() {
                         selectedIndex=index;
                         print("lksjdfljsldk"+selectedIndex.toString());
                       });
                     },
                   child: Text(
                     _plantTypes[index],
                     style: TextStyle(
                       fontSize: 16.0,
                       fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.w300,
                       color: selectedIndex == index? Constants.primaryColor : Constants.blackColor
                     ),
                   ),
                 ),

               );
             }),
           ),
           SizedBox(
             height: size.height * .4,
             child: ListView.builder(
                 itemCount: _plantTypes.length,
                 scrollDirection: Axis.horizontal,
                 itemBuilder: (BuildContext context,int index){
                  return Container(
                    width: 300,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.8),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                            top: 10,
                            right: 20,
                            child: Container(
                              height: 50,
                              width: 50,
                              child: IconButton(
                                onPressed: (){
                                 setState(() {
                                   bool isFavorited = toggleIsFavorated(_plantList[index].isFavorated);
                                    _plantList[index].isFavorated=isFavorited;
                                 });

                                },
                                icon: Icon(_plantList[index].isFavorated == true ? Icons.favorite
                                    : Icons.favorite_border),
                                color: Constants.primaryColor,
                                iconSize: 30.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            )
                        ),
                        Positioned(
                          left: 50,
                          right: 50,
                          top: 50,
                          bottom: 50,
                            child: Image.asset(_plantList[index].imageURL)),
                        Positioned(
                          bottom: 15,
                          left: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_plantList[index].category,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16.0,
                                ),),
                                Text(_plantList[index].plantName,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold
                                ),)
                              ],
                            )),
                        Positioned(
                          bottom: 15,
                            right: 20,

                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:BorderRadius.circular(20),

                              ),
                              child: Text(r'$' + _plantList[index].price.toString(), style: TextStyle(
                                color: Constants.primaryColor,
                                fontSize: 16.0,
                              ),),
                            ))
                      ],
                    ),
                  );
             }),
           ),
           Container(
             padding: EdgeInsets.only(left: 16,bottom: 20,top: 20),
             child: const Text(
               'New Plants',
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 18.0,

               ),
             ),
           ),
           Container(
             padding: const EdgeInsets.symmetric(horizontal: 12),
             height: size.height * .5,
             child: ListView.builder(
                 itemCount: _plantList.length,
                 scrollDirection: Axis.vertical,
                 physics: BouncingScrollPhysics(),
                 itemBuilder: (BuildContext context ,int index){
                 return Container(
                   padding: const EdgeInsets.only(left: 10,top: 10),
                   margin: const EdgeInsets.only(bottom: 10,top: 10),
                   height: 80.0,
                   width: size.width,
                   decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(.1),
                     borderRadius: BorderRadius.circular(10)
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Constants.primaryColor.withOpacity(.8),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                              left: 0,
                              right: 0,
                              child: SizedBox(
                                height: 80.0,
                                child: Image.asset(_plantList[index].imageURL),
                              )),
                          Positioned(
                            left: 80,
                              bottom: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(_plantList[index].category),
                                    Text(_plantList[index].plantName,style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black
                                    ),)
                                  ],
                              )),

                        ],
                      ),

                      Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(r'$' +_plantList[index].price.toString(),style: TextStyle(
                          fontWeight:   FontWeight.bold,
                          fontSize: 18.0,
                          color: Constants.primaryColor,
                        ),),
                      )

                    ],
                   ),
                 );


             }),
           )
          ],
        ),
      ),
    );
  }
}
