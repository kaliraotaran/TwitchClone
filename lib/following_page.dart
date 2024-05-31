

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:myapp/colors.dart';
import 'package:myapp/json/following_json.dart';

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
      body: getBody(),
    );
  }
  Widget getBody(){
    return SingleChildScrollView(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
  Widget getvideoList(){
    var size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(following_json.length, (index){
        List tags = following_json[index]['tags']; 
        return Column(
          children: [
            Row(
              children: [
                Container(
                    width: size.width *0.32,
                    height: 80,
                    decoration: BoxDecoration(
                      color: primary
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: size.width *0.32,
                          height: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage(following_json[index]['img_profile'],), fit: BoxFit.cover)
                          ),
                        ),
                         Container(
                          width: size.width *0.32,
                          height: 80,
                          decoration: BoxDecoration(
                            color: black.withOpacity(0.2)
                          ),
                          
                        ),
                        Positioned(
                          bottom: 1,
                          left: 8,
                          child: Row(
                            children: [
                              Container(
                                width: 9,
                                height: 9,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.redAccent
                                ),
                              ),
                              SizedBox(width: 5,),
                              Text(following_json[index]['viewers'], style: TextStyle(
                                color: white
                              ),)
                            ],
                          ),
                        )
                      ],
                    ),
                ),
                SizedBox(width: 20,),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    height: 125,
                    decoration: BoxDecoration(
                      color: Colors.black
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                              Row(
                                children: [
                                  Container(
                                    width: 22,
                                    height: 22,
                                    decoration: BoxDecoration(
                                       shape: BoxShape.circle,
                                       image: DecorationImage(image: NetworkImage(following_json[index]['img_profile']), fit: BoxFit.cover)
                                    ),
                                  ),
                                  SizedBox(width: 8,),
                                  Text(following_json[index]['name'], style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: white
                                  ), maxLines: 1,)
                                ],
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: Text(following_json[index]['title'], style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: white.withOpacity(0.5),
                                      overflow: TextOverflow.ellipsis
                                      ),),
                                  ),
                                  SizedBox(width: 10,),
                                  Icon(FontAwesome.ellipsis_vertical_solid, color: white.withOpacity(0.5),size: 20,),
                                  
                                ],
                              ),
                               Row(
                      
                                children: [
                                  Flexible(
                                    child: Text(following_json[index]['type'], style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: white.withOpacity(0.5),
                                      overflow: TextOverflow.ellipsis
                                      ),),
                                  ),
                                  
                                ],
                              ),
                              SizedBox(height: 5,), 
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(tags.length, (index) {
                                    return Container(
                                      margin: EdgeInsets.symmetric(horizontal: 4),
                                        decoration: BoxDecoration(
                                          color: white.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(13)
                                        ),
                                        
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                                          child: Text(tags[index],style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: white.withOpacity(0.7)
                                          ),),
                                        ),
                                    );
                                  }),
                                ),
                              )
                        ],
                      ),
                    ),
                  )
                  )
              ],
            ),
          ],
        );
      })
    );
  }
}