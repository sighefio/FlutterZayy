import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:account/provider/global_data.dart';

class SubCategory extends StatefulWidget {
  final Function a;
  SubCategory(this.a);
  @override
  _SubCategoryState createState() => _SubCategoryState(this.a);
}

class _SubCategoryState extends State<SubCategory> {
  Function a;
  _SubCategoryState(this.a);
  double width;
  double height;

  @override
  void initState() {
    super.initState();
    // this.menuTextColor = context.read<AllData>().menuTextColor;
  }
  @override
  Widget build(BuildContext context) {
    this.width = MediaQuery.of(context).size.width/300;
    this.height = MediaQuery.of(context).size.height/300;
    return Consumer<AllData>(
      builder: (context,allData,child) => Positioned(
        top: this.height*0,
        height: this.height*17,
        width: this.width*300,
        child: Container(
          color: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: this.width*10,vertical: this.height*1),
          // margin: EdgeInsets.only(bottom: this.height*10),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: allData.subCategory.length,
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  // int active = allData.activeApp;
                  allData.setActiveSubCategory(index);
                  // if(active)
                  this.a();
                  // menuProvider.deleteSubCategory(menuProvider.subCategory[index].id);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: allData.activeSubCategory==index ? context.read<AllData>().menuColor.withOpacity(0.6) : null,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  margin: index!=allData.subCategory.length-1?EdgeInsets.only(right: this.width*10):EdgeInsets.all(0),
                  padding: EdgeInsets.symmetric(horizontal: this.width*10, vertical: this.height*4),
                  child: Text(
                    allData.subCategory[index].name,
                    style: TextStyle(
                      color: context.read<AllData>().activeMenuColor,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}