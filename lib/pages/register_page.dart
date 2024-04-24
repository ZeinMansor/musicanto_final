import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicanto/controllers/register_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.put(RegisterController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Music icon with card (unchanged)
                Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.music_note,
                      size: 40.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                // Text fields in a column
                Column(
                  children: [
                    TextField(
                      controller: controller.firstNameController,
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 10.0),
                    TextField(
                      controller: controller.lastNameController,
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 10.0), // Add space between fields
                    TextField(
                      controller: controller.usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 10.0), // Add space between fields
                    TextField(
                      controller: controller.passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 10.0), // Add space between fields
                    TextField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 10.0), // Add space between fields
                    TextField(
                      controller: controller.addressController,
                      decoration: const InputDecoration(
                        labelText: 'Address',
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                // Add footer row (unchanged)

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: controller.loginPage,
                      child: const Text('Login instead?'),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Align elements
                  children: [
                    // Register button (unchanged)
                    Obx(
                      () => ElevatedButton(
                        onPressed: controller.isLoading.value
                            ? null
                            : controller.registerUser,
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator()
                            : const Text('Create Account'),
                      ),
                    ),
                    // Forgot password text
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
