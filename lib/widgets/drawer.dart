import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
// import "package:flutter_exp/themes.dart";
// import "package:flutter/widgets.dart";

// ignore: camel_case_types
class mydrawer extends StatelessWidget {
  const mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      
      child:Container(
        color: const Color.fromARGB(255, 120, 79, 233) ,
        child: ListView(
          
          children: const [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
              accountName:Text("Aniket"), accountEmail: Text("Aniket@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("assets/images/profile.jpeg"),
              ),
              )
              ),
              
              ListTile(
                leading: Icon(CupertinoIcons.profile_circled,color: Colors.white,),
                title: Text("Profile",style: TextStyle(color:Colors.white),),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.home,color: Colors.white,),
                title: Text("Home",style: TextStyle(color:Colors.white),),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.settings,color: Colors.white,),
                title: Text("Settings",style: TextStyle(color:Colors.white),),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.search,color: Colors.white,),
                title: Text("Search",style: TextStyle(color:Colors.white),),
              ),
          ],
        ),
      ),
    );
  }
}