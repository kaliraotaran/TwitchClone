



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/colors.dart';
import 'package:myapp/json/browse_json.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key});

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(90),),
        body: getBody(),
      ),
    );
  }
  Widget getAppBar(){
    return AppBar(
      backgroundColor: bgColor,
      flexibleSpace: const Padding(padding:   EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: [
            Text('Browse', 
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: white
            ),
            )
          ],
        ),
      ),
      bottom:const PreferredSize(
        
        preferredSize: Size.fromHeight(40),
        child: Align(alignment: Alignment.centerLeft,
      child: Padding(padding:   EdgeInsets.all(12),
      child: TabBar(
        indicatorColor: primary,
        indicatorWeight: 1,
        isScrollable: true,
        dividerColor: Colors.black,
        tabs: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Categories', style: TextStyle(fontSize: 15, fontWeight:FontWeight.w600),),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Live Channels', style: TextStyle(
              fontSize: 15, 
              fontWeight: FontWeight.w600
            ),),
          )
        ],
      ),
      ),
      ),)
    );
  }
Widget getBody(){
  return TabBarView(children: [
      getCategories(),
      Center(
        child: Text('Live Channels'),
      )
  ]);
}
   Widget   getCategories(){
    return SingleChildScrollView(
      child: Column(
        children: List.generate(categories.length, (index){
            return Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: Row(
                children: [
                  Container(
                      width: 60,
                      height: 80,
                      decoration: BoxDecoration(
                        color: primary, 
                        image: DecorationImage(
                          image: NetworkImage(categories[index]['img_video']), 
                          fit: BoxFit.cover)),
                      
                  ),
                  SizedBox(width: 15,),
                  Flexible(child: Container(
                    height: 80,
                    child: Padding(padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Column(
                      children: [
                        
                      ],
                    ),
                    ),
                  
                  ))
                ],
              ),
            );
        })
      ),
    );
   }

}