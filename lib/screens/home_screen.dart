import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:message/helpers/random_image.dart';
import 'package:message/screens/calls_screen.dart';
import 'package:message/screens/contacts_screen.dart';
import 'package:message/screens/messages_screen.dart';
import 'package:message/screens/notifications_screen.dart';
import 'package:message/themes/colors.dart';
import 'package:message/widgets/avatar.dart';
import 'package:message/widgets/glowing_action_button.dart';
import 'package:message/widgets/icon_buttons.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const List<Widget> screens = [
    MessagesScreen(),
    NotificationsScreen(),
    CallsScreen(),
    ContactsScreen(),
  ];

  static const List<String> screenTitle = [
    'Messages',
    'Notifications',
    'Calls',
    'Contacts',
  ];
  final ValueNotifier<int> currentIndex = ValueNotifier(0);
  final ValueNotifier<String> currentScreenTitle = ValueNotifier('Messages');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconBackground(
            icon: Icons.search,
            onTap: () {},
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Avatar.small(
              url: Helpers.randomPictureUrl(),
            ),
          ),
        ],
        elevation: 0,
        title: ValueListenableBuilder<String>(
          valueListenable: currentScreenTitle,
          builder: (context, String title, _) {
            return Text(
              title,
            );
          },
        ),
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: currentIndex,
        builder: (BuildContext context, int value, _) {
          return screens[value];
        },
      ),
      bottomNavigationBar: BottomNavigation(
        onItemSelected: (int value) {
          currentScreenTitle.value = screenTitle[value];
          currentIndex.value = value;
        },
      ),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
      widget.onItemSelected(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomNavigationItem(
            index: 0,
            icon: CupertinoIcons.bubble_left_bubble_right_fill,
            label: "Messages",
            isSelected: selectedIndex == 0,
            onTap: handleItemSelected,
          ),
          BottomNavigationItem(
            index: 1,
            icon: CupertinoIcons.bell_solid,
            label: "Notifications",
            isSelected: selectedIndex == 1,
            onTap: handleItemSelected,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GlowingActionButton(
              color: AppColors.secondary,
              icon: CupertinoIcons.add,
              onPressed: () {},
            ),
          ),
          BottomNavigationItem(
            index: 2,
            icon: CupertinoIcons.phone_fill,
            label: "Calls",
            isSelected: selectedIndex == 2,
            onTap: handleItemSelected,
          ),
          BottomNavigationItem(
            index: 3,
            icon: CupertinoIcons.person_2_fill,
            label: "Contacts",
            isSelected: selectedIndex == 3,
            onTap: handleItemSelected,
          ),
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem({
    Key? key,
    required this.index,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final int index;
  final bool isSelected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 16),
        child: SizedBox(
          width: 75,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 24,
                color: isSelected ? AppColors.secondary : null,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? AppColors.secondary : null,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
