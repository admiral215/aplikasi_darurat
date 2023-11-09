import 'dart:async';
import 'dart:convert';

import 'package:aplikasi_darurat/components/my_textbox.dart';
import 'package:aplikasi_darurat/database/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

final baseUrl =
    'http://ec2-13-213-51-39.ap-southeast-1.compute.amazonaws.com/user/profile';

class _ProfilePageState extends State<ProfilePage> {
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  StreamController<profile> streamController = StreamController();
  // bool _isDiposed = true;

  Future<void> editField(String field) async {}
  Future<void> getProfile() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Authorization': 'Bearer ' + token.toString(),
      },
    );
    final data = json.decode(response.body);
    profile cprofile = profile.fromJson(data);
    streamController.sink.add(cprofile);

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('gagal');
    }
  }

  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      getProfile();
    });
  }

  bool isDisposed = false;
  @override
  void dispose() {
    streamController.close();
    isDisposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext cprofile) {
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
          title: Text('PROFIL',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[900]),),
        ),
        body: StreamBuilder<profile>(
            stream: streamController.stream,
            builder: (context, snapdata) {
              switch (snapdata.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  if (snapdata.hasData) {
                    final userEmail = snapdata.data!.email;
                    final userName = snapdata.data!.name;
                    final userPhone = snapdata.data!.phone;
                    return ListView(children: [
                      SizedBox(
                        height: 50,
                      ),
                      //Icon
                      Icon(
                        Icons.person,
                        size: 72,
                      ),

                      //user email
                      Text(
                        userEmail,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 50,
                      ),

                      //user details
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Text(
                          'My Details',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                      //username
                      MyTextBox(
                        text: userName,
                        SectionName: 'username',
                        onPressed: () => editField('username'),
                      ),
                      //my phone
                      MyTextBox(
                        text: userPhone,
                        SectionName: 'phone',
                        onPressed: () => editField('phone'),
                      ),
                    ]);
                  } else {
                    throw Exception("gagal");
                  }
              }
            }));
  }
}
