import 'package:account/models/items.dart';
import 'package:account/services/http_requests.dart';
import 'package:account/provider/global_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:async/async.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}


class _LoadingState extends State<Loading> {
  bool retry = false;
  bool doIRetry = true;

  void getData() async {
    RequestData instance = RequestData();
    try{
      await instance.getAppOrCategory();
      await instance.getItems(app:"cooking");
      await instance.getCategory(app: "cooking");
    }catch(e){
      print("Error is $e");
    }
    context.read<AllData>().setApp(instance.responseForAppOrCategory);
    context.read<AllData>().setItems(instance.responseForItem);
    context.read<AllData>().setSubCategory(instance.responseForSubCategory);
    this.doIRetry = false;
    if(instance.statusCodeForItem==200 && instance.statusCodeForSubCategory==200) {
      Navigator.pushReplacementNamed(context, "/home");
    }
    // if(instance.retry == true){
    //   print("Retry plz");
    // }
  }

  
  @override
  void initState() {

    this.getData();
    if(!this.retry){
      Future.delayed(Duration(seconds: 5), () {
        if(this.doIRetry){
          setState(() {
            this.retry = true;
          });
        }
      });
    }
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Center(
      child: this.retry ? Container(
        child: GestureDetector(
          onTap: (){
            this.getData();
            setState(() {
              this.doIRetry = true;
              this.retry = false;
              if(!this.retry){
                Future.delayed(Duration(seconds: 5), () {
                  if(this.doIRetry){
                    setState(() {
                      this.retry = true;
                    });
                  }
                });
              }
            });
          },
          child: Text(
            "Tap to retry",
            style: TextStyle(
              decorationStyle: null,
              fontSize: 30,
              color: Colors.white,

            ),
          ),
        ),
      ):Container(
        child: GestureDetector(
          onTap: (){
          },
          child: Text(
            "Loading...",
            style: TextStyle(
              decorationStyle: null,
              fontSize: 30,
              color: Colors.white,

            ),
          ),
        ),
      ),
    );
  }
}


