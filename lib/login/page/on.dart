import 'package:flutter/material.dart';
import 'package:olov_app/login/page/my_bottom.dart';
import 'package:olov_app/style/color.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentIndex = 0;
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<UnboardingContent> contens = [
      UnboardingContent(
          description:
              "Looking for the best discounts and deals? You’ve come to the right place! ",
          images: "assets/onboarding/onb1.png",
          title: "Welcome to OLOV"), //assets/onboarding/onb1.png
      UnboardingContent(
          description:
              "Select the product categories you're interested in to receive the most relevant deals.",
          images: "assets/onboarding/onb2.png",
          title: "Personalize Your Experience"),
      UnboardingContent(
          description:
              "Enable notifications to be the first to know about new discounts and sales.",
          images: "assets/onboarding/onb3.png",
          title: "Stay Updated on New Discounts")
    ];
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: contens.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Column(
                    children: [
                      Image.asset(
                        contens[i].images,
                        height: MediaQuery.of(context).size.height * .8,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ],
                  );
                }),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: kWhite, borderRadius: BorderRadius.circular(20)),
              height: MediaQuery.of(context).size.height * .3,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      textAlign: TextAlign.end,
                      contens[currentIndex].title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      contens[currentIndex].description,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        contens.length,
                        (index) => buildDot(index, context),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (currentIndex == contens.length - 1) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyBottom()));
                        }
                        _controller.nextPage(
                            duration: Duration(milliseconds: 250),
                            curve: Curves.ease);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                        height: 60,
                        margin: EdgeInsets.all(30),
                        width: double.infinity,
                        child: Center(
                          child: Text(
                              currentIndex == contens.length - 1
                                  ? "Start"
                                  : "Next",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 18 : 7,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Color(0xffF59E0B)),
    );
  }
}

class UnboardingContent {
  String images;
  String title;
  String description;
  UnboardingContent(
      {required this.description, required this.images, required this.title});
}
