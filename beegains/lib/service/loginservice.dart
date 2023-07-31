// import 'dart:convert';

// import 'package:beegains/enquiry.dart';
// import 'package:get/get.dart';

// import '../Models/model.dart';
// import 'package:http/http.dart' as http;

// class Loginservice {
//   Future<Loginmodel?> loginservice(username, password) async {
//     try {
//       print("///////////////////");
//       final response = await http.post(
//         Uri.parse('http://143.110.181.12:7070/api/login'),
//         body: {'username': username, 'password': password},
//       );

//       if (response.statusCode == 200) {
//         print(response.body);

//         final responseData = json.decode(response.body);
//         //final String token = responseData['data']['token'];
//         //print(token);
//         return 
//         //Loginmodel.fromJson(responseData);
//          List<Loginmodel>.from(responseData.map((x) => Loginmodel.fromJson(x)))
//                 .toList();
//       } else {
//         return null;
//       }
//     } catch (e) {
//       // print("///////////////////");

//       // Get.snackbar(
//       //     '${e.toString()}Login Failed', 'Invalid username or password');
//     }
//   }
// }
