
// import 'package:aplikasi_keadaan_darurat/pages/login.dart';
// import 'package:aplikasi_keadaan_darurat/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';


class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.grey[300],
      pages: [
        PageViewModel(
  title: "Title of introduction page",
  body: "Welcome to the app! This is a description of how it works.",
  image: const Center(
    child: Icon(Icons.waving_hand, size: 50.0),
  ),
),
PageViewModel(
  title: "Title of introduction page",
  body: "Welcome to the app! This is a description of how it works.",
  image: const Center(
    child: Icon(Icons.waving_hand, size: 50.0),
  ),
),],
     showSkipButton: false,
     showBackButton: true,
  skip: const Text("Skip"),
  next: const Text("Next"),
  done: const Text("Done"),
  back: const Text("Back"),
  onDone:() {
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
  },
  baseBtnStyle: TextButton.styleFrom(
    backgroundColor: Colors.grey.shade400,),
    skipStyle: TextButton.styleFrom(foregroundColor: Colors.grey[900]),  
  doneStyle: TextButton.styleFrom(foregroundColor: Colors.grey[900]),  
  nextStyle: TextButton.styleFrom(foregroundColor: Colors.grey[900],),
  backStyle: TextButton.styleFrom(foregroundColor: Colors.grey[900],),
  dotsDecorator: DotsDecorator(
    size: const Size.square(10.0),
    activeSize: const Size(13.0, 10.0),
    activeColor: Colors.grey[800],
    color: Colors.black26,
    spacing: const EdgeInsets.symmetric(horizontal: 3.0),
    activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0))
  ));
  }
}