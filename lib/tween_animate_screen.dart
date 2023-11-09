import 'package:flutter/material.dart';

class TweenAnimateScreen extends StatelessWidget {
  TweenAnimateScreen({super.key});
  var color = Colors.amber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TweenAnimateScreen"),
      ),
      body: Center(
        child: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 3500),
          onEnd: () {
            color = Colors.red;
          },
          tween: Tween(begin: 50, end: 300),
          builder: (BuildContext context, dynamic value, Widget? child) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 1500),
              width: value,
              height: value,
              color: color,
            );
          },
        ),
      ),
    );
  }
}
