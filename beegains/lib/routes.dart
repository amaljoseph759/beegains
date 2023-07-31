import 'package:get/get.dart';

import 'Screens/loginpage.dart';
import 'Screens/enquiry.dart';

class Routes {
  static final routes = [
    GetPage(name: '/', page: () => LoginScreen()),
    GetPage(name: '/enq', page: () => EnquiryListScreen()),
  ];
}
