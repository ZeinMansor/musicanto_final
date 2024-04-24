import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:musicanto/models/customer.dart';
import 'package:musicanto/util/api.dart';

class RegisterController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  RxBool isLoading = false.obs;

  void loginPage() async {
    Get.offAllNamed("/login");
  }

  void registerUser() async {
    isLoading.value = true;

    // Add API Call here
    String url = "${ApiDataHolder.getUrl()}/auth/signup";

    var body = {
      "username": usernameController.text,
      "password": passwordController.text,
      "FName": firstNameController.text,
      "LName": lastNameController.text,
      "Address": addressController.text,
      "email": emailController.text
    };
    try {
      print("BEFOR get request");
      print(url);
      final res = await http.post(Uri.parse(url), body: body);
      var data = jsonDecode(res.body);
      if (res.statusCode == 200 || res.statusCode == 201) {
        final customerJson = data;

        print(customerJson);
        Customer customer = Customer.fromJson(customerJson);
        isLoading.value = false;

        print("registerd successfully");
        Get.toNamed('/login'); // Navigate to main page
      } else {
        Get.snackbar(
            "Error", "Something went wrong ${data['error']['message']}",
            backgroundColor: Colors.deepPurple,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print("Error registering new user");
      isLoading.value = false;

      print(e);
    }
    isLoading.value = false;
  }
}
