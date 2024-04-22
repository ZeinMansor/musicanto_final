import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../components/section_header.dart';
import '../../../controllers/songs_management_controller.dart';

class AddSongForm extends GetView<SongsManagementController> {
  const AddSongForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Add new song",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.music_note,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: controller.songTitleController,
                  style: const TextStyle(color: Colors.black),
                  validator: (value) =>
                      value!.isEmpty ? "Please enter a song title" : null,
                  decoration: const InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.grey)),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: controller.songTypeController,
                  style: const TextStyle(color: Colors.black),
                  validator: (value) =>
                      value!.isEmpty ? "Please enter a song type" : null,
                  decoration: const InputDecoration(
                      labelText: 'Type',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.grey)),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: controller.songPriceController,
                  style: const TextStyle(color: Colors.black),
                  validator: (value) =>
                      value!.isEmpty ? "Please enter a song price" : null,
                  decoration: const InputDecoration(
                      labelText: 'Price',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.grey)),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                GetBuilder<SongsManagementController>(builder: (controller) {
                  return DropdownButtonFormField(
                    // Added dropdown for gender
                    decoration: InputDecoration(
                        labelText: "Artists",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                    items: controller.listArtist
                        .map((artist) => DropdownMenuItem(
                              value: artist.id,
                              child: Text(
                                "${artist.firstName} ${artist.lastName}",
                                style: const TextStyle(color: Colors.black),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      controller.idSelectedArtist = value!.toInt();
                    },
                    validator: (value) =>
                        value == null ? "Please select gender" : null,
                  );
                }),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.addSong();
                  },
                  child: const Text("Add Song"),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const SectionHeader(title: "Songs"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
