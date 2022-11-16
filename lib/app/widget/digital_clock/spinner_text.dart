// ignore_for_file: library_private_types_in_public_api

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class SpinnerText extends StatefulWidget {
  const SpinnerText(
      {super.key, required this.text, this.textStyle, this.animationStyle});

  final String text;
  final TextStyle? textStyle;
  final Curve? animationStyle;

  @override
  _SpinnerTextState createState() => _SpinnerTextState();
}

class _SpinnerTextState extends State<SpinnerText>
    with SingleTickerProviderStateMixin {
  String topText = "";
  String bottomText = "";

  late AnimationController _spinTextAnimationController;
  late Animation<double> _spinAnimation;

  @override
  void initState() {
    super.initState();
    bottomText = widget.text;
    _spinTextAnimationController = AnimationController(
        duration: const Duration(milliseconds: 750), vsync: this)
      ..addListener(() => setState(() {}))
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            bottomText = topText;
            topText = "";
            _spinTextAnimationController.value = 0.0;
          });
        }
      });

    _spinAnimation = CurvedAnimation(
        parent: _spinTextAnimationController,
        curve: widget.animationStyle ?? Curves.decelerate);
  }

  @override
  void dispose() {
    _spinTextAnimationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SpinnerText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.text != oldWidget.text) {
      //Need to spin new value
      topText = widget.text;
      _spinTextAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipper: RectClipper(),
      child: Stack(
        children: <Widget>[
          FractionalTranslation(
            translation: Offset(0.0, _spinAnimation.value - 1.0),
            child: Text(
              topText,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: widget.textStyle ??
                  const TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          FractionalTranslation(
            translation: Offset(0.0, _spinAnimation.value),
            child: Text(bottomText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: widget.textStyle ??
                    const TextStyle(color: Colors.white, fontSize: 30)),
          ),
        ],
      ),
    );
  }
}

class RectClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0.0, 0.0, size.width, size.height + 1);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
