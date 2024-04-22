

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
 import 'package:flutter/material.dart';
 import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:icons_plus/icons_plus.dart';
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
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
       const   Text('Discover', style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: white
          ),),
         const SizedBox(height: 15,),
          getslider(),
        const  SizedBox(height: 20,),
          getSectionTwo(),
        const  SizedBox(height: 20,),
          getSectionThree(),
        const  SizedBox(height: 20,),
          getSectionFour()
        ],
      ),
    );
  }
  Widget getslider(){
    var size = MediaQuery.of(context).size;
    return CarouselSlider(items: List.generate(discover_json_one.length, (index) {
      List tags=  discover_json_one[index]['tags'];
        return Column(
          children: [
              getSliderImage(discover_json_one[index]),
              Container(
                width: size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Padding(
                  padding:const EdgeInsets.only(top: 5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(discover_json_one[index]['name'], style:const TextStyle( 
                            color: white, 
                            fontWeight: FontWeight.bold, 
                            fontSize: 18
                          ),),
                        const  SizedBox(width: 6,),
                          Text(discover_json_one[index]['type'],style: TextStyle(
                            color: white.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                          ),)
                        ],
                      ),
                     const SizedBox(height: 5,),
                                Row(
                                  children: List.generate(tags.length, (index) {
                                    return Container(
                                      margin:const EdgeInsets.symmetric(horizontal: 4),
                                        decoration: BoxDecoration(
                                          color: white.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(13)
                                        ),
                                        child: Padding(
                                          padding:const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                                          child: Text(tags[index],style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: white.withOpacity(0.7)
                                          ),),
                                        ),
                                    ); 
                                  }),
                                ),
                    ],
                  ),
                ),
              )
          ],
        );
    }), options: CarouselOptions(height: 240));
  }
  Widget getSliderImage(item){
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 180,
      margin:const EdgeInsets.symmetric(horizontal: 5),
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
            SizedBox(
              width: size.width,
              height: 180,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(

                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child:const Padding(
                        padding:   EdgeInsets.all(4.0),
                        child: Text('LIVE', style: TextStyle(
                          color: white, fontWeight: FontWeight.w600
                        ),),
                      ) ,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: black.withOpacity(0.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('${item['viewers']}', style:const TextStyle(
                          color:   white
                        ),),
                      ),
                    )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
  
  Widget getSectionTwo(){
    var size = MediaQuery.of(context).size;
    return Wrap(
      spacing: 10,
      runSpacing: 10,
        children:List.generate(discover_icons.length, (index){
          return Container(
              width: (size.width - 40)/2,
              height: 45,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(discover_icons[index]['label'], style:const TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.bold,
                      color: white
                    ),),
                    Icon(discover_icons[index]['icon'],color: white, )
                  ],
                ),
              ),
          );
        }),
    );
  }

  Widget getSectionThree(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
      const  Text('Streams we think you\'ll love', style: TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 18),),
      const  SizedBox(height:15 ,),
        getSectionThreeLists()

      ],
    );
  }

  Widget getSectionThreeLists(){
    var size=  MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(discover_json_three.length, (index) 
        {
         List tags=  discover_json_one[index]['tags'];
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width *0.7,
                  height: 150,
                  margin:const EdgeInsets.only(right: 5),
                  decoration:const BoxDecoration(
                    color: primary
                  ),
                   child: Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  discover_json_three[index]['img_video']),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      width: size.width,
                      height: 150,
                      decoration: BoxDecoration(color: black.withOpacity(0.2)),
                    ),
                    SizedBox(
                      width: size.width,
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(4)),
                              child:const Padding(
                                padding:   EdgeInsets.all(4.0),
                                child: Text(
                                  "LIVE",
                                  style: TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  "${discover_json_three[index]['viewers']} viewers",
                                  style:const TextStyle(color: white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                )
           
              ,const SizedBox(height: 12,),
              Row(
                children: [
                  CircleAvatar(backgroundImage: NetworkImage(discover_json_three[index]['img_profile']),),
                 const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(discover_json_three[index]['name'], 
                      style:const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: white
                      ),
                      ),
                     const SizedBox(height: 3,),
                       SizedBox(
                        width: 200,
                        height: 70,
                         child: Text(discover_json_three[index]['title'], 
                            style: TextStyle(fontSize: 15, 
                            overflow: TextOverflow.clip,
                            fontWeight: FontWeight.w400, color: white.withOpacity(0.5)
                            ),
                          ),
                        ),
                   const   SizedBox(height: 3,),
                       Text(discover_json_three[index]['type'], 
                      style: TextStyle(fontSize: 15, 
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold, color: white.withOpacity(0.5)
                      ),
                      ),
                   const   SizedBox(height: 8,),
                      Row(
                                  children: List.generate(tags.length, (index) {
                                    return Container(
                                      margin:const EdgeInsets.symmetric(horizontal: 4),
                                        decoration: BoxDecoration(
                                          color: white.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(13)
                                        ),
                                        child: Padding(
                                          padding:const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                                          child: Text(tags[index],style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: white.withOpacity(0.7)
                                          ),),
                                        ),
                                    );
                                  }),
                                ),
                    ],
                  ),
                const  SizedBox(width: 10,),
                const  Icon(FeatherIcons.moreVertical, color: white,size: 20,)
                ],
              )
              ],
          );
        })
      ),
    );
  }
  Widget getSectionFour(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const  Text(
            'Categories we think you\'ll like ', 
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: white),

          ),
         const SizedBox(height: 15,),
          getSectionFourLists()
      ],
    );
  }
  Widget getSectionFourLists(){
    var size = MediaQuery.of(context).size;
    
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  List.generate(discover_json_four.length, (index){
         List tags=  discover_json_four[index]['tags'];

         return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Container(
              margin:const EdgeInsets.only(right: 15),
              width: size.width/3,
              height: 180,
              decoration: BoxDecoration(
                color: primary,
                image: DecorationImage(image: NetworkImage(discover_json_four[index]['img_video'],), fit: BoxFit.cover)
              ),
              ),
              const SizedBox(height: 7,),
              Text(discover_json_four[index]['name'],
              style:const TextStyle(
                fontSize: 17,
                color: white,
                fontWeight: FontWeight.bold
              ),
              ),
            const  SizedBox(height: 5,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration:const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.redAccent
                        ),
                      ),
                    const  SizedBox(width: 5,),
                      Text(discover_json_four[index]['viewers'], style: TextStyle(
                        color: white.withOpacity(0.5)
                      ),),
                    const  SizedBox(width: 5,),
                    
                    ],
                ) ,
               const SizedBox(height: 5,),
                 Container(
                  width: size.width/3,
                   child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                     child: Row(
                                      children: List.generate(tags.length, (index) {
                                        return Container(
                                          margin:const EdgeInsets.symmetric(horizontal: 4),
                                            decoration: BoxDecoration(
                                              color: white.withOpacity(0.2),
                                              borderRadius: BorderRadius.circular(13)
                                            ),
                                            child: Padding(
                                              padding:const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                                              child: Text(tags[index],style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: white.withOpacity(0.7)
                                              ),),
                                            ),
                                        );
                                      }),
                                    ),
                   ),
                 ),
           ],
         );
        })
          
       
      ),
    );
  }
}