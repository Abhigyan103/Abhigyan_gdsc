import 'package:flutter/material.dart';

void showMessage(BuildContext context) {
  showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            title: const Text(
              '(Slowly) Scroll down',
              style: TextStyle(fontSize: 15),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Ok!'))
            ],
          ));
}

goToTop(ScrollController scrollController) {
  scrollController.animateTo(0,
      duration: const Duration(seconds: 1, milliseconds: 500),
      curve: Curves.easeInOut);
}

progressBar(BuildContext context, double scrollPosition) {
  return SliverAppBar(
    pinned: true,
    toolbarHeight: 3,
    titleSpacing: 0,
    title: Container(
      height: 10,
      color: Colors.green,
      width: scrollPosition * MediaQuery.sizeOf(context).width,
    ),
  );
}
