import 'dart:convert';
import 'package:get_storage/get_storage.dart';

import 'package:get/get.dart';

import '../Models/loginmodel.dart';
import 'package:http/http.dart' as http;

class Logincontroller extends GetxController {
  RxList result = <Loginmodel>[].obs;
  final box = GetStorage();
  RxBool isLoading = false.obs;

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
        Get.snackbar('Login Failed', 'Invalid username or password');
      }
    } catch (e) {
      // print("///////////////////");

      Get.snackbar(
          '${e.toString()}Login Failed', 'Invalid username or password');
      print(e.toString());
    }
  }
}
