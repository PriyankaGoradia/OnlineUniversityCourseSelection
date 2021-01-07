import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:svmapp/screens/home_page.dart';
import 'package:svmapp/temp/constants.dart';
import 'package:svmapp/temp/s_homepage.dart';

import 'likedCourses.dart';

var _store = FirebaseFirestore.instance;

class homesidetiles extends StatelessWidget {
  var icon;
  var text;
  bool selected;

  homesidetiles(this.icon, this.text, this.selected);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: selected ? Colors.lightBlueAccent : Colors.white.withOpacity(0),
        borderRadius: BorderRadius.circular(15),
      ),
      child: FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 0.8,
        child: Row(
          children: [
            Icon(
              icon,
              color: selected
                  ? Colors.white.withOpacity(0.9)
                  : Colors.grey.withOpacity(0.7),
              size: 25,
            ),
            Flexible(
              child: Text(
                "   " + text,
                style: selected ? selectedSidebar : sidebar,
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class homesidetiles2 extends StatelessWidget {
  var icon;
  var text;
  bool selected;

  homesidetiles2(this.icon, this.text, this.selected);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: selected
            ? Colors.blue.withOpacity(0.2)
            : Colors.white.withOpacity(0),
        borderRadius: BorderRadius.circular(5),
      ),
      height: 40,
      width: double.infinity,
      child: FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 0.8,
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              color: icon == LineIcons.bookmark
                  ? Colors.blue.withOpacity(0.2)
                  : Colors.black,
              child: Icon(
                icon,
                color: icon == LineIcons.bookmark
                    ? Colors.blue.shade200
                    : Colors.black,
                size: 20,
              ),
            ),
            Flexible(
              child: Text(
                "   " + text,
                style: sidebar,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class appBar extends StatefulWidget {
  var opacity;
  appBar(this.opacity);

  @override
  _appBarState createState() => _appBarState();
}

class _appBarState extends State<appBar> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    setState(() {
//      print("In init");
      print(Cauth);
//      Cauth;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      color: Colors.black45.withOpacity(widget.opacity),
      height: AppBar().preferredSize.height,
      width: double.infinity,
      child: FractionallySizedBox(
        heightFactor: 0.6,
        widthFactor: 0.95,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 60,
                      width: 120,
                      padding: EdgeInsets.only(left: 25, right: 25),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white)),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => homepage()));
                        },
                        child: Center(
                          child: Text(
                            "Courses",
                            style: sign,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => likedcourses()));
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      height: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white)),
                      child: Center(
                        child: Text(
                          "Bookmarked Courses",
                          style: sign,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      height: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white)),
                      child: Center(
                        child: Text(
                          "Home",
                          style: sign,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class coursecard extends StatefulWidget {
  String imagepath, title, subtitle, desc;
  int i;

  coursecard(this.i, this.imagepath, this.title, this.subtitle, this.desc);

  @override
  _coursecardState createState() => _coursecardState();
}

class _coursecardState extends State<coursecard> {
  double ops = 0;
  bool fresh = true;
  double hfc = 0.9, wfc = 0.8;
  Color defColor = Colors.black87;
   Icon bicon = Icon(Icons.bookmark_outline, size: 40, color: Colors.red);
  //Color defColor = Colors.brown[900];
  @override
  void initState() {
    super.initState();
        _store.collection(userrEmail).doc(widget.i.toString()).get().then((v) {
      if (v.data().containsValue(1)) {
        setState(() {
          Icon bicon = Icon(Icons.bookmark, size: 40, color: Colors.red);
        });
      } else {
        setState(() {
          Icon bicon =
              Icon(Icons.bookmark_outline, size: 40, color: Colors.red);
        });
      }
    });
  }

  bool spy = false;

  void setColor(xyz) {
    setState(() {
      defColor = xyz;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        child: MouseRegion(
          onExit: (_) {
            setState(() {
              defColor = Colors.black87;
              //defColor=Colors.blueGrey.withBlue(100);
              spy = false;
              hfc = hfc / 1.1;
              wfc = wfc / 1.1;
            });
          },
          onEnter: (_) {
            setState(() {
              defColor = Colors.blueGrey[400];
              //defColor = Colors.blue[800];
              spy = true;
              hfc = 1.1 * hfc;
              wfc = 1.1 * wfc;
            });
          },
          child: Center(
            child: FractionallySizedBox(
              heightFactor: hfc,
              widthFactor: wfc,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            height: constraints.maxHeight / 1.7,
                            width: constraints.maxWidth,
                            child: FittedBox(
                                fit: BoxFit.fill,
                                clipBehavior: Clip.antiAlias,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(98.0),
                                  child: Image.asset(
                                    widget.imagepath,
                                  ),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.title,
                              //overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: cardtitle,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Text(
                              widget.subtitle,
                              overflow: TextOverflow.ellipsis,
                              style: cardsubtitle,
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.desc,
                        overflow: TextOverflow.ellipsis,
                        style: carddesc,
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(
                                Icons.star_half,
                                color: Colors.yellow,
                              )
                            ],
                          ),
                          Container(
                              child: FlatButton.icon(
                            textColor: Colors.white,
                            //hoverColor: Colors.,
                            focusColor: Colors.red,
                            splashColor: Colors.grey,
                            label: Text('Bookmark this course'),
                            icon:bicon,
                            //Icon(Icons.bookmark_outline,
                            //     size: 40, color: Colors.red),
                            color: defColor,
                            onPressed: () {
                              setColor(Colors.red.shade600);
                              Future.delayed(Duration(milliseconds: 200), () {
                                setColor(Color(0xFF0F0606));
                              });

                              try {
                                // ignore: unused_local_variable
                                var doc = _store
                                    .collection(userrEmail)
                                    .doc(widget.i.toString())
                                    .get()
                                    .then((v) {
                                  if (v.data().containsValue(1)) {
                                    setState(() {
                                      try {
                                        _store
                                            .collection(userrEmail)
                                            .doc(widget.i.toString())
                                            .update({
                                          "liked": -1,
                                        });
                                        bicon = Icon(Icons.bookmark_outline,
                                            size: 40, color: Colors.red);
                                      } catch (e) {}
                                    });
                                  } else {
                                    setState(() {
                                      try {
                                        _store
                                            .collection(userrEmail)
                                            .doc(widget.i.toString())
                                            .update({
                                          "liked": 1,
                                        });
                                        bicon = Icon(Icons.bookmark,
                                            size: 40, color: Colors.red);
                                      } catch (e) {}
                                    });
                                  }
                                });
                              } catch (e) {}
                            },
                          )),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: defColor,
        ),
      ),
    );
  }
}
