



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:myapp/colors.dart';
import 'package:myapp/json/browse_json.dart';
import 'package:myapp/json/discover_json.dart';
import 'package:myapp/json/following_json.dart';

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
     getLiveChannels()
  ]);
}

   Widget   getCategories(){
     
    return SingleChildScrollView(
      child: Column(
        children: List.generate(categories.length, (index){
            List tags=  categories[index]['tags'];
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(categories[index]['name'], style: TextStyle(
                          fontSize: 16, 
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),
                        maxLines: 1,
                        ),
                        Text("${categories[index]['viewers']} viewers" ,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.grey), maxLines: 1
                        ,),
                        SizedBox(height: 4,),
                        SingleChildScrollView(
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

 

  Widget getLiveChannels(){
    var size=  MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: List.generate(following_json.length, (index) 
        {
         List tags=  following_json[index]['tags'];
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  width: size.width ,
                  height: 200,
                  
                  decoration:const BoxDecoration(
                    color: primary
                  ),
                   child: Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  following_json[index]['img_video']),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      width: size.width,
                      height: 200,
                      decoration: BoxDecoration(color: black.withOpacity(0.2)),
                    ),
                    SizedBox(
                      width: size.width,
                      height: 200,
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
                                  "${following_json[index]['viewers']} viewers",
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
           
              ,const SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(backgroundImage: NetworkImage(following_json[index]['img_profile']),),
                   const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(following_json[index]['name'], 
                        style:const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: white
                        ),
                        ),
                       const SizedBox(height: 3,),
                         SizedBox(
                          width: 200,
                          height: 23,
                           child: Text(following_json[index]['title'], 
                              style: TextStyle(fontSize: 15, 
                              overflow: TextOverflow.clip,
                              fontWeight: FontWeight.w400, color: white.withOpacity(0.5)
                              ),
                            ),
                          ),
   
                         Text(following_json[index]['type'], 
                        style: TextStyle(fontSize: 15, 
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold, color: white.withOpacity(0.5)
                        ),
                        ),
                     const SizedBox(height: 8,),
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
                  
                  ],
                ),
                const  SizedBox(width: 10,),
                  const  Icon(FeatherIcons.moreVertical, color: white,size: 20,)
                  ],
                ),
              ),
              SizedBox(height: 20,)
            
              ],
              
          );
        })
      ),
    );
  }

}