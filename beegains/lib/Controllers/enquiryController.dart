import 'dart:convert';

import 'package:beegains/Models/enquirymodel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

class EnquiryController extends GetxController {
  RxList result = <EnquiryDataListModel>[].obs;
  RxBool isLoading = true.obs;

  final box = GetStorage();

  void enquirylist() async {
    final token = box.read('token');
    print(token);
    try {
      print("??????????????");
      Map<String, String> headers = {
        'Authorization': 'Bearer 1232|dS1axISdWhS0ZkIX6td8gd8pC4LUE8zvEjGgfa0i',
      };
      final response = await http.get(
        Uri.parse(
            'http://143.110.181.12:7070/api/get_enquiries?page=1&franchise_id=2&search=""&from_date=""&to_date=""&est_status=""&jobcards=0'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final enquirymodel = Enquirymodel.fromJson(responseData);
        result.value = enquirymodel.data.enquiries.data;
        isLoading.value = false;

        print(result);
      } else {
        Get.snackbar('Server Error', 'Failed to fetch enquiries');
      }
    } catch (e) {
      // print("///////////////////");

      Get.snackbar('${e.toString()}server error', 'error');
      print(e.toString());
    }
  }

  @override
  void onInit() {
    enquirylist();
    // TODO: implement onInit
    super.onInit();
  }
}
