import 'package:account/provider/global_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CircleCart extends StatelessWidget {
  final double width;
  final double height;
  CircleCart({this.width,this.height});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: this.width*115,
      height: this.height*35,
      width: this.width*70,
      child: Consumer<AllData>(
        builder: (context,allData,child)=> GestureDetector(
          onTap: (){
            allData.setCooking(allData.items);
          },
          child: Container(
            decoration: BoxDecoration(
              // border: Border.all(width: 0,color: Colors.black),
              // color: Color.fromRGBO(222, 175, 27, 1),
                color: allData.menuColor,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [BoxShadow(offset: Offset(0,-5),blurRadius: 2,color: Colors.black,spreadRadius: 0.1)],

            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "10",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: allData.menuTextColor,
                  ),
                ),
                Icon(
                  Icons.shopping_cart,
                  size: 30,
                  color: allData.menuTextColor,
                ),
                Text(
                  "Cart",
                  style: TextStyle(
                    color: allData.menuTextColor,
                  ),
                )
              ],
            ),

          ),
        ),
      ),
    );
  }
}