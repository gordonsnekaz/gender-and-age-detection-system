import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gads_app/age_result.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import 'landing_screen.dart';

class DetectionPage extends StatefulWidget {
  const DetectionPage({super.key});

  @override
  State<DetectionPage> createState() => _DetectionPageState();
}

class _DetectionPageState extends State<DetectionPage> {
  bool _loading = true;
  late File _image;
  late List _output;
  final picker = ImagePicker(); //allows us to pick image from gallery or camera

  @override
  void initState() {
    //initS is the first function that is executed by default when this class is called
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    //dis function disposes and clears our memory
    super.dispose();
    Tflite.close();
  }

  classifyImage(File image) async {
    //this function runs the model on the image
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults:
          5, //the amout of categories our neural network can predict (here no. of animals)
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _output = output!;
      _loading = false;
    });
  }

  loadModel() async {
    //this function loads our model
    await Tflite.loadModel(
      model: 'assets/model_unquant_gender.tflite',
      labels: 'assets/labels_gender.txt',
    );
  }

  pickImage() async {
    //this function to grab the image from camera
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  pickGalleryImage() async {
    //this function to grab the image from gallery
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffDDEDF9),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffDDEDF9),
                Color(0xffFFFFFF),
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  //color: Color(0xffE7F1FF),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 15.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LandingPage(),
                              ),
                            ),
                          },
                          child: Row(
                            children: const [
                              Icon(
                                Icons.arrow_back,
                                color: Color(0xff828282),
                                size: 20,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  //color: Color(0xffE7F1FF),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 25.0,
                      right: 25.0,
                      top: 5.0,
                      bottom: 15.0,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              Text(
                                "Predict",
                                style: GoogleFonts.roboto(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    children: [
                      _loading == true
                          ? Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: const AssetImage(
                                            "assets/gender.jpg"),
                                        colorFilter: ColorFilter.mode(
                                          const Color(0xff828282)
                                              .withOpacity(0.4),
                                          BlendMode.modulate,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 260,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 40,
                                      ),
                                      child: Text(
                                        "Please pick a picture to predict",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.roboto(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    pickGalleryImage();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        color: Color(0xff219653),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: const Center(
                                        child: Text(
                                      'Open gallery',
                                      style: TextStyle(
                                          color: Color(0xfff5f8ff),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    )),
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    pickImage();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        color: Color(0xff013C8A),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: const Center(
                                        child: Text(
                                      'Open camera',
                                      style: TextStyle(
                                          color: Color(0xfff5f8ff),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    )),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: FileImage(_image),
                                        colorFilter: ColorFilter.mode(
                                          const Color(0xff828282)
                                              .withOpacity(1),
                                          BlendMode.modulate,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 260,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    pickGalleryImage();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        color: Color(0xff219653),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: const Center(
                                        child: Text(
                                      'Open gallery',
                                      style: TextStyle(
                                          color: Color(0xfff5f8ff),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    )),
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    pickImage();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        color: Color(0xff013C8A),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: const Center(
                                        child: Text(
                                      'Open camera',
                                      style: TextStyle(
                                          color: Color(0xfff5f8ff),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    )),
                                  ),
                                ),
                                const SizedBox(
                                  height: 36,
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      "Person's details",
                                      style: TextStyle(
                                          color: Color(0xffA3A3A3),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Gender",
                                        style: TextStyle(
                                          color: Color(
                                            0xff070C3A,
                                          ),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Text(_output[0]['label'],
                                        style: const TextStyle(
                                          color: Color(
                                            0xff013C8A,
                                          ),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                AgeResultPage(
                                  image: _image,
                                  gender: _output[0]['label'],
                                )
                              ],
                            ),
                      //Image.file(image!),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
