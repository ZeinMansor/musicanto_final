import 'package:flutter/cupertino.dart';
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
      var res = await ApiDataHolder.addNewSong(
          idSelectedArtist,
          songTitleController.text,
          songTypeController.text,
          songPriceController.text);
    }
    update();
    isLoading.value = false;
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
