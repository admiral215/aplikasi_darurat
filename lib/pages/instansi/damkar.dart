import 'dart:convert';
import 'package:aplikasi_darurat/database/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DamkarPage extends StatefulWidget {
  const DamkarPage({super.key});

  @override
  State<DamkarPage> createState() => _DamkarPageState();
}

class _DamkarPageState extends State<DamkarPage> {
  final baseUrl =
      'http://ec2-13-213-51-39.ap-southeast-1.compute.amazonaws.com/';
  late LocationPermission permission;

  Future<List<dataInstansi>> getDamkar() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var long = position.longitude;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    var response = await http.get(
        Uri.parse(baseUrl + 'institution?lat=$lat&long=$long&type=PK&size=2'),
        headers: <String, String>{
          'Authorization': 'Bearer ' + token.toString(),
        });
    if (response.statusCode == 200) {
      print(position);
      final List<dynamic> responseData = jsonDecode(response.body);
      print(jsonDecode(response.body));
      return responseData
          .map((data) => dataInstansi(
                id: data['id'],
                name: data['name'],
                address: data['address'],
                phone: data['phone'],
                distance: data['distance'],
              ))
          .toList();
    } else {
      throw Exception(response.body);
    }
  }

  @override
  void initState() {
    getDamkar();
    super.initState();
  }

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
        title: Text('PEMADAM KEBAKARAN',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[900]),),
      ),
      body: FutureBuilder<List<dataInstansi>>(
          future: getDamkar(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<dataInstansi> isiData = snapshot.data!;
              return ListView.builder(

                  itemCount: isiData.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 0,
                      color: Colors.transparent,
                      child: ListTile(
                        iconColor: Colors.grey[900],
                        hoverColor: Colors.grey[900],
                        textColor: Colors.grey[900],
                        leading: Icon(
                          Icons.fire_truck_sharp,
                          size: 40,
                        ),
                        title: Text(isiData[index].name),
                        subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(isiData[index].phone),
                            Text(isiData[index].address),
                            Text(isiData[index].distance+' KM')
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.call),
                          onPressed: () async{
                            await FlutterPhoneDirectCaller.callNumber(isiData[index].phone);
                          },
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.hasError}");
            }
            return Center(child: const CircularProgressIndicator());
          }),
    );
  }
}
