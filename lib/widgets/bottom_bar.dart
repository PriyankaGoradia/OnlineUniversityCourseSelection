// import 'dart:async';

// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:svmapp/screens/home_page.dart';
import 'package:svmapp/widgets/bottom_bar_column.dart';
import 'package:svmapp/widgets/info_text.dart';
import 'package:svmapp/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
  }) : super(key: key);

  void _showUrl() {
    _launch('http://www.smartvillagemovement.org');
  }

  void _showEmail() {
    _launch('mailto:hetnaik987@gmail.com');
  }

  void _showTelephone() {
    _launch('tel:9825569974');
  }

  void _showSms() {
    _launch('sms:9825569974');
  }

  void _launch(String urlString) async {
    if (await canLaunch(urlString)) {
      await launch(urlString);
    } else {
      throw 'Could not launch Url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      color: Theme.of(context).bottomAppBarColor,
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Flexible(
                    //     child: FlutterMap(
                    //         options: MapOptions(
                    //             center: LatLng(41.8781, -87.6298), zoom: 10.0),
                    //         layers: [
                    //       new TileLayerOptions(
                    //         urlTemplate:
                    //             "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    //         subdomains: ['a', 'b', 'c'],
                    //       )
                    //     ])),
                    BottomBarColumn(
                      heading: 'Location',
                      s1: '',
                      s2: '',
                      s3: '',
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Connect',
                          style: TextStyle(
                            color: Colors.blueGrey[300],
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        new RaisedButton(
                          color: Theme.of(context).bottomAppBarColor,
                          onPressed: _showUrl,
                          child: new Text(
                            'URL',
                            style: TextStyle(color: Colors.blueGrey[100]),
                          ),
                        ),
                        new RaisedButton(
                          color: Theme.of(context).bottomAppBarColor,
                          onPressed: _showEmail,
                          child: new Text(
                            'Mail',
                            style: TextStyle(color: Colors.blueGrey[100]),
                          ),
                        ),
                        new RaisedButton(
                          color: Theme.of(context).bottomAppBarColor,
                          onPressed: _showTelephone,
                          child: new Text(
                            'Call',
                            style: TextStyle(color: Colors.blueGrey[100]),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sbh(20),
                          Text(
                            'Social',
                            style: TextStyle(
                              color: Colors.blueGrey[300],
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.twitter,
                                size: 25,
                              ),
                              sbw(5),
                              Text(
                                'Twitter',
                                style: TextStyle(
                                  color: Colors.blueGrey[100],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.facebook,
                                size: 25,
                              ),
                              sbw(5),
                              Text(
                                'Facebook',
                                style: TextStyle(
                                  color: Colors.blueGrey[100],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.youtube,
                                size: 25,
                              ),
                              sbw(5),
                              Text(
                                'YouTube',
                                style: TextStyle(
                                  color: Colors.blueGrey[100],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  height: 1,
                ),
                SizedBox(height: 20),
                SizedBox(height: 5),
                InfoText(
                  type: 'Address',
                  text: 'Lietgraw block,Mawphlang, Meghalaya',
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  height: 1,
                ),
                SizedBox(height: 20),
                Text(
                  'Het Naik, Priyanka Goradia | 2020 | SVM X SALESFORCE X SAURAMANDALA',
                  style: TextStyle(
                    color: Colors.blueGrey[300],
                    fontSize: 14,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Connect',
                          style: TextStyle(
                            color: Colors.blueGrey[300],
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        new RaisedButton(
                          color: Theme.of(context).bottomAppBarColor,
                          onPressed: _showUrl,
                          child: new Text(
                            'URL',
                            style: TextStyle(color: Colors.blueGrey[100]),
                          ),
                        ),
                        new RaisedButton(
                          color: Theme.of(context).bottomAppBarColor,
                          onPressed: _showEmail,
                          child: new Text(
                            'Mail',
                            style: TextStyle(color: Colors.blueGrey[100]),
                          ),
                        ),
                        new RaisedButton(
                          color: Theme.of(context).bottomAppBarColor,
                          onPressed: _showTelephone,
                          child: new Text(
                            'Call',
                            style: TextStyle(color: Colors.blueGrey[100]),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sbh(20),
                          Text(
                            'Social',
                            style: TextStyle(
                              color: Colors.blueGrey[300],
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.twitter,
                                size: 25,
                              ),
                              sbw(5),
                              Text(
                                'Twitter',
                                style: TextStyle(
                                  color: Colors.blueGrey[100],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.facebook,
                                size: 25,
                              ),
                              sbw(5),
                              Text(
                                'Facebook',
                                style: TextStyle(
                                  color: Colors.blueGrey[100],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.youtube,
                                size: 25,
                              ),
                              sbw(5),
                              Text(
                                'YouTube',
                                style: TextStyle(
                                  color: Colors.blueGrey[100],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.blueGrey,
                      width: 2,
                      height: 150,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        InfoText(
                  type: 'Address',
                  text: 'Lietgraw block,Mawphlang, Meghalaya',
                ),
                
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.blueGrey,
                    width: double.maxFinite,
                    height: 1,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Het Naik, Priyanka Goradia | 2020 | SVM X SALESFORCE X SAURAMANDALA',
                  style: TextStyle(
                    color: Colors.blueGrey[300],
                    fontSize: 14,
                  ),
                )],
            ),
    );
  }
}

//  Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               new RaisedButton(onPressed: _showUrl, child: new Text('URL'),),
//               new RaisedButton(onPressed: _showEmail, child: new Text('Email'),),
//               new RaisedButton(onPressed: _showSms, child: new Text('Sms'),),
//               new RaisedButton(onPressed: _showTelephone, child: new Text('Telephone'),),

//             ],
//           ),

// class MapSample extends StatefulWidget {
//   @override
//   State<MapSample> createState() => MapSampleState();
// }

// class MapSampleState extends State<MapSample> {
//   var _controller = Completer();

//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

//   static final CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: GoogleMap(
//         mapType: MapType.hybrid,
//         initialCameraPosition: _kGooglePlex,
//         onMapCreated: (controller) {
//           _controller.complete(controller);
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _goToTheLake,
//         label: Text('To the lake!'),
//         icon: Icon(Icons.directions_boat),
//       ),
//     );
//   }

//   Future<void> _goToTheLake() async {
//     final controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
// }
