import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/AppImages.dart';
import '../../widgets/ScrollingLists.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: -10,
              left: -160,
              child: Row(
                children: [
                  ScrollingList(
                    initialIndex: 0,
                  ),
                  ScrollingList(
                    initialIndex: 1,
                  ),
                  ScrollingList(
                    initialIndex: 2,
                  ),
                ],
              )),
          Positioned(
              top: 45,
              left: 15,
              child: Text("ETK",
                  textScaleFactor: 2.0,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dynaPuff(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 255, 17, 100)))),
          Positioned(
              top: 60,
              right: 15,
              child: Text(
                "Login",
                textScaleFactor: 1.0,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              )),
          Positioned(
              top: 60,
              right: 78,
              child: Text(
                "Signup",
                textScaleFactor: 1.0,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              )),
          Positioned(
              bottom: 0,
              child: Container(
                height: height * 0.6,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.black,
                    gradient: LinearGradient(colors: [
                      Colors.transparent,
                      // Colors.black38.withOpacity(0.3),
                      Colors.black38.withOpacity(0.5),
                      Colors.black.withOpacity(0.9),
                      Colors.black,
                    ], begin: Alignment.topCenter, end: Alignment.center)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.24,
                      ),
                      Text(
                        "Surround yourself\nwith fashion",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: Colors.white54,
                            fontWeight: FontWeight.w400,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Container(
                        height: height * 0.06,
                        width: double.infinity,
                        child: Center(
                            child: Text(
                          "Shop Now",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        )),
                        decoration: BoxDecoration(
                            // color: Colors.pink.shade900,
                            gradient: LinearGradient(
                                colors: [
                                  Colors.pink.shade500,
                                  Colors.pink.shade900
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            borderRadius: BorderRadius.circular(12)),
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
