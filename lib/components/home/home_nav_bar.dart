import 'package:account/provider/global_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:account/components/home/popup_dialog.dart';

class HomeNavBar extends StatefulWidget {
  @override
  _HomeNavBarState createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {

  Color menuColor;
  Color menuTextColor;
  double width;
  double height;



  @override
  void initState() {
    super.initState();
    this.menuColor = context.read<AllData>().menuColor;
    this.menuTextColor = context.read<AllData>().menuTextColor;
  }
  @override
  Widget build(BuildContext context) {
    this.width = MediaQuery.of(context).size.width/300;
    this.height = MediaQuery.of(context).size.height/300;
    return Consumer<AllData>(
      builder: (context,allData,child)=> Expanded(
        flex: 2,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width*12, vertical: height*5),
          decoration: BoxDecoration(
              // color: Color.fromRGBO(222, 175, 27, 1),
            color: allData.menuColor,
              border: Border.all(width: 1,color: Colors.black),
              boxShadow: [
                BoxShadow(offset: Offset(2,2),blurRadius: 10,color: Colors.black,spreadRadius: 2)
              ],
            borderRadius: BorderRadius.circular(15)
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: allData.app.length ,
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  int active = allData.activeApp;
                  allData.setActiveApp(allData.app[index].id);
                  if(active!=allData.activeApp){
                    allData.setActiveSubCategory(0);
                  }
                  this._showMyDialog(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: this.width*6),
                  child: Text(
                    allData.app[index].name,
                    style: TextStyle(
                      color: allData.app[index].id==allData.activeApp ? allData.activeMenuColor: allData.menuTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          )
        ),
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.symmetric(horizontal: this.width*90),
            backgroundColor: Colors.white.withOpacity(0),
            content: PopUpLoading()

        );
      },
    );
  }
}