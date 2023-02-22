import 'package:flutter/material.dart';
import 'package:gads_app/detection_page.dart';
import 'package:gads_app/settings_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(""),
                  GestureDetector(
                    onTap: () => {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsPage(),
                        ),
                      ),
                    },
                    child: const Icon(
                      Icons.settings_outlined,
                      color: Color(0xff4F4F4F),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff013C8A),
                      Color(0xffffffff),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Hi",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Gender and age detection system to help you detect the age and gender for athletes so as to avoid fraud.",
                      style: TextStyle(
                          color: Color(0xff070C3A),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DetectionPage()))
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: const Color(0xff013C8A),
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                            child: Text(
                              "Detect",
                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
