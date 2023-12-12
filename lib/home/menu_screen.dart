import 'package:it4788/personal_page/personal_page.dart';
import 'package:it4788/widgets/menu_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../service/authStorage.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  Future<String?> _getUserId() async {
    return await Storage().getUserId();
  }

  void handleNavToPersonalPage() async {
    var userId = await _getUserId();
    if (userId != null) {
      conheo(userId);
    }
  }

  void conheo(String userId) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PersonalPage(id: userId)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          if (index == 0)
            return MenuItem(
              icon: Icons.person,
              text: "Profile",
              function: () {
                handleNavToPersonalPage();
              },
            );
          if (index == 1)
            return MenuItem(
              icon: Icons.payment,
              text: "Deposit",
              function: () {},
            );
          if (index == 2)
            return MenuItem(
              icon: Icons.settings,
              text: "Settings",
              function: () {},
            );
          if (index == 3)
            return MenuItem(
              icon: Icons.history,
              text: "History",
              function: () {},
            );
          if (index == 4) {
            return MenuItem(
              icon: Icons.logout,
              text: "Logout",
              function: () {
                print("Logout");
                Navigator.pushNamed(context, "/login");
              },
            );
          }
          return Container();
        }, childCount: 10))
      ],
    );
  }
}
