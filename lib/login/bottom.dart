import 'package:flutter/material.dart';
import 'package:olov_app/style/color.dart';
import 'package:olov_app/style/text_style.dart';

class MyBotton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onTap;
  final String text;
  const MyBotton(
      {super.key,
      this.height = 60,
      this.width = double.infinity,
      required this.onTap,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
            color: kBlack, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          text,
          style: kTextPhone.copyWith(color: kWhite),
        )),
      ),
    );
  }
}
