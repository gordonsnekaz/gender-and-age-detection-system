import 'package:flutter/material.dart';
import 'package:gads_app/landing_screen.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

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
                          builder: (context) => const LandingPage(),
                        ),
                      ),
                    },
                    child: const Text(
                      "Done",
                      style: TextStyle(
                        color: Color(0xff2F80ED),
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff013C8A),
                          Color(0xffffffff),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: const Text(
                      "AD",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "_clayton",
                    style: TextStyle(
                      color: Color(0xff2F80ED),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "General settings",
                style: TextStyle(
                    color: Color(0xffA3A3A3),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                thickness: 0.8,
                color: Color(0xff828282),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  border: Border.all(color: Color(0xff013C8A)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                        fillColor: Color(0xffffffff),
                        border: InputBorder.none,
                        hintText: "_clayton"),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  border: Border.all(color: Color(0xff013C8A)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                        fillColor: Color(0xffffffff),
                        border: InputBorder.none,
                        hintText: "**********"),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "App settings",
                style: TextStyle(
                    color: Color(0xffA3A3A3),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                thickness: 0.8,
                color: Color(0xff828282),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.notifications_outlined,
                        color: Color(0xff4F4F4F),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Enable notifications")
                    ],
                  ),
                  const Icon(
                    Icons.toggle_on_outlined,
                    color: Color(0xff4F4F4F),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.brightness_3_outlined,
                        color: Color(0xff4F4F4F),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Dark mode")
                    ],
                  ),
                  const Icon(
                    Icons.toggle_on_outlined,
                    color: Color(0xff4F4F4F),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
