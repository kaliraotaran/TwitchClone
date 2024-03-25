

import 'package:flutter/material.dart';
import 'package:myapp/colors.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage({super.key});

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: getbody(),
    );
  }
  Widget getBody(){
    return SingleChildScrollView(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Text('Following', style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: white
          ),),
          SizedBox(height: 15,),
          Text('Channels Recommended for You', style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: white
          ),),
          SizedBox(height: 15,),
          getvideoList()
        ],
      ),
    );

  }
  Widget getVideoList(){
    var size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(10, (index){
        return Column(
          children: [
            Row(
              children: [
                Container(

                )
              ],
            )
          ],
        )
      })
    );
  }
}