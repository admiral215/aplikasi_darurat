import 'package:aplikasi_darurat/pages/instansi/damkar.dart';
import 'package:aplikasi_darurat/pages/instansi/polisi.dart';
import 'package:aplikasi_darurat/pages/instansi/rumah_sakit.dart';
import 'package:flutter/material.dart';

class listInstansiPage extends StatelessWidget {
  const listInstansiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          toolbarHeight: 65,
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'INSTANSI',
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[900]),
          ),
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PolicePage(),
                    ));
              },
              child: Column(
                children: [
                  Icon(
                    Icons.local_police,
                    size: 60.0,
                  ),
                  Text(
                    'POLISI',
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HospitalPage(),
                    ));
              },
              child: Column(
                children: [
                  Icon(
                    Icons.local_hospital,
                    size: 60.0,
                  ),
                  Text(
                    'RUMAH SAKIT',
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DamkarPage(),
                    ));
              },
              child: Column(
                children: [
                  Icon(
                    Icons.fire_truck,
                    size: 60.0,
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
            ),
          ),
        ],
      ),
    );
    

    
  }
}
