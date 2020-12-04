import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:account/provider/global_data.dart';
import 'package:provider/provider.dart';
import 'package:account/components/item_detail/bottom_add_to_cart.dart';
import 'package:account/components/item_detail/top_nav_bar.dart';






class ItemDetailPage extends StatefulWidget {
  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}


class _ItemDetailPageState extends State<ItemDetailPage> {
  double width;
  double height;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    this.width = MediaQuery.of(context).size.width/300;
    this.height = MediaQuery.of(context).size.height/300;
    return Consumer<AllData>(
      builder:(context,allData,child)=> Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Positioned(
              top: this.height*40,
              height: this.height*230,
              width: this.width*300,
              child: Container(
                decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(color: Colors.black,spreadRadius: 3,blurRadius: 8,offset: Offset(0,0))
                    // ]
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Container(
                      child: Image(
                        fit: BoxFit.fitHeight,
                        height: this.height*90,
                        image: AssetImage("assets/images/chicken.jpg"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: this.height*20,left: this.width*20,right: this.width*20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(this.width*this.height*10),
                        // border: Border.all(width: this.width*this.height*0.3,color: Colors.grey)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: this.height*20,
                          ),
                          Container(
                            child: Text(
                              "Chicken Meat",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: this.height*14,
                                fontWeight: FontWeight.w700,
                                wordSpacing: -this.width*3
                              ),
                            ),
                          ),
                          SizedBox(
                            height: this.height*1,
                          ),
                          Container(
                            child: Text(
                              "1 Viss",
                              style: TextStyle(
                                color: Colors.red[200],
                                fontSize: this.height*6
                              ),
                            ),

                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Positioned(
            //   height: this.height*100,
            //   width: this.width*300,
            //   bottom: this.height*100,
            //   child: Container(
            //   ),
            // ),
            TopNavBar(height: this.height,width: this.width,),
            BottomAddToCart(height: this.height,width: this.width,)
          ],
        ),
      ),
    );
  }
}
