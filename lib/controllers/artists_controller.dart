import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/artist.dart';
import '../pages/artists_page/widget/custom_snakbar.dart';
import '../util/api.dart';

class ArtistsController extends GetxController {
  RxBool isLoading = false.obs;

  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController country;
  late GlobalKey<FormState> formKey; // For form validation
  String gender = "";

  @override
  void onInit() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    country = TextEditingController();

    formKey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void onClose() {
    firstName.dispose();
    lastName.dispose();
    country.dispose();
    super.onClose();
  }

  Future<List<Artist>> getArtists() async {
    var artists = await ApiDataHolder.loadArtists();
    if (artists == null) {
      return [];
    } else {
      return artists;
    }
  }

  addArtist() async {
    isLoading.value = true;
    if (formKey.currentState!.validate()) {
      var res = await ApiDataHolder.addNewArtist(
          firstName.text, lastName.text, gender, country.text);

      if (res != null) {
        successSnakbar();
        firstName.dispose();
        lastName.dispose();
        country.dispose();
        update();
      } else {
        errorSnakbar();
      }
    }
    isLoading.value = false;
  }

  deleteArtist() {}
}
