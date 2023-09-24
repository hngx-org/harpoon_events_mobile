import 'package:flutter/material.dart';
import 'package:harpoon_events_app/util/color_lib.dart';

class RotatingRefreshButton extends StatefulWidget {
  final VoidCallback onPressed;

  const RotatingRefreshButton({super.key, required this.onPressed});

  @override
  _RotatingRefreshButtonState createState() => _RotatingRefreshButtonState();
}

class _RotatingRefreshButtonState extends State<RotatingRefreshButton> with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _rotationAnimation = Tween(begin: 0.0, end: 1.0).animate(_rotationController);
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  void _startRotationAnimation() {
    _rotationController.reset();
    _rotationController.forward();
  }

  void _onPressed() {
    _startRotationAnimation();
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPressed,
      child: AnimatedBuilder(
        animation: _rotationAnimation,
        builder: (context, child) {
          return Transform.rotate(
            angle: _rotationAnimation.value * 2 * 3.14159,
            child: child,
          );
        },
        child: const Icon(
          Icons.refresh,
          color: ColorLib.purple,
          size: 25,
        ),
      ),
    );
  }
}