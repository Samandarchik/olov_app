import 'package:flutter/material.dart';
import 'package:olov_app/style/color.dart';

class MyBottom extends StatefulWidget {
  const MyBottom({super.key});

  @override
  State<MyBottom> createState() => _MyBottomState();
}

class _MyBottomState extends State<MyBottom> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("data"),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: kWhite,
          selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.bold, color: kOrange),
          currentIndex: currentindex,
          onTap: (value) {
            setState(() {
              currentindex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icon/Icon1.png",
                  color: currentindex == 0 ? kOrange : kBlack,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icon/Icon2.png",
                  color: currentindex == 1 ? kOrange : kBlack,
                ),
                label: "Merchants"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icon/Icon3.png",
                  color: currentindex == 2 ? kOrange : kBlack,
                ),
                label: "Discover"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icon/Icon4.png",
                  color: currentindex == 3 ? kOrange : kBlack,
                ),
                label: "Favorites"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icon/Icon5.png",
                  color: currentindex == 4 ? kOrange : kBlack,
                ),
                label: "Profile"),
          ]),
    );
  }
}
