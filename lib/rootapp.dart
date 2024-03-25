


import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:myapp/following_page.dart';

import 'colors.dart';


class RootApp extends StatefulWidget {
  
  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
 int pageindex = 0;

  @override
  Widget build(BuildContext context) {  
   
    return Scaffold(
      appBar: PreferredSize(
        child: myAppbar(),
        preferredSize: Size.fromHeight(60),
      ),
      bottomNavigationBar: getBottom(),

    );
  }

  myAppbar() {
    return  AppBar(
      elevation: 0,
      backgroundColor: bgColor,
      leading: IconButton(onPressed: (){}, icon: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(shape: BoxShape.circle, color: white.withOpacity(0.7)),
        child: Center(
          child: Icon(AntDesign.user_outline, color: black, size: 20,),
        ),
      ),),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(AntDesign.wifi_outline)),
        IconButton(onPressed: (){}, icon: Icon(AntDesign.video_camera_add_outline)),
        IconButton(onPressed: (){}, icon: Icon(AntDesign.inbox_outline)),
        IconButton(onPressed: (){}, icon: Icon(FontAwesome.comment)),
        IconButton(onPressed: (){}, icon: Icon(AntDesign.search_outline)),

      ],

    );
  }

  Widget getBottom() {
    List iconItems =[
      AntDesign.heart_outline,
      AntDesign.compass_outline,
      AntDesign.copy_fill,
       
    ] ;
    List textItems = [
      'Following',
      'Discover',
      'Browser'
    ];
    return Container(
        height: 90,
        width: double.infinity,
        decoration: BoxDecoration(
          color: bgColor,
          border: Border(
            top: BorderSide(width: 0.5, color: white.withOpacity(0.2))
          )
        ),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:List.generate(iconItems.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                       pageindex = index;
                  });
               
                },
                child: Column(
                  children: [
                    Icon(iconItems[index], size: 30, color: pageindex == index ? secondary : white,),
                    SizedBox(height: 3,),
                    Text(textItems[index], style: TextStyle(color: pageindex == index ? secondary : white, fontSize: 11),)
                  ],
                ),
              );
            }),
          ),
        ),
    );
  }
  

  Widget getBody(){
    return IndexedStack(
      index: pageindex, 
      children: [
        FollowingPage(),
        Center
        (child: Text('Discover', style: TextStyle(color: white ),),),
         Center
        (child: Text('Browse', style: TextStyle(color: white ),),)
      ],
    );
  }
}