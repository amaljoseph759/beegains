// enquiry_list_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Controllers/enquiryController.dart';

class EnquiryListScreen extends StatelessWidget {
  EnquiryController enquiryController = Get.put(EnquiryController());
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Enquiry List'),
          backgroundColor: Colors.amber[100],
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  box.remove('token');
                  Get.offAllNamed('/');
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: WillPopScope(
          onWillPop: () async {
            SystemNavigator.pop();

            return false;
          },
          child: Obx(() => enquiryController.isLoading.isTrue
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, index) => Card(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  color: Colors.amber[200],
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                'Name : ${enquiryController.result[index].name}'),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'Mob no: ${enquiryController.result[index].primaryMobile}'),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'Veh reg no:${enquiryController.result[index].vehicleRegNo}'),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                'Id : ${enquiryController.result[index].assignedTo.id}'),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'Emp Name: ${enquiryController.result[index].assignedTo.employeeName}'),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'EnquiryNo :${enquiryController.result[index].enquiryNo}'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            separatorBuilder: (BuildContext context, index) =>
                                const SizedBox(height: 10),
                            itemCount: enquiryController.result.length),
                      )
                    ],
                  ),
                )),
        ));
  }
}
