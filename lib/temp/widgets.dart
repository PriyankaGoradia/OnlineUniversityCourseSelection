import 'package:flutter/material.dart';
import 'constants.dart';
// import 'homepage.dart';
// import 'w_homePage.dart';
// import 'likedSongs.dart';
//import 'mylibrary.dart';
import 'likedCourses.dart';
import 'package:line_icons/line_icons.dart';
import 's_homepage.dart';
import 'widgets_homepage.dart';
//import 'search.dart';

class hseparators extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
    );
  }
}

class no1 extends StatelessWidget {
  List<bool> isSelected;

  no1(this.isSelected);
  void none() {}

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.black,
        child: FractionallySizedBox(
          heightFactor: 1,
          child: Center(
            child: ListView(
              children: [
               
                GestureDetector(
                  onTap: () {
                    isSelected[0]
                        ? none()
                        : Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => homepage()),
                          );
                  },
                  child: homesidetiles(LineIcons.book, "Home", isSelected[0]),
                ),
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                    onTap: () {
                      isSelected[4]
                          ? none()
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => likedcourses()),
                            );
                    },
                    child: homesidetiles(
                        LineIcons.bookmark, "Liked Courses", isSelected[4])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
