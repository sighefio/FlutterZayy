import 'package:account/models/app.dart';
import 'package:flutter/material.dart';
import 'package:account/services/http_requests.dart';
import 'package:account/provider/global_data.dart';
import 'package:provider/provider.dart';

class PopUpLoading extends StatefulWidget {
  @override
  _PopUpLoadingState createState() => _PopUpLoadingState();
}

class _PopUpLoadingState extends State<PopUpLoading> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Color> _colorTween;
  List<AppOrCategory> app;



  void getData() async {
    RequestData instance = RequestData();
    if(this.app[0].id!=0){
      await instance.getItems(app: this.app[0].name);
      await instance.getCategory(app: this.app[0].name);
      context.read<AllData>().setSubCategory(instance.responseForSubCategory);
      context.read<AllData>().setItems(instance.responseForItem);
    }
    Navigator.of(context).pop();
  }



  @override
  dispose() {
    this._animationController.dispose(); // you need this
    super.dispose();
  }

  @override
  void initState() {

    this.app = context.read<AllData>().app.where((e){
      if(e.id == context.read<AllData>().activeApp){
        return true;
      }
      return false;
    }).toList();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 1800),
      vsync: this,
    );
    _colorTween = _animationController
        .drive(ColorTween(begin: Colors.yellow, end: Colors.blue));
    _animationController.repeat();

    super.initState();
    this.getData();

  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: CircularProgressIndicator( strokeWidth: 5,valueColor: this._colorTween),
    );
  }
}




