import 'package:flutter/material.dart';

import 'package:instagram_flutter/models/user.dart' as model;

import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/utils/global_variables.dart';
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    // getUsername();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();

    pageController.dispose();
  }

  // void getUsername() async {
  //   DocumentSnapshot snap = await FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();

  //   setState(() {
  //     username = (snap.data() as Map<String, dynamic>)["username"];
  //   });
  // }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  int _page = 0;

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(user.username);

    return Scaffold(
      body: PageView(
        children: homeScreenItems,
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _page == 0 ? Colors.black54 : secondaryColor,
            ),
            label: "",
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _page == 1 ? Colors.black54 : secondaryColor,
            ),
            label: "",
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              color: _page == 2 ? Colors.black54 : secondaryColor,
            ),
            label: "",
            backgroundColor: primaryColor,
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.favorite,
          //     color: _page == 3 ? Colors.black54 : secondaryColor,
          //   ),
          //   label: "",
          //   backgroundColor: primaryColor,
          // ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _page == 3 ? Colors.black54 : secondaryColor,
            ),
            label: "",
            backgroundColor: primaryColor,
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
