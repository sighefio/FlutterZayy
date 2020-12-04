import 'package:account/components/home/home_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:account/components/home/popup_dialog.dart';
import 'package:account/components/home/home_search_bar.dart';
import 'package:account/components/home/circle_cart.dart';
import 'package:account/components/home/sub_category.dart';
import 'package:account/components/home/bottom_menu_bar.dart';
import 'package:account/provider/global_data.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List apps = ["Cooking","Pharmacy","Liquor","Other"];
  // List sub_category = ["All","Chicken","Beef","Pork","Fish and Seafood"];
  Color menuColor;
  Color menuTextColor;
  PageController _pageController=PageController(initialPage: 0);
  double width;
  double height;
  bool upDirection = true, flag = true;
  ScrollController _controller;
  int aaa;
  String menuColorR = "2";
  String menuColorG = "43";
  String menuColorB = "255";
  String menuTextColorR = "255";
  String menuTextColorG = "255";
  String menuTextColorB = "255";
  String activeTextColorR = "255";
  String activeTextColorG = "255";
  String activeTextColorB = "0";

  void changePage(){
    this._pageController.animateToPage(context.read<AllData>().activeSubCategory, duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
  }

@override
  void initState() {
    this.menuColor = context.read<AllData>().menuColor;
    this.menuTextColor = context.read<AllData>().menuTextColor;
    super.initState();
    _controller = ScrollController()..addListener(() {
        upDirection = _controller.position.userScrollDirection == ScrollDirection.forward;

        // makes sure we don't call setState too much, but only when it is needed
        if (upDirection != flag) {
          setState(() {
            this.flag = false;
          });
        }
      });
  }


  @override
  Widget build(BuildContext context) {
    this.width = MediaQuery.of(context).size.width/300;
    this.height = MediaQuery.of(context).size.height/300;
    return Consumer<AllData>(
      builder: (context,allData,child){
        return Scaffold(
          resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Search_Bar(),
            HomeNavBar(),
            Expanded(
              flex: 27,
              child: Stack(
                children: [
                  Container(
                    child: PageView(
                      controller: this._pageController,
                      onPageChanged: (e){
                        allData.setActiveSubCategory(e);
                      },
                      children: allData.subCategory.map((e){
                        return Container(
                          child: ListView(
                              controller: _controller,
                              children: [
                                ...(allData.activeSubCategory==0?allData.items:allData.items.where((ee)
                                {
                                  if(ee.category ==(allData.subCategory[allData.activeSubCategory]).id){
                                    return true;
                                  }
                                  return false;
                                }
                                )).toList().asMap().map((index,e) {
                                  return MapEntry(index,Container(
                                    margin: index==0?EdgeInsets.only(top: this.height*8.5,bottom: this.height*5):EdgeInsets.only(bottom: this.height*5),
                                    decoration: BoxDecoration(
                                      // color: Colors.grey[800],
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(width: 0.3,color: Colors.grey)
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: this.height*60,
                                          width: this.width*120,
                                          decoration: BoxDecoration(
                                            // border: Border.all(width: 0.3,color: Colors.black),
                                            // borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(5),
                                            child: Image(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(e.thumbnail),

                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(vertical: 10),
                                            child: Column(
                                              children: [
                                                Text(
                                                  e.english,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                    // fontFamily: 'Roboto',
                                                  ),
                                                ),
                                                Text(
                                                  e.description,
                                                  style: TextStyle(
                                                      color: Colors.white
                                                  ),
                                                )
                                              ],
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  );
                                }).values.toList(),
                                SizedBox(
                                  height: this.height*30,
                                )

                              ]
                          ),
                        );
                      }).toList(),
                    )
                  ),
                  SubCategory(this.changePage),
                  BottomMenuBar(width: this.width,height: this.height,),
                  CircleCart(width: this.width,height: this.height),
                  ...myPositionBox(allData),
                ],
              ),
            )
          ],
        ),
      );},
    );
  }




















  List<Widget> myPositionBox(AllData allData){
    return [Positioned(
      bottom: 0,
      // left: this.width*113,
      left: this.width*115-(this.width*5),
      height: this.height*25,
      width: this.width*10,
      child: Container(
        // color: Color.fromRGBO(222, 175, 27, 1),
        color: allData.menuColor,
      ),
    ),
    Positioned(
    bottom: 0,
    // left: this.width*178,
    left: this.width*185 - (this.width*6),
    height: this.height*25,
    width: this.width*10,
    child: Container(
    // color: Color.fromRGBO(222, 175, 27, 1),
    color: allData.menuColor,
    ),
    )];
  }




}











