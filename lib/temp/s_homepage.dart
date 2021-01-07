import 'package:flutter/material.dart';
import 'package:svmapp/temp/widgets_homepage.dart';

import 'constants.dart';
import 'widgets.dart';

class homepage extends StatefulWidget {
  static const id = "homepage";

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  ScrollController _scrollController;
  var swipeUpOpacity = 0.0001;

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor: bgcolor,
        body: SafeArea(
          child: Stack(
            children: [
              Row(
                children: [
                  // no1(isSelected),
                  Expanded(
                    flex: 4,
                    child: Stack(
                      children: [
                        Center(
                          child: FractionallySizedBox(
                            heightFactor: 1,
                            widthFactor: 0.95,
                            child: Transform.translate(
                              offset: Offset(0, AppBar().preferredSize.height),
                              child: CustomScrollView(
                                physics: BouncingScrollPhysics(),
                                controller: _scrollController,
                                slivers: [
                                  SliverList(
                                    delegate: SliverChildListDelegate([
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 15),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Select from a wide range of Courses!",
                                                overflow: TextOverflow.fade,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                  ),
                                  SliverGrid(
                                    gridDelegate:
                                        SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 855.0,
                                      mainAxisSpacing: 30.0,
                                      crossAxisSpacing: 30.0,
                                      childAspectRatio: 1.5,
                                    ),
                                    delegate: SliverChildBuilderDelegate(
                                      (BuildContext context, int index) {
                                        return Container(
                                          alignment: Alignment.center,
                                          child: coursecard(
                                            index,
                                            courses[index].path,
                                            courses[index].title,
                                            courses[index].subtitle,
                                            courses[index].desc,
                                          ),
                                        );
                                      },
                                      childCount: courses.length,
                                    ),
                                  ),
                                  SliverList(
                                    delegate: SliverChildListDelegate([
                                      SizedBox(
                                        height: 100,
                                      ),
                                    ]),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        appBar(swipeUpOpacity),
                      ],
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
