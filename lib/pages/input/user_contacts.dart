import 'dart:convert';
import 'dart:typed_data';
import 'package:aplikasi_darurat/pages/input/kontak_darurat.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aplikasi_darurat/components/snackbar.dart';

class userKontak extends StatefulWidget {
  const userKontak({super.key});

  @override
  State<userKontak> createState() => _userKontakState();
}

class _userKontakState extends State<userKontak> {
  final baseUrl1 =
      'http://ec2-13-213-51-39.ap-southeast-1.compute.amazonaws.com/emergency-numbers';

  Future postKontak(String name, String phone) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    final response = await http.post(Uri.parse(baseUrl1),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + token.toString(),
        },
        body: jsonEncode(<String, String>{"name": name, "phone": phone}));
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Kontak Darurat telah ditambahkan")));
      print(response.body);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => KontakDaruratPages(),
          ));
    } else {
      snackBar.showSnackBar(
          context,
          'Kontak sudah terdaftar sebagai penerima pesan darurat',
          'Gagal',
          ContentType.warning,
          Color.fromARGB(255, 96, 102, 96));

      print(response.body);
    }
    print('Bearer ' + token.toString());
  }

  List<Contact>? contacts;
  void fetchKontak() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      setState(() {});
    }
  }

  @override
  void initState() {
    fetchKontak();
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
        title: Text(
          'KONTAK',
          style: TextStyle(fontWeight:FontWeight.bold, color: Colors.grey[900]),
        ),
      ),
      body: (contacts == null)
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              shrinkWrap: true,
              
              physics: ClampingScrollPhysics(),
              itemCount: contacts!.length,
              itemBuilder: (context, index) {
                Uint8List? images = contacts![index].photo;
                final fullname = contacts![index].name.first +
                    " " +
                    contacts![index].name.last;
                return ListTile(
                  iconColor: Colors.grey[900],
                  hoverColor: Colors.grey[900],
                  textColor: Colors.grey[900],
                  trailing: IconButton(
                      onPressed: () async {
                        await postKontak(
                            fullname, contacts![index].phones.first.number);
                      },
                      icon: Icon(Icons.person_add)),
                  leading: (images == null)
                      ? CircleAvatar(
                          backgroundColor: Colors.grey[900],
                          foregroundColor: Colors.grey[300],
                          child: Icon(Icons.person),
                        )
                      : CircleAvatar(backgroundImage: MemoryImage(images)),
                  title: Text(contacts![index].displayName),
                  subtitle: Text(contacts![index].phones.first.normalizedNumber),
                );
              },
            ),
    );
  }
}
