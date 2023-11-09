import 'dart:convert';

import 'package:aplikasi_darurat/database/model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  final baseUrl =
      'http://ec2-13-213-51-39.ap-southeast-1.compute.amazonaws.com/emergency-numbers';

   Future<List<kontakDarurat>> getData() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var token = preferences.getString('token');
      final response = await http.get(Uri.parse(baseUrl),
     headers:  <String,String>{
        'Authorization' : 'Bearer '+token.toString(),
      },
      
      );
      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        return responseData.map((data) => kontakDarurat(
          id: data['id'], 
          name: data['name'], 
          phone: data['phone'], 
          isActive: data['isActive'], 
          createdDate: data['createdDate'], 
          updateDate: data['updateDate'],)).toList();

        // print(jsonDecode(response.body));
        // Iterable it = jsonDecode(response.body);
        // List<kontakDarurat> listk = it.map((e) => kontakDarurat.fromJson(e)).toList();
        //  return listk;
      } else {
        throw Exception('gagal');
      }
   
  }
}
