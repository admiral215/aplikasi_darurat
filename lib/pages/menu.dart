import 'package:aplikasi_darurat/pages/input/kontak_darurat.dart';
import 'package:aplikasi_darurat/pages/login.dart';
import 'package:aplikasi_darurat/pages/otp.dart';
import 'package:aplikasi_darurat/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aplikasi_darurat/components/snackbar.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen({super.key,});

  @override
  State<MenuScreen> createState() => _MenuScreenState();

}


class _MenuScreenState extends State<MenuScreen> {
  final myKey = GlobalKey();

void verifikasi() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    var response = await http.post(
      Uri.parse('http://ec2-13-213-51-39.ap-southeast-1.compute.amazonaws.com/user/verification/send'),
      headers: <String,String>{
        'Content-Type':'application/json',
        'Authorization' : 'Bearer '+token.toString(),
      },
    );
      if (response.statusCode == 200){
        Navigator.push(context, MaterialPageRoute(builder: (context) => otpPages(),));
        print('berhasil');
      } else {
        Navigator.of(context).pop();
      snackBar.showSnackBar(
        context,
        'Account Anda sudah terverifikasi',
        'Verifikasi Gagal',
        ContentType.failure,
        Color.fromARGB(255, 94, 5, 2),
      );
        print(response.body);
      }
      print('Bearer '+ token.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: myKey,
      backgroundColor: Colors.grey[900],
      body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Spacer(),
                      Icon(Icons.person,color: Colors.white,size:100,),
                     
                    ],
                  )),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  "B E R A N D A",
                  style: TextStyle(color: Colors.white),
                ),
                onTap:() => Navigator.of(context).pop() ,
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.white),
                title: Text(
                  "P R O F I L ",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),));
                },
              ),
              ListTile(
                leading: Icon(Icons.verified_user_outlined, color: Colors.white),
                title: Text(
                  "V E R I F I K A S I",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  verifikasi();
                  
                },
              ),
              ListTile(
                leading: Icon(Icons.contacts_outlined, color: Colors.white),
                title: Text(
                  "K O N T A K  D A R U R A T",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => KontakDaruratPages(),));
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: ListTile(
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text(
                "L O G O U T",
                style: TextStyle(color: Colors.white),
              ),
              onTap: ()async{
                
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.clear();
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
          
        
              },
            ),
          )
        ],
      )),
    );
  }
}
