import 'package:flutter/material.dart';
import 'package:flutter_poc/core/util/alert_dialog_helper.dart';
import 'package:flutter_poc/core/util/router_generator.dart';
import 'package:flutter_poc/features/message/list/message_list_page.dart';
import 'package:flutter_poc/features/profile/profile_page.dart';
import 'package:flutter_poc/features/settings/settings_page.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          body: getContent(),
          bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 14,
            unselectedFontSize: 14,
            currentIndex: tabIndex,
            onTap: (int index) {
              if (index == 2) {
                AlertDialogHelper.showAlert(
                    context, "Action Menus to be displayed");
              } else if (index == 4) {
                context.pushNamed(RouteNames.remote);
                setState(() {
                  tabIndex = 0;
                });
              } else {
                setState(() {
                  tabIndex = index;
                });
              }
            },
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_rounded), label: "Profile"),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.message_outlined), label: "Messages"),
              BottomNavigationBarItem(
                  label: "",
                  icon: Image.asset(
                    "assets/icons/center_action.png",
                  )),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings"),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.settings_remote_outlined), label: "Remote")
            ],
            selectedItemColor: Colors.blue,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.blue,
          )),
    );
  }

  getContent() {
    switch (tabIndex) {
      case 1:
        return const MessageListPage();
      case 3:
        return const SettingsPage();
      default:
        return const ProfilePage();
    }
  }
}
