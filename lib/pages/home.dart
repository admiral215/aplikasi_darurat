import 'dart:convert';
import 'package:aplikasi_darurat/components/snackbar.dart';
import 'package:aplikasi_darurat/pages/instansi/list_instansi.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:aplikasi_darurat/pages/menu.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  //getlocation
  void getLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
  }

  //broadcast_emergency
  void emergency() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    var response = await http.post(
        Uri.parse(
            'http://ec2-13-213-51-39.ap-southeast-1.compute.amazonaws.com/send-message'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + token.toString(),
        },
        body: jsonEncode(<String, double>{
          "latitude": position.latitude,
          "longitude": position.longitude
        }));
    if (response.statusCode == 200) {
      snackBar.showSnackBar(context, 'Pesan Darurat telah dikirim', 'Berhasil',
          ContentType.success, Color.fromARGB(255, 4, 104, 7));
      print('berhasil');
    } else {
      print(response.body);
    }
    print('Bearer ' + token.toString());
    print(position.latitude);
    print(position.longitude);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      //BUTTON EMERGENCY
      Center(
        child: ElevatedButton(
          onPressed: () {
            emergency();
          },
          child: Icon(
            Icons.emergency_share,
            size: 50.0,
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.grey[200],
              onPrimary: Colors.grey[900],
              shadowColor: Colors.grey[900],
              minimumSize: Size(100, 100),
              shape: CircleBorder(),
              animationDuration: Duration(milliseconds: 200),
              visualDensity: VisualDensity.comfortable),
        ),
      ),

      //BUTTON EMERGENCY CALL
      Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  FlutterPhoneDirectCaller.callNumber('110');
                },
                child: Column(
                  children: [
                    Text(
                      '110',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      'KEPOLISIAN',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey[200],
                    onPrimary: Colors.grey[900],
                    shadowColor: Colors.grey[900],
                    minimumSize: Size(200, 120),
                    shape: CircleBorder(),
                    animationDuration: Duration(milliseconds: 200),
                    visualDensity: VisualDensity.comfortable),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  FlutterPhoneDirectCaller.callNumber('118');
                },
                child: Column(
                  children: [
                    Text(
                      '118',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      'AMBULANS',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey[200],
                    onPrimary: Colors.grey[900],
                    shadowColor: Colors.grey[900],
                    minimumSize: Size(200, 120),
                    shape: CircleBorder(),
                    animationDuration: Duration(milliseconds: 200),
                    visualDensity: VisualDensity.comfortable),
              ),
            ),
          ],
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              FlutterPhoneDirectCaller.callNumber('112');
            },
            child: Column(
              children: [
                Text(
                  '112',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Text(
                  'DARURAT',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.grey[200],
                onPrimary: Colors.grey[900],
                shadowColor: Colors.grey[900],
                minimumSize: Size(200, 120),
                shape: CircleBorder(),
                animationDuration: Duration(milliseconds: 200),
                visualDensity: VisualDensity.comfortable),
          ),
        ),
        Row(children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                FlutterPhoneDirectCaller.callNumber('115');
              },
              child: Column(
                children: [
                  Text(
                    '115',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'SAR',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.grey[200],
                  onPrimary: Colors.grey[900],
                  shadowColor: Colors.grey[900],
                  minimumSize: Size(200, 120),
                  shape: CircleBorder(),
                  animationDuration: Duration(milliseconds: 200),
                  visualDensity: VisualDensity.comfortable),
            ),
          ),
          Center(
              child: ElevatedButton(
            onPressed: () {
              FlutterPhoneDirectCaller.callNumber('113');
            },
            child: Column(
              children: [
                Text(
                  '113',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Text(
                  'DAMKAR',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.grey[200],
                onPrimary: Colors.grey[900],
                shadowColor: Colors.grey[900],
                minimumSize: Size(200, 120),
                shape: CircleBorder(),
                animationDuration: Duration(milliseconds: 200),
                visualDensity: VisualDensity.comfortable),
          ))
        ])
      ])
    ];

    return Scaffold(
      drawer: Drawer(
        child: MenuScreen(),
      ),
      body: widgets[currentIndex],
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("APLIKASI DARURAT",
            // style: TextStyle(fontFamily:'Play' ,color: Colors.grey[200], fontWeight: FontWeight.w800),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[900],
                fontSize: 22)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.phone_forwarded_outlined, color: Colors.grey[900]),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => listInstansiPage(),
                  ));
            },
          )
        ],
        leading: Builder(
          builder: ((context) {
            return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[900],
                ));
          }),
          // leading: GestureDetector(

          //   onTap:() => ZoomDrawer.of(context)!.toggle() ?? false,

          //   child: Icon(Icons.more_vert,size: 30,color: Colors.grey[300],),

          // ),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.grey[300],
        color: Colors.grey[900],
        activeColor: Colors.grey[900],
        height: 60,
        items: [
          TabItem(icon: Icons.emergency_share, title: 'Darurat'),
          TabItem(icon: Icons.call_outlined, title: 'Telpon Darurat')
        ],
        initialActiveIndex: 0,
        onTap: (i) {
          setState(() {
            currentIndex = i;
          });
        },
        style: (TabStyle.reactCircle),
      ),
    );
  }
}
