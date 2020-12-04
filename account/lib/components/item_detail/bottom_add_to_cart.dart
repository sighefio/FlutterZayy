import 'package:flutter/material.dart';








class BottomAddToCart extends StatelessWidget {
  final double height;
  final double width;

  BottomAddToCart({this.height,this.width});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      width: this.width*300,
      height: this.height*30,
      child: Container(
        decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black,blurRadius: this.height*40,offset: Offset(0,-this.height*10))
        ]
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            SizedBox(
              width: this.width*30,
            ),
            IconButton(
              color: Colors.black,
              hoverColor: Colors.green,
              icon: Icon(
                Icons.favorite_border,
                color: Colors.pinkAccent,
                size: this.height*13,
              ),
              onPressed: (){
                print("a");
              },
            ),
            Expanded(
              child: Container(),
            ),
            RaisedButton.icon(
              color: Colors.yellowAccent[400],
              padding: EdgeInsets.symmetric(vertical: this.height*4,horizontal: this.width*15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
              ),
              icon: Icon(
                Icons.add_shopping_cart,
                color: Colors.grey[800],
                size: this.height*11,
              ),
              label: Text(
                "Add to cart",
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: this.height*7.4,
                  letterSpacing: this.height*0.4
                ),
              ),
              onPressed: (){

              },
            ),
            SizedBox(
              width: this.width*30,
            )
          ],
        ),
      ),
    );
  }
}
