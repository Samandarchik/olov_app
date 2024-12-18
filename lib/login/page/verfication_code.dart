import 'package:flutter/material.dart';
import 'package:olov_app/login/bottom.dart';
import 'package:olov_app/login/my_text_field.dart';
import 'package:olov_app/login/page/registration.dart';
import 'package:olov_app/style/text_style.dart';

class VerficationCode extends StatelessWidget {
  VerficationCode({super.key});
  final TextEditingController codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Authorization",
          style: kTextAppBar,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Center(
              child: Text(
                "Confirm your phone number",
                style: kTextAppBar,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              textAlign: TextAlign.center,
              "We have sent you an SMS with a confirmation code. Enter it below to continue.",
              style: kTSN,
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(
              textInputType: TextInputType.number,
              text: "Enter 6-digit code",
              controller: codeController,
              textP: "000000",
              maxLens: 6,
            ),
            SizedBox(height: 20),
            MyBotton(
                text: "Confirm",
                height: 60,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Registration()));
                })
          ],
        ),
      ),
    );
  }
}
