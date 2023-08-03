import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

import 'constants/text_constants.dart';
import 'utils/scroll_to_top.dart';
import 'widgets/conclusion_screen.dart';
import 'widgets/content_screen.dart';
import 'widgets/initial_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late ScrollController _controller;
  late double scrollPosition;
  late ConfettiController _confettiController;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_setPosition);
    _confettiController = ConfettiController();
    scrollPosition = 0;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => showMessage(context));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _confettiController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          progressBar(context, scrollPosition),
          initialScreen(screenHeight),
          ...contentList
              .map(
                (content) => ContentScreen(
                  screenHeight: screenHeight,
                  titleText: content[0],
                  bodyText: content[1],
                  lottieAsset: content[2],
                  color: content[3],
                ),
              )
              .toList(),
          conclusionScreen(screenHeight, _confettiController, _controller)
        ],
      ),
    );
  }

  void _setPosition() {
    setState(() {
      scrollPosition =
          _controller.offset / _controller.position.maxScrollExtent;
      if (scrollPosition == 1) {
        _confettiController.play();
      }
    });
  }
}
