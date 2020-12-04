import 'package:flutter/material.dart';
import 'package:account/provider/global_data.dart';
import 'package:provider/provider.dart';



class BottomMenuBar extends StatefulWidget {
  final double height;
  final double width;
  BottomMenuBar({this.width,this.height});
  @override
  _BottomMenuBarState createState() => _BottomMenuBarState(width: this.width,height: this.height);
}

class _BottomMenuBarState extends State<BottomMenuBar> {
  double height;
  double width;

  _BottomMenuBarState({this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Consumer<AllData>(
      builder:(context,allData,child)=> Positioned(
        bottom: 0,
        height: this.height*25,
        width: this.width*300,
        child: Container(
          decoration: BoxDecoration(
            // color: Color.fromRGBO(222, 175, 27, 1),
            color: allData.menuColor,
            boxShadow: [BoxShadow(offset: Offset(0,-1),blurRadius: 8,color: Colors.black,spreadRadius: 0.1)],
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: allData.menus.map((e) => GestureDetector(
                onTap: (){
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: this.height*3,horizontal: this.width*10),
                  child: Column(
                    children: [
                      Icon(
                        e.icon,
                        color: e.name=="Home"? allData.activeMenuColor:allData.menuTextColor,
                      ),
                      Text(
                        e.name,
                        style: TextStyle(
                          color: e.name=="Home"?  allData.activeMenuColor:allData.menuTextColor,
                        ),
                      )
                    ],
                  ),
                ),
              )).toList()
          ),
        ),
      ),
    );
  }
}
