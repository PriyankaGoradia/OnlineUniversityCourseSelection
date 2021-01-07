import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:svmapp/widgets/web_scrollbar.dart';
import 'package:svmapp/widgets/bottom_bar.dart';
import 'package:svmapp/widgets/carousel.dart';
import 'package:svmapp/widgets/destination_heading.dart';
import 'package:svmapp/widgets/svmapp_drawer.dart';
import 'package:svmapp/widgets/featured_heading.dart';
import 'package:svmapp/widgets/featured_tiles.dart';
import 'package:svmapp/widgets/floating_quick_access_bar.dart';
import 'package:svmapp/widgets/responsive.dart';
import 'package:svmapp/widgets/top_bar_contents.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: Colors.black,
              //Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
              elevation: 0,
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.brightness_6),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    DynamicTheme.of(context).setBrightness(
                        Theme.of(context).brightness == Brightness.dark
                            ? Brightness.light
                            : Brightness.dark);
                    print(Theme.of(context).brightness);
                  },
                ),
              ],
              title: Text(
                'Smart Village University',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w900,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(_opacity),
            ),
      drawer: SvmappDrawer(),
      body: WebScrollbar(
        color: Colors.blueGrey,
        backgroundColor: Colors.blueGrey.withOpacity(0.3),
        width: 10,
        heightFraction: 0.3,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              //MapSample(),

              Stack(
                children: [
                  Container(
                    //color: Colors.green,
                    child: SizedBox(
                      height: screenSize.height * 0.45,
                      width: screenSize.width,
                      child: Image.asset(
                        'images/bulb.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      FloatingQuickAccessBar(screenSize: screenSize),
                      Container(
                        //color: Colors.green,
                        child: Column(
                          children: [
                            FeaturedHeading(
                              screenSize: screenSize,
                            ),
                            FeaturedTiles(screenSize: screenSize)
                          ],
                        ),
                      ),
                      // MapSample(),
                    ],
                  )
                ],
              ),
              // SizedBox(height: screenSize.height / 8),
              DestinationHeading(screenSize: screenSize),
              DestinationCarousel(),
              SizedBox(height: screenSize.height / 10),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}

const kWhiteColor = Color(0xFFFFFFFF);
const kBlackColor = Color(0xFF000000);
const kTextColor = Color(0xFF1D150B);
const kPrimaryColor = Color(0xFFFB475F);
const kSecondaryColor = Color(0xFFF5E1CB);
const kBorderColor = Color(0xFFDDDDDD);

sb() {
  return SizedBox(height: 20);
}

sbh(double l) {
  return SizedBox(height: l);
}

sbw(double w) {
  return SizedBox(width: w);
}

bld() {
  return TextStyle(fontWeight: FontWeight.bold);
}

Color hRd = Colors.red;
Color hOr = Colors.orange;
