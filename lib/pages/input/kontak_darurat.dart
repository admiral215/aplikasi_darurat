import 'dart:convert';

import 'package:aplikasi_darurat/database/model.dart';
import 'package:aplikasi_darurat/pages/input/user_contacts.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class KontakDaruratPages extends StatefulWidget {
  const KontakDaruratPages({super.key});

  @override
  State<KontakDaruratPages> createState() => _KontakDaruratPagesState();
}

class _KontakDaruratPagesState extends State<KontakDaruratPages> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final baseUrl1 =
      'http://ec2-13-213-51-39.ap-southeast-1.compute.amazonaws.com/emergency-numbers';

  Future deleteKontak(String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    final response = await http.delete(
      Uri.parse(
          'http://ec2-13-213-51-39.ap-southeast-1.compute.amazonaws.com/emergency-numbers/$id'),
      headers: <String, String>{
        'Authorization': 'Bearer ' + token.toString(),
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.body);
    }
  }

  void postKontak() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    final response = await http.post(Uri.parse(baseUrl1),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + token.toString(),
        },
        body: jsonEncode(<String, String>{
          "name": nameController.text,
          "phone": phoneController.text
        }));
    if (response.statusCode == 200) {
      setState(() {});
      print(response.body);
    } else {
      print(response.body);
    }
    print('Bearer ' + token.toString());
  }

  Future<void> tambahKontak() async {
    setState(() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.grey[900],
          title: Text("Tambah Kontak Darurat"),
          titleTextStyle: TextStyle(color: Colors.white),
          contentTextStyle: TextStyle(color: Colors.white),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                autofocus: true,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Nama",
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  fillColor: Colors.white,
                ),
              ),
              TextField(
                controller: phoneController,
                autofocus: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Nomor Whatsapp",
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Batal", style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                postKontak();
                Navigator.pop(context);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => KontakDaruratPages(),));
              },
              child: Text("Tambah", style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      );
    });
  }

  Future<List<kontakDarurat>> getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    final response = await http.get(
      Uri.parse(baseUrl1),
      headers: <String, String>{
        'Authorization': 'Bearer ' + token.toString(),
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      print(jsonDecode(response.body));
      return responseData
          .map((data) => kontakDarurat(
                id: data['id'],
                name: data['name'],
                phone: data['phone'],
                isActive: data['isActive'],
                createdDate: data['createdDate'].toString(),
                updateDate: data['updateDate'].toString(),
              ))
          .toList();
    } else {
      throw Exception('gagal');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
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
        title: Text(
          'KONTAK DARURAT',
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[900]),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => userKontak(),
                  ));
            },
            icon: Icon(Icons.contacts),
            color: Colors.grey[900],
          ),
          IconButton(
            onPressed: () {
              tambahKontak();
            },
            icon: Icon(Icons.add),
            color: Colors.grey[900],
          )
        ],
      ),
      body: FutureBuilder<List<kontakDarurat>>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<kontakDarurat> isiData = snapshot.data!;
            return ListView.builder(
              itemCount: isiData.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: ListTile(
                    iconColor: Colors.grey[900],
                    hoverColor: Colors.grey[900],
                    textColor: Colors.grey[900],
                    leading: Icon(Icons.person_2_outlined, size: 40),
                    title: Text(
                      isiData[index].name,
                    ),
                    subtitle: Text(isiData[index].phone),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () async {
                              await deleteKontak(isiData[index].id.toString());
                              setState(() {});
                              ;
                            },
                            icon: Icon(Icons.delete)),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.hasError}");
          }
          return Center(child: const CircularProgressIndicator());
        },
        future: getData(),
      ),
    );
  }
}
