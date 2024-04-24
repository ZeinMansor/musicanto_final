import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicanto/main.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      // title: const Text("Music App"),
      leading: IconButton(
        icon: const Icon(
          Icons.logout,
          color: Colors.white,
        ),
        onPressed: () {
          prefs!.clear();
          Get.offAllNamed("/login");
        },
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: const CircleAvatar(
            backgroundImage:
                NetworkImage("https://avatar.iran.liara.run/public/boy"),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
