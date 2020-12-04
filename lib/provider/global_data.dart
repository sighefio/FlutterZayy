import 'package:account/models/app.dart';
import 'package:account/models/menus.dart';
import 'package:account/models/items.dart';
import 'package:account/models/sub_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AllData extends ChangeNotifier{
  //Themes Colors are here***********************************************************************************************
  Color _menuColor = Color.fromRGBO(2, 43, 255, 1);
  Color _menuTextColor = Colors.white;
  Color _activeMenuColor = Colors.yellowAccent;


  Color get menuColor => this._menuColor;
  Color get menuTextColor => this._menuTextColor;
  Color get activeMenuColor => this._activeMenuColor;


  void resetColor (){
    this._menuColor=Color.fromRGBO(2, 43, 255, 1);
    this._menuTextColor=Colors.white;
    this._activeMenuColor = Colors.yellowAccent;
    notifyListeners();
  }



  void  setMenuColor(String R,String G,String B){
    this._menuColor = Color.fromRGBO(int.parse(R), int.parse(G), int.parse(B), 1);
    notifyListeners();
  }
  void  setMenuTextColor(String R,String G,String B){
    this._menuTextColor = Color.fromRGBO(int.parse(R), int.parse(G), int.parse(B), 1);
    notifyListeners();
  }
  void  setActiveMenuColor(String R,String G,String B){
    this._activeMenuColor = Color.fromRGBO(int.parse(R), int.parse(G), int.parse(B), 1);
    notifyListeners();
  }

  // PageController _subCategoryPageController = PageController(initialPage: 0);
  // PageController get subCategoryPageController => this._subCategoryPageController;
  // void setSubCategoryPageController(int e){
  //   this._subCategoryPageController.animateToPage(e, duration: null, curve: null);
  //   notifyListeners();
  // }


  // Future<List> hitApiForItem() async {
  //   try{
  //     Response response = await get("http://35.213.188.65/cooking/").timeout(Duration(seconds: 3),onTimeout: (){
  //       print("Connection Time out");
  //       // this.hitApiForItem();
  //       return jsonDecode("[]");
  //     });
  //     return jsonDecode(response.body);
  //   }catch(e){
  //     print(e);
  //     return jsonDecode("[]");
  //   }
  // }

  List<Items> _items=[Items(id: 0,english: "No Data No Data",zawgyi: "No Data",uni: "No Data",app: 0,category: 0,discount: 0,description: "No Data",photo: "https://cdn.onlinewebfonts.com/svg/img_126042.png",thumbnail: "https://cdn.onlinewebfonts.com/svg/img_126042.png",price: 0,unit: 0)];
  List<Items> get items {
    return this._items;
  }


  void setItems(List<Items> response){
    this._items = response;
    notifyListeners();
  }
  void setCooking(List<Items> response){
    this._items = response.where((e) {
      if(e.app == 1){
        return true;
      }
      return false;
    }).toList();
    notifyListeners();
  }


  void deleteItems(){
    this._items = this._items.where((element) {
      if(element.id != 1){
        return true;
      }
      return false;
    }).toList();
    notifyListeners();
  }



  //App or Category here ******************************************************************************************************
  List<AppOrCategory> _app = [
    AppOrCategory(id: 0,uni: "အားလုံး",zawgyi: "အားလုံး",name: "All"),
  ];

  int _activeApp = 1;

  List<AppOrCategory> get app => this._app;
  int get activeApp => this._activeApp;
  void setActiveApp (int e){
    this._activeApp = e;
  }

  void setApp(List response){
    this._app = [AppOrCategory(id: 0,uni: "အားလုံး",zawgyi: "အားလုံး",name: "All")
      ,...response];
    notifyListeners();
  }

  //Sub Category here *****************************************************************************************
  List<SubCategory> _subCategory=[SubCategory(id: 0,uni: "အားလုံး",zawgyi: "အားလုံး",name: "All",app: 0)];
  int _activeSubCategory = 0;

  int get activeSubCategory => this._activeSubCategory;
  List<SubCategory> get subCategory {
    return this._subCategory;
  }
  void setActiveSubCategory (int e){
    this._activeSubCategory =e;
    notifyListeners();
  }

  // Future<List> hitApiForSubCategory() async{
  //   // Response response =await get('http://35.213.188.65/cooking/category/');
  //   // if(response.statusCode != 200){
  //   //   return [];
  //   // }
  //   // return jsonDecode(response.body);
  //   try{
  //     Response response = await get("http://35.213.188.65/cooking/category/").timeout(Duration(seconds: 3),onTimeout: (){
  //       print("Connection Time out(2)");
  //
  //       // this.hitApiForSubCategory();
  //       return jsonDecode("[]");
  //     });
  //     if(response.statusCode < 210){
  //       return jsonDecode(response.body);
  //     }
  //     return jsonDecode("[]");
  //   }catch(e){
  //     print(e);
  //     return jsonDecode("[]");
  //   }
  // }
  void setSubCategory(List<SubCategory> response){
    this._subCategory = [
      SubCategory(id: 0,uni: "အားလုံး",zawgyi: "အားလုံး",name: "All",app: 0),
      ...response
    ];
    notifyListeners();
  }



  //Menus are here *************************************************************************************************************************
  List<Menu> _menus = [
    Menu(name: 'Home',route: '/home',icon: Icons.home),
    Menu(name: 'History',route: '/history',icon: Icons.history),
    Menu(name: 'Home',route: '/home',icon: Icons.home),
    Menu(name: 'Setting',route: '/setting',icon: Icons.settings),
    Menu(name: 'Account',route: '/account',icon: Icons.account_circle_outlined),
  ];
  List<Menu> get menus {
    return this._menus;
  }

  //SubCategory

  void deleteSubCategory(int id){
    this._subCategory = this._subCategory.where((e){
      if(e.id != id){
        return true;
      }
      return false;
    }).toList();
    notifyListeners();
  }




}
