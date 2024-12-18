import 'package:flutter/material.dart';
import 'package:olov_app/images_data.dart';
import 'package:olov_app/login/bottom.dart';
import 'package:olov_app/login/my_text_field.dart';
import 'package:olov_app/login/page/verfication_code.dart';
import 'package:olov_app/style/color.dart';
import 'package:olov_app/style/text_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController number = TextEditingController();
  bool isChekbox = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Authorization",
          style: kTextAppBar,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                  height: size.height * .20,
                  width: size.width * .4,
                  child: Image.asset(
                    logo,
                    fit: BoxFit.cover,
                  )),
            ),
            Center(
              child: Text(
                "Welcome to OLOV",
                style: kTSHW,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              maxLens: 12,
              textInputType: TextInputType.phone,
              controller: number,
              text: "Phone number",
              textP: "00 000-00-00",
              isNumber: true,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Checkbox.adaptive(
                  value: isChekbox,
                  onChanged: (value) {
                    setState(() {
                      isChekbox = !isChekbox;
                    });
                  },
                  activeColor: kOrange,
                ),
                const Text(
                  "I accept the Terms of Use, Public Offer and Privacy Policy",
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
            MyBotton(
              text: "Authorization",
              height: 60,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VerficationCode()));
              },
            )
          ],
        ),
      ),
    );
  }
}
