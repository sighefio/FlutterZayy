
import 'dart:convert';
import 'package:account/models/items.dart';
import 'package:account/models/sub_category.dart';
import 'package:account/models/app.dart';
import 'package:http/http.dart';

class RequestData{
  bool retry = false;
  String url = "http://10.0.2.2:8000/";
  List<Items> responseForItem ;
  List<SubCategory> responseForSubCategory;
  List<AppOrCategory> responseForAppOrCategory;
  int statusCodeForItem;
  int statusCodeForSubCategory;
  int statusCodeForAppOrCategory;

  Future<bool> getAppOrCategory () async {
    try{
      Response _response = await get("${this.url}app/").timeout(Duration(seconds: 5));
      if(_response.statusCode==200){
        this.retry = false;
        this.statusCodeForAppOrCategory = _response.statusCode;
        List data = jsonDecode(_response.body);
        this.responseForAppOrCategory = data.map((e){
          return AppOrCategory(id: e["id"],name: e["name"],uni: e["uni"],zawgyi: e["zawgyi"]);
        }).toList();
        return null;
      }else{
        this.statusCodeForAppOrCategory = 400;
        return null;
      }
    }
    catch(e){
      this.statusCodeForAppOrCategory = 400;
      return null;
    }
  }

  Future<Response> getItems({String app}) async{
    try{
      Response _response = await get("${this.url}$app?want=item").timeout(Duration(seconds: 5));
      if (_response.statusCode == 200){
        this.statusCodeForItem = 200;
        this.retry = false;
        List data = jsonDecode(_response.body);
        this.responseForItem = data.map((e) => Items(
                id: e['id'],
                english: e['english'],
                zawgyi: e['zawgyi'],
                uni:e['uni'],
                unit: e['unit'],
                description: e['description'],
                category: e['category'],
                app: e['app'],
                photo: e['photo'],
                thumbnail: e['thumbnail'],
                price: e['price'],
                discount: e['discount']
                )).toList();
        return null;
      }
      else{
        this.statusCodeForItem = 400;
        return null;
      }
    }
    catch(e){
      this.statusCodeForItem = 400;
      return null;
    }
  }

  Future<bool> getCategory ({String app}) async {
    try{
      Response _response = await get("${this.url}$app?want=category").timeout(Duration(seconds: 5));
      if(_response.statusCode==200){
        this.retry = false;
        this.statusCodeForSubCategory = _response.statusCode;
        List data = jsonDecode(_response.body);
        this.responseForSubCategory = data.map((e){
          return SubCategory(id: e["id"],name: e["name"],uni: e["uni"],zawgyi: e["zawgyi"],app: e['app']);
        }).toList();
        return null;
      }else{
        this.statusCodeForSubCategory = 400;
        return null;
      }
    }
    catch(e){
        this.statusCodeForSubCategory = 400;
        return null;
    }
  }
}