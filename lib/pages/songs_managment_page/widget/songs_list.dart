import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../controllers/songs_management_controller.dart';

class SongsList extends StatelessWidget {
  const SongsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SongsManagementController>(builder: (controller) {
      return FutureBuilder(
          future: controller.getSong(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 75,
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple.shade800.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: ListTile(
                        title: Text(snapshot.data![index].name),
                        subtitle: Text(snapshot.data![index].artist.firstName),
                        leading:
                            const CircleAvatar(child: Icon(Icons.music_note)),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            )),
                      ),
                    );
                  },
                ), // Add padding for better spacing
              );
            } else {
              return const CircularProgressIndicator();
            }
          });
    });
  }
}
