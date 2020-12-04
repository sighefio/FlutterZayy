import 'package:flutter/material.dart';
class Search_Bar extends StatelessWidget {
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    this.width = MediaQuery.of(context).size.width/300;
    this.height = MediaQuery.of(context).size.height/300;
    return Expanded(
      flex: 4,
      child: Container(

        child: Column(
          children: [
            SizedBox(
              height: this.height*15,
            )
            ,
            Row(
              children: [
                Expanded(
                  flex:2,
                  child: Container(),
                ),
                Expanded(
                  flex:20,
                  child:Container(
                    padding: EdgeInsets.symmetric(horizontal: this.width*6),
                    height: this.height*18,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(color: Colors.black,width: 0.01),
                        borderRadius: BorderRadius.circular(35),
                        boxShadow: [BoxShadow(color: Colors.grey,offset: Offset.zero,blurRadius: 3,spreadRadius: 1)]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            print("a");
                          },
                          child: Icon(
                              Icons.search
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              print("B");
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: this.width*3,),
                              child: Text("Search Items"),
                            ),
                          ),
                        ),
                        Image(
                          image: AssetImage("assets/images/zzzaaay.png"),
                          height: this.height*10,
                          width: this.width*25,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex:2,
                  child: Container(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}