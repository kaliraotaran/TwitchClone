

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/colors.dart';
import 'package:myapp/json/discover_json.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: getbody(),
    );
  }
  Widget getbody(){
    return SingleChildScrollView(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Text('Discover', style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: white
          ),),
          SizedBox(height: 15,),
          getslider()
        ],
      ),
    );
  }
  Widget getslider(){
    var size = MediaQuery.of(context).size;
    return CarouselSlider(items: List.generate(discover_json_one.length, (index) {
        return Column(
          children: [
              getSliderImage(discover_json_one[index])
          ],
        );
    }), options: CarouselOptions(height: 240));
  }
  Widget getSliderImage(item){
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 180,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
            Container(
              width: size.width,
              height: 180,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(item['img_video'],), fit: BoxFit.cover)
              ),
            ),
            Container(
              width: size.width,
              height: 180,
              decoration: BoxDecoration(
                color: black.withOpacity(0.2),

              ),
            ),
            Container(
              width: size.width,
              height: 180,
              child: Column(
                children: [
                  
                ],
              ),
            )
        ],
      ),
    );
  }
}