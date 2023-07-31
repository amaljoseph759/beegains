// enquiry_list_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/enquiryController.dart';

class EnquiryListScreen extends StatelessWidget {
  EnquiryController enquiryController = Get.put(EnquiryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Enquiry List'),
          backgroundColor: Colors.amber[100],
          leading: null,
          centerTitle: true,
        ),
        body: Obx(() => enquiryController.isLoading.isTrue
            ? Center(child: const CircularProgressIndicator())
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(enquiryController.result[index].id
                                        .toString()),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(enquiryController.result[index].id
                                        .toString()),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(enquiryController.result[index].id
                                            .toString()),
                                        // SizedBox(width:10 ,)
                                        Text(enquiryController.result[index].id
                                            .toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                          separatorBuilder: (BuildContext context, index) =>
                              const SizedBox(height: 10),
                          itemCount: enquiryController.result.length),
                    )
                  ],
                ),
              )));
  }
}
