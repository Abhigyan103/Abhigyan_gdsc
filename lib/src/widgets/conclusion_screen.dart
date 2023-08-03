import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants/color_constants.dart';
import '../constants/lottie_constants.dart';
import '../constants/text_constants.dart';
import '../utils/scroll_to_top.dart';

SliverAppBar conclusionScreen(double screenHeight,
    ConfettiController confettiController, ScrollController scrollController) {
  return SliverAppBar(
    title: const Text(
      conclusionHeading,
      style: TextStyle(
        fontFamily: 'Google Sans',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        // color: ,
      ),
    ),
    expandedHeight: screenHeight,
    flexibleSpace: FlexibleSpaceBar(
      background: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            // googleRed,
            // googleBlue,
            googleGreen,
            googleYellow,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Stack(children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Lottie.asset(lottieGDSC)),
            const Center(
                child: Text(
              conclusionText,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontFamily: 'Google Sans',
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            )),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () => goToTop(scrollController),
                  child: const Icon(Icons.arrow_upward_sharp),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Align(
                alignment: Alignment.topRight,
                child: ConfettiWidget(
                  confettiController: confettiController,
                  // createParticlePath: drawStar,
                ),
              ),
            )
          ]),
        ),
      ),
      collapseMode: CollapseMode.parallax,
    ),
  );
}
