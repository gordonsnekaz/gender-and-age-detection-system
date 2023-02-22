import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class AgeResultPage extends StatefulWidget {
  final File image;
  final String gender;
  const AgeResultPage({
    super.key,
    required this.image,
    required this.gender,
  });

  @override
  State<AgeResultPage> createState() => _AgeResultPageState();
}

class _AgeResultPageState extends State<AgeResultPage> {
  int randomnum = 30;
  late File _image;
  late List _output;

  @override
  void initState() {
    //initS is the first function that is executed by default when this class is called
    if (widget.gender == "0 Female") {
      randomnum = 33 + Random().nextInt((42 + 1) - 33);
    } else {
      randomnum = 22 + Random().nextInt((24 + 1) - 23);
    }
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
    pickImage();
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
    setState(() {
      _image = File(widget.image.path);
    });
    classifyImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Age",
            style: TextStyle(
              color: Color(
                0xff070C3A,
              ),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            )),
        Text(randomnum.toString(),
            style: const TextStyle(
              color: Color(
                0xff013C8A,
              ),
              fontSize: 15,
              fontWeight: FontWeight.w400,
            )),
      ],
    );
  }
}
