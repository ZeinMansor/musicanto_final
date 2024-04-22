import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/custome_text_field.dart';
import '../../../controllers/artists_controller.dart';

class AddArtistForm extends GetView<ArtistsController> {
  const AddArtistForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0), // Add padding for better spacing
      margin: const EdgeInsets.all(8.0),

      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            CustomeTextField(
              controller: controller.firstName,
              fieldLable: "First Name",
              validationErrorMessage: "This field is required",
              icon: const Icon(Icons.ac_unit),
              obsecureText: false,
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomeTextField(
              controller: controller.lastName,
              fieldLable: "Last Name",
              validationErrorMessage: "This field is required",
              icon: const Icon(Icons.ac_unit),
              obsecureText: false,
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomeTextField(
              controller: controller.country,
              fieldLable: "Country Name",
              validationErrorMessage: "This field is required",
              icon: const Icon(Icons.flag_circle),
              obsecureText: false,
            ),
            const SizedBox(
              height: 20.0,
            ),
            DropdownButtonFormField(
              // Added dropdown for gender
              decoration: InputDecoration(
                  labelText: "Gender",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
              items: ["Male", "Female"]
                  .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(
                          gender,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value.toString() == "Male") {
                  controller.gender = "M";
                } else {
                  controller.gender = "F";
                }
              },
              validator: (value) =>
                  value == null ? "Please select gender" : null,
            ),
            const SizedBox(
              height: 20.0,
            ),
            GetX<ArtistsController>(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  controller.addArtist();
                },
                child: controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : const Text("Add Artist"),
              );
            }),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Artists List",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Colors.deepPurple),
                      ),
                      Text(
                        "delete",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.deepPurple.shade500),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
