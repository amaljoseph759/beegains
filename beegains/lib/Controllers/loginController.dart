import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:get/get.dart';

import '../Models/loginmodel.dart';
import 'package:http/http.dart' as http;

class Logincontroller extends GetxController {
  RxList result = <Loginmodel>[].obs;
  final box = GetStorage();
  RxBool isLoading = false.obs;
  RxBool apierror = false.obs;

  void login(username, password) async {
    isLoading.value = true;

    try {
      print("///////////////////");
      final response = await http.post(
        Uri.parse('http://143.110.181.12:7070/api/login'),
        body: {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        print(response.body);

        final responseData = json.decode(response.body);
        final String token = responseData['data']['token'];

        print(token);
        box.write('token', token);

        // result.value = [
        //   responseData.map((x) => Loginmodel.fromJson(x)).toList()
        // ];
        // print(result);
        isLoading.value = false;
        Get.toNamed('/enq');
        print("///////////////////");
      } else {
        apierror.value = true;

        // Get.snackbar('Login Failed', 'Invalid username or password',
        //     duration: Duration(seconds: 4), backgroundColor: Colors.red);
      }
    } catch (e) {
      // print("///////////////////");
      apierror.value = true;
      Get.snackbar('${e.toString()}Error', 'server not responding',
          duration: Duration(seconds: 4), backgroundColor: Colors.red);
      print(e.toString());
    } finally {
      isLoading.value = false;
      apierror.value = true;
    }
  }
}
