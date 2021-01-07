import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:svmapp/temp/widgets_homepage.dart';
import 'package:svmapp/widgets/responsive.dart';

import 'constants.dart';
import 'widgets.dart';

final _store = FirebaseFirestore.instance;

class likedcourses extends StatefulWidget {
  static const id = "likedcourses";

  @override
  _likedcoursesState createState() => _likedcoursesState();
}

class _likedcoursesState extends State<likedcourses> {
//  var likes = [1, 2, 3, 4];
  List<int> likes = [];
  ScrollController _scrollController;
  var swipeUpOpacity = 0.0001;

  @override
  void initState() {
    super.initState();
    getLikes();
    _scrollController = ScrollController(
//       initialScrollOffset: 0,
        );
    _scrollController.addListener(scrollFader);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  List<bool> isSelected = [true, false, false, false, false];

  int gridcount = 4;

  void scrollFader() {
    setState(() {
      if (_scrollController.offset > 60) {
        swipeUpOpacity = 1;
      } else {
        swipeUpOpacity = (_scrollController.offset) / 60;
      }
//      print(swipeUpOpacity);
    });
  }

  // @override
  // void initState() {
  //   super.initState();

  // }

  void getLikes() async {
    for (int i = 0; i < courses.length; i++) {
      try {
        // ignore: unused_local_variable
        var doc =
            _store.collection(userrEmail).doc(i.toString()).get().then((v) {
          if (v.data().containsValue(1)) {
            setState(() {
              likes.add(i);
            });
          }
        });
      } catch (e) {}
    }
  }

  int blength(likes) {
    int ans = 0;
    for (int i = 0; i < courses.length; i++) {
      if (likes.contains(i)) {
        ans += 1;
      }
    }
    return ans;
  }

  List<TableRow> courseTile(likes) {
    List<TableRow> temp = [];
    for (int i = 0; i < likes.length; i++) {
      temp.add(fakeEntry());
      print(temp);
      temp.add(likeCard(likes[i]));
      print(temp);
      print(likeCard(likes[i]));
    }
    return temp;
  }

  TableRow fakeEntry() {
    return TableRow(
      children: [
        SizedBox(
          child: Container(
            //color: Colors.red,
            height: 20,
            width: 20,
          ),
          height: 20,
        ),
        SizedBox(
          child: Container(
            //color: Colors.pink,
            height: 20,
            width: 20,
          ),
          height: 20,
        ),
        SizedBox(
          child: Container(
            //color: Colors.blue,
            height: 20,
            width: 20,
          ),
          height: 20,
        ),
      ],
    );
  }

  TableRow likeCard(i) {
    return TableRow(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
//            Text(
//              "",
//              style: TextStyle(
//                color: Colors.white,
//                fontSize: 16,
//                fontWeight: FontWeight.w300,
//              ),
//            ),
//            hseparators(),
            SizedBox(
              height: 40,
              width: 70,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset(courses[i].path),
              ),
            ),
            hseparators(),
            Expanded(
              child: Text(
                courses[i].title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                courses[i].subtitle,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
          child: Container(
            alignment: Alignment.bottomLeft,
            child: GestureDetector(
              onDoubleTap: () {
                setState(() {
                  try {
                    _store.collection(userrEmail).doc(i.toString()).update({
                      "liked": -1,
                    });
                    likes.remove(i);
                  } catch (e) {}
                });
              },
              child: Icon(
                LineIcons.bookmark_o,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor: bgcolor,
        body: Stack(
          children: [
            Row(
              children: [
                //no1([false, false, false, false, true]),
                Expanded(
                  flex: 6,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.deepOrangeAccent),
                    child: ListView(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 50, left: 30, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.yellowAccent,
                                        blurRadius: 120,
                                        spreadRadius: 8,
                                        offset: Offset(
                                          -1,
                                          -1,
                                        )),
                                  ],
                                ),
                                child: Icon(Icons.bookmark_border_outlined,
                                    size: 100, color: Colors.yellow),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "" + userrEmail,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      "Bookmarked Courses",
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            ResponsiveWidget.isSmallScreen(
                                                    context)
                                                ? 50
                                                : 80,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),  
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Container(
                        //   height: 800,
                        //   padding:
                        //       EdgeInsets.only(top: 50, left: 30, right: 30),
                        //   //color: Colors.black54.withOpacity(0.3),
                        //   child: Table(

                        //     columnWidths: {
                        //       0: FlexColumnWidth(5),
                        //       1: FlexColumnWidth(2),
                        //     },
                        //     children: [
                        //           TableRow(
                        //             children: [
                        //               Text(
                        //                 "Course",
                        //                 style: tableTitle,
                        //               ),
                        //               Text(
                        //                 "Offered By",
                        //                 style: tableTitle,
                        //               ),
                        //               Text(
                        //                 "Status",
                        //                 style: tableTitle,
                        //               ),
                        //             ],
                        //           )
                        //         ] +
                        //         courseTile(likes),
                        //   ),
                        // ),
                        Container(
                          height: 800,
                          width: 1000,
                          color: Colors.deepOrangeAccent,
                          child: ListView.builder(
                            shrinkWrap: false,
                            itemCount: courses.length,
                            itemBuilder: (BuildContext context, int index) {
                              return likes.contains(index)
                                  ?  Container(
                                    width: 100,
                                      margin: EdgeInsets.symmetric(vertical:20,horizontal:400 ),
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          border: Border.all(
                                              color: Colors.brown[300]),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      //color: Colors.black,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 200,
                                            width: 400,
                                            child: FittedBox(
                                                fit: BoxFit.fill,
                                                clipBehavior: Clip.antiAlias,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    courses[index].path,
                                                    //height: 350.0,
                                                    //   width: 100.0,
                                                  ),
                                                )),
                                          ),
                                          Text(
                                            courses[index].title,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            courses[index].subtitle,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white38),
                                          ),
                                          Row(
                                                children: [
                                                  Text('Remove',style: TextStyle(color: Colors.white,fontSize: 14),),
                                                  GestureDetector(
                                                    onDoubleTap: () {
                                                      setState(() {
                                                        try {
                                                          _store
                                                              .collection(
                                                                  userrEmail)
                                                              .doc(index.toString())
                                                              .update({
                                                            "liked": -1,
                                                          });
                                                          likes.remove(index);
                                                        } catch (e) {}
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.bookmark,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                        ],
                                      ))
                                   : Container();
                                  //Container(
                                  //     margin: EdgeInsets.symmetric(vertical:20,horizontal:400 ),
                                  //     padding: EdgeInsets.all(20),
                                  //     decoration: BoxDecoration(
                                  //         color: Colors.blue,
                                  //         border: Border.all(
                                  //             color: Colors.brown[300]),
                                  //         borderRadius:
                                  //             BorderRadius.circular(20)),
                                  //     //color: Colors.black,
                                  //     child: Column(
                                  //       children: [
                                  //         SizedBox(
                                  //           height: 200,
                                  //           width: 400,
                                  //           child: FittedBox(
                                  //               fit: BoxFit.fill,
                                  //               clipBehavior: Clip.antiAlias,
                                  //               child: ClipRRect(
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(
                                  //                         8.0),
                                  //                 child: Image.asset(
                                  //                   courses[index].path,
                                  //                   //height: 350.0,
                                  //                   //   width: 100.0,
                                  //                 ),
                                  //               )),
                                  //         ),
                                  //         Text(
                                  //           courses[index].title,
                                  //           style: TextStyle(
                                  //               fontSize: 20,
                                  //               color: Colors.white),
                                  //         ),
                                  //         Text(
                                  //           courses[index].subtitle,
                                  //           style: TextStyle(
                                  //               fontSize: 15,
                                  //               color: Colors.white38),
                                  //         ),
                                  //         Row(
                                  //               children: [
                                  //                 Text('Remove',style: TextStyle(color: Colors.white,fontSize: 14),),
                                  //                 GestureDetector(
                                  //                   onDoubleTap: () {
                                  //                     setState(() {
                                  //                       try {
                                  //                         _store
                                  //                             .collection(
                                  //                                 userrEmail)
                                  //                             .doc(index.toString())
                                  //                             .update({
                                  //                           "liked": -1,
                                  //                         });
                                  //                         likes.remove(index);
                                  //                       } catch (e) {}
                                  //                     });
                                  //                   },
                                  //                   child: Icon(
                                  //                     Icons.bookmark,
                                  //                     color: Colors.red,
                                  //                   ),
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //       ],
                                  //     ));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            appBar(swipeUpOpacity),
          ],
        ),
      ),
    );
  }
}
