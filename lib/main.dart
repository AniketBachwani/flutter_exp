import "package:flutter/material.dart";
import "package:flutter_exp/core/store.dart";
import "package:flutter_exp/floatingpage.dart";
import "package:flutter_exp/homepage.dart";
import "package:flutter_exp/loading.dart";
import "package:flutter_exp/login.dart";
import "package:flutter_exp/utils/routes.dart";
import "package:flutter_exp/widgets/drawer.dart";
import "package:velocity_x/velocity_x.dart";

void main() {

  runApp( VxState(
    store: MyStore(),
    child: const Application()));

}

class Application extends StatelessWidget {
  const Application({super.key});

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: myroutes.loginroute,
      routes: {
        myroutes.loginroute:(context) => const Login(),
        myroutes.homeroute : (context) => const homepage(),
        myroutes.drawerroute : (context) => const mydrawer(),
        myroutes.loadingroute : (context) => const lodingpage(),
        myroutes.floatingpagerote : (context) => const Floatingpage()
      },
    );
  }
}
