import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopNavBar extends StatelessWidget {
  final double width;
  final double height;

  TopNavBar({this.height,this.width});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: this.height*10,
      width: this.width*300,
      height: this.height*30,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(offset: Offset(0,this.height*1),blurRadius: this.height*10,spreadRadius: this.height*0.05,color: Colors.black)
          ]
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            SizedBox(
              width: this.width*10,
            ),
            GestureDetector(
              onTap: (){

              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50)
                ),
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.grey[300],
                  size: this.height*12,
                ),
              ),
            ),

            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Image(
                  height: this.height*13,
                  image: AssetImage(
                    "assets/images/zzzaaay.png",
                  ),
                ),
              ),
            ),
            Container(
              width: this.width*40,
              child: Stack(
                children: [
                  Positioned(
                    top: this.height*5,
                    child:   Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)
                      ),
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.grey[300],
                        size: this.height*12,
                      ),
                    ),
                  ),
                  Positioned(
                    top: this.height*3,

                    child: Container(
                      width: this.width*40,
                      alignment: Alignment.center,
                      child: Text(
                        "10",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                            fontSize: this.height*7,
                            color: Colors.redAccent[400]
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: this.width*10,
            )
          ],
        ),
      ),
    );
  }
}
