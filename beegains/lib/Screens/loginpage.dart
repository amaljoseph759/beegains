// login_screen.dart
import 'package:beegains/Controllers/loginController.dart';
import 'package:beegains/Screens/enquiry.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Logincontroller logincontroller = Get.put(Logincontroller());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[100],
          title: const Text('Login Screen'),
          centerTitle: true,
        ),
        body: Obx(
          () => logincontroller.isLoading.isTrue
              ? Center(child: CircularProgressIndicator())
              : Center(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 40),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 16),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.amber[100],
                                  borderRadius: BorderRadius.circular(12)),
                              child: TextFormField(
                                  controller: usernameController,
                                  cursorColor: Colors.grey,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1),
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (String name) {},
                                  onTap: () {},
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter username';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.perm_identity,
                                      color: Colors.blueGrey[600], //color???
                                    ), //icon change
                                    border: InputBorder.none,
                                    fillColor: Colors.black,
                                    hintText: "username",
                                    hintStyle: const TextStyle(
                                        letterSpacing: 0.6,
                                        fontWeight: FontWeight.w400),
                                    counterText: '',
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        12, 15, 12, 15),
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.amber[100],
                                  borderRadius: BorderRadius.circular(12)),
                              child: TextFormField(
                                  controller: passwordController,
                                  cursorColor: Colors.grey,
                                  obscureText: true,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1),
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (String name) {},
                                  onTap: () {},
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter password';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock_outline,
                                      color: Colors.blueGrey[600], //color???
                                    ), //icon change
                                    border: InputBorder.none,
                                    fillColor: Colors.black,
                                    hintText: "Enter password",
                                    hintStyle: const TextStyle(
                                        letterSpacing: 0.6,
                                        fontWeight: FontWeight.w400),
                                    counterText: '',
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        12, 15, 12, 15),
                                  )),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  logincontroller.login(
                                      usernameController.text.trim(),
                                      passwordController.text.trim());
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber,
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  padding: const EdgeInsets.fromLTRB(
                                      18, 18, 18, 15)),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Login',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                          color: Colors.white)),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            logincontroller.apierror.isTrue
                                ? Text(
                                    "Invalid credentials",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 16),
                                  )
                                : Text('')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ));
  }
}
