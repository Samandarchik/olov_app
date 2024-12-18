import 'package:flutter/material.dart';
import 'package:olov_app/login/bottom.dart';
import 'package:olov_app/login/my_text_field.dart';
import 'package:olov_app/login/page/on.dart';
import 'package:olov_app/style/color.dart';
import 'package:olov_app/style/text_style.dart';

class Registration extends StatelessWidget {
  Registration({super.key});
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registration",
          style: kTextAppBar,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Complete the registration",
                style: kTSHW,
              ),
              SizedBox(height: 10),
              Text(
                "Fill the form below",
                style: kTSN,
              ),
              SizedBox(height: 15),
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * .4,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: kGrey),
                    child: Image.asset(
                      "assets/icon/image.png",
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: kOrange),
                        child: Image.asset("assets/icon/image_add.png"),
                      ))
                ],
              ),
              MyTextField(
                  text: "Full name",
                  controller: name,
                  textP: "Enter your name"),
              MyTextField(
                  textInputType: TextInputType.emailAddress,
                  text: "Enter your email",
                  controller: email,
                  textP: "E-mail"),
              SizedBox(
                height: 20,
              ),
              MyBotton(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Onboard()));
                  },
                  text: "Get started")
            ],
          ),
        ),
      ),
    );
  }
}
