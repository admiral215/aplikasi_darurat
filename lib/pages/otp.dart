import 'dart:convert';
import 'package:aplikasi_darurat/components/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
class otpPages extends StatefulWidget {
  otpPages({super.key});




  static void verifikasi() async{
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
        print('berhasil');
      } else {
        print(response.body);
      }
      print('Bearer '+ token.toString());
  }

  @override
  State<otpPages> createState() => _otpPagesState();
}

class _otpPagesState extends State<otpPages> {
  final pinController = TextEditingController();
  void pinverifikasi() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    var response = await http.post(
      Uri.parse('http://ec2-13-213-51-39.ap-southeast-1.compute.amazonaws.com/user/verification'),
      headers: <String,String>{
        'Content-Type':'application/json',
        'Authorization' : 'Bearer '+token.toString(),
      },
      body: jsonEncode(<String, String>{
        "verificationCode" :pinController.text,
      }
    ));
      if (response.statusCode == 200){
         snackBar.showSnackBar(
                          context,
                          'Silahkan input Kontak Darurat',
                          'Verifikasi Berhasil',
                          ContentType.success,
                          Color.fromARGB(255, 4, 104, 7)
                        );
                        await Future.delayed(
                            const Duration(milliseconds: 3000));
                        Navigator.of(context).pop();
        print('berhasil');
      } else {
        print(response.body);
      }
      print('Bearer '+ token.toString());
  }
  
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20, color: Colors.grey[900], fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.grey[350],
      border: Border.all(color: Colors.grey.shade900),
      // borderRadius: BorderRadius.vertical(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        toolbarHeight: 65,
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        elevation: 0,
        title: Text("Verifikasi",
            // style: TextStyle(fontFamily:'Play' ,color: Colors.grey[200], fontWeight: FontWeight.w800),
            style: TextStyle( color: Colors.grey[200])),),
      backgroundColor: Colors.grey[300],
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Verifikasi",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 40,
        ),
        Text("Masukkan kode verfikasi yang telah dikirim ke nomor WhatsApp Anda!",
        textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            )),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
        ),
        Center(
          child: Pinput(
            onCompleted: (pin) {
            pinverifikasi();
            },
            controller: pinController,
            defaultPinTheme: defaultPinTheme,
            length: 6,
          ),
        ),
        SizedBox(
          height: 100,),
        Text("Tidak menerima kode verifikasi?",
            style: TextStyle(fontSize: 16,)),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            otpPages.verifikasi();
          },
          child: Text("Kirim Ulang",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,decoration: TextDecoration.underline)),
        ),
      ]),
    );
  }
}
