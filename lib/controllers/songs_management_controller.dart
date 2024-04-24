import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicanto/models/artist.dart';
import 'package:musicanto/util/api.dart';

import '../models/song.dart';

class SongsManagementController extends GetxController {
  late TextEditingController songTitleController;
  late TextEditingController songTypeController;
  late TextEditingController songPriceController;

  List<Artist> listArtist = [];

  RxBool isLoading = false.obs;
  late int idSelectedArtist;
  late GlobalKey<FormState> formKey;

  @override
  void onInit() {
    songTitleController = TextEditingController();
    songTypeController = TextEditingController();
    songPriceController = TextEditingController();
    formKey = GlobalKey<FormState>();

    getArtists();
    super.onInit();
  } // For form validation

  getArtists() async {
    var artists = await ApiDataHolder.loadArtists();
    if (artists != null) {
      listArtist = artists;
      update();
    }
  }

  addSong() async {
    isLoading.value = true;
    if (formKey.currentState!.validate()) {
      print("Id for selected artist $idSelectedArtist");

      if (idSelectedArtist == null ||
          songTitleController.text == null ||
          songTypeController.text == null ||
          songPriceController.text == null) {
        Get.snackbar("Song", "Error, some input values are null",
            backgroundColor: Colors.deepPurple,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
        return;
      }
      var res = await ApiDataHolder.addNewSong(
          idSelectedArtist,
          songTitleController.text,
          songTypeController.text,
          songPriceController.text);
    }
    update();
    isLoading.value = false;
  }

  deleteSong(int id) async {
    await ApiDataHolder.deleteSong(id);
    update();
    Get.snackbar("Songs", "Deleted Successfully",
        backgroundColor: Colors.deepPurple,
        colorText: Colors.white,
        margin: const EdgeInsets.only(bottom: 30.0),
        snackPosition: SnackPosition.BOTTOM);
  }

  Future<List<Song>> getSong() async {
    List<Song>? songsList = await ApiDataHolder.loadSongs();
    if (songsList == null) {
      return [];
    } else {
      return songsList;
    }
  }
}
