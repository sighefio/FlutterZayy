import 'package:flutter/material.dart';
import 'package:account/pages/home_page.dart';
import 'package:account/pages/item_detail_page.dart';
import 'package:account/pages/signup.dart';
import 'package:account/pages/signin.dart';
import 'package:account/pages/loading_page.dart';
import 'package:provider/provider.dart';
import 'package:account/provider/global_data.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // create: (_) => AllData(),
      providers: [
        ChangeNotifierProvider(create: (_)=>AllData()),
        // ChangeNotifierProvider<AllData>.value(value: AllData()),
      ],
      child: MaterialApp(
        initialRoute: '/itemdetail',
        routes: {
          "/home": (context)=>Home(),
          "/itemdetail": (context)=>ItemDetailPage(),
          "/signup": (context)=>Signup(),
          "/signin": (context)=>Signin(),
          "/loading": (context)=>Loading(),
        },
        theme: ThemeData(
          fontFamily: 'Padauk',
        ),
      ),
    );
  }
}
