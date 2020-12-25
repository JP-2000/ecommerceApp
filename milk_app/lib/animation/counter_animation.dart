import 'package:flutter/material.dart';

class CounterAnimation extends StatefulWidget {
  @override
  _CounterAnimationState createState() => _CounterAnimationState();
}

class _CounterAnimationState extends State<CounterAnimation> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation animation;
  int counter = 0;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    animation = new CurvedAnimation(parent: _controller, curve: Curves.bounceIn);
    _controller.addListener(() {
      this.setState(() {
        counter++;
        debugPrint("print $counter");
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        _controller.isAnimating ? (counter).toStringAsFixed(2) : "Lest Begin",
        style: TextStyle(
          fontSize: 24.0 * _controller.value + 16.0
        ),
      ),
      onTap: () {
        _controller.forward(from: 0.0);
      }
    );
  }
}
