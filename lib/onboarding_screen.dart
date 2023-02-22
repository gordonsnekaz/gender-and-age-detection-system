import 'package:flutter/material.dart';

import 'login_screen.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      height: 400,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/gender.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        children: const [
                          Text(
                            "GADS",
                            style: TextStyle(
                                color: Color(0xff070C3A),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Gender and age detection system to help you detect the age and gender for athletes so as to avoid and reduce fraud in games.",
                            style: TextStyle(
                              color: Color(0xff070C3A),
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()))
                },
                child: Container(
                    padding: const EdgeInsets.only(
                      bottom: 60.0,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 90.0,
                        vertical: 15.0,
                      ),
                      decoration: BoxDecoration(
                          color: const Color(0xff013C8A),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        "Get started",
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}
