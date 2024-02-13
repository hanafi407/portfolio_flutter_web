import 'package:flutter/material.dart';
import 'package:porfolio_flutter_web/global/app_assets.dart';
import 'package:porfolio_flutter_web/global/app_size.dart';

class ProfileAnimation extends StatefulWidget {
  final double fontSize;
  const ProfileAnimation({super.key, required this.fontSize});

  @override
  State<ProfileAnimation> createState() => _ProfileAnimationState();
}

class _ProfileAnimationState extends State<ProfileAnimation> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000))
      ..repeat(reverse: true);
    _animation =
        Tween(begin: const Offset(0, -0.02), end: const Offset(0, 0.02)).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SlideTransition(
      position: _animation,
      child: Image.asset(
        AppAssets.profile1,
        width: 360 * widget.fontSize,
        height: 400 * widget.fontSize,
        fit: BoxFit.contain,
      ),
    );
  }
}
