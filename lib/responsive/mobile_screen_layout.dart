import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram_flutter/models/user.dart' as model;
import 'package:instagram_flutter/providers/user_provider.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  @override
  void initState() {
    super.initState();
    // getUsername();
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

  int _page = 0;

  @override
  Widget build(BuildContext context) {
    // print(user.username);
    return Scaffold(
      body: Center(child: Text("This is mobile ")),
      bottomNavigationBar:
          BottomNavigationBar(backgroundColor: mobileBackgroundColor, items: [
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
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: _page == 3 ? Colors.black54 : secondaryColor,
          ),
          label: "",
          backgroundColor: primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: _page == 4 ? Colors.black54 : secondaryColor,
          ),
          label: "",
          backgroundColor: primaryColor,
        ),
      ]),
    );
  }
}
