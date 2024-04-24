import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.deepPurple.shade800,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () => Get.offNamed("/login"),
                icon: const Icon(Icons.favorite_outline)),
            label: "Orders"),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () => () => Get.offNamed("/home"),
                icon: const Icon(Icons.home)),
            label: "Home"),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () => Get.toNamed("/songs_management"),
              icon: const Icon(Icons.play_circle_outlined),
            ),
            label: "Songs"),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () => Get.toNamed("/artists_management"),
              icon: const Icon(Icons.person_2_outlined),
            ),
            label: "Artists")
      ],
    );
  }
}
