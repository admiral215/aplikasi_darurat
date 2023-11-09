import 'dart:convert';
import 'package:aplikasi_darurat/components/snackbar.dart';
import 'package:aplikasi_darurat/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_darurat/components/my_textfield.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:http/http.dart' as http;

class RegsiterPage extends StatefulWidget {
  RegsiterPage({
    super.key,
  });

  @override
  State<RegsiterPage> createState() => _RegsiterPageState();
}

class _RegsiterPageState extends State<RegsiterPage> {
  // text editing controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign user up method
  // void signUserUp(
  //   String email,
  //   String password,
  //   String name,
  //   String phone,
  //   String confirmPassword,
  // ) async {
  //   try {
  //     Response response = await post(
  //         Uri.parse(
  //             'http://ec2-54-179-166-185.ap-southeast-1.compute.amazonaws.com/registration'),
  //         body:  {
  //           "name": nameController.text,
  //           "email": emailController.text,
  //           "phone": phoneController.text,
  //           "password": passwordController.text,
  //           "confirmPassword": confirmPasswordController.text
  //         });
  //     if (response.statusCode == 200) {
  //       print('succes');
  //     } else {
  //       print('failed');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25),

                // logo
                const Icon(
                  Icons.lock,
                  size: 50,
                ),

                const SizedBox(height: 25),

                // siliahkan daftar
                Text(
                  'Silahkan Daftar!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),
                //email
                MyTextField(
                    controller: nameController,
                    hintText: 'Nama',
                    obscureText: false,
                    keyboardType: TextInputType.name),

                const SizedBox(height: 10),

                MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress),

                const SizedBox(height: 10),

                // [phone]
                MyTextField(
                    controller: phoneController,
                    hintText: 'No Ponsel',
                    obscureText: false,
                    keyboardType: TextInputType.phone),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    keyboardType: null),

                const SizedBox(height: 10),

                // confirm password textfield
                MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                    keyboardType: null),

                const SizedBox(height: 25),

                // sign up button
                GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          "Daftar",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    onTap: () async {
                      var response = await http.post(
                          Uri.parse(
                              "http://ec2-13-213-51-39.ap-southeast-1.compute.amazonaws.com/registration"),
                          headers: <String, String>{
                            'Content-Type': 'application/json'
                          },
                          body: jsonEncode(<String, String>{
                            "name": nameController.text,
                            "email": emailController.text,
                            "phone": phoneController.text,
                            "password": passwordController.text,
                            "confirmPassword": confirmPasswordController.text
                          }));
                      if (response.statusCode == 200) {
                        snackBar.showSnackBar(
                            context,
                            'Silahkan Login',
                            'Daftar Berhasil',
                            ContentType.success,
                            Color.fromARGB(255, 4, 104, 7));
                        await Future.delayed(
                            const Duration(milliseconds: 1000));
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      } else {
                        print(response.body);
                      }
                      ;
                      ;
                    }),

                const SizedBox(height: 50),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // google + apple sign in buttons

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah punya akun?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      },
                      child: const Text(
                        'Masuk',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
