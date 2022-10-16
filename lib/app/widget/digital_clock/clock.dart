// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';

import 'clock_model.dart';
import 'spinner_text.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock({
    super.key,
    this.is24HourTimeFormat,
    this.showSecondsDigit,
    this.areaWidth,
    this.areaHeight,
    this.areaDecoration,
    this.areaAligment,
    this.hourMinuteDigitDecoration,
    this.secondDigitDecoration,
    this.digitAnimationStyle,
    this.hourMinuteDigitTextStyle,
    this.secondDigitTextStyle,
    this.amPmDigitTextStyle,
  });

  final bool? is24HourTimeFormat;
  final bool? showSecondsDigit;
  final double? areaWidth;
  final double? areaHeight;
  final BoxDecoration? areaDecoration;
  final AlignmentDirectional? areaAligment;
  final BoxDecoration? hourMinuteDigitDecoration;
  final BoxDecoration? secondDigitDecoration;
  final Curve? digitAnimationStyle;
  final TextStyle? hourMinuteDigitTextStyle;
  final TextStyle? secondDigitTextStyle;
  final TextStyle? amPmDigitTextStyle;

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  late DateTime _dateTime;
  late ClockModel _clockModel;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
    _clockModel = ClockModel();
    _clockModel.is24HourFormat = widget.is24HourTimeFormat ?? true;

    _dateTime = DateTime.now();
    _clockModel.hour = _dateTime.hour;
    _clockModel.minute = _dateTime.minute;
    _clockModel.second = _dateTime.second;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _dateTime = DateTime.now();
      _clockModel.hour = _dateTime.hour;
      _clockModel.minute = _dateTime.minute;
      _clockModel.second = _dateTime.second;

      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.areaWidth ??
          (widget.hourMinuteDigitTextStyle != null
              ? widget.hourMinuteDigitTextStyle!.fontSize! * 7
              : 180),
      height: widget.areaHeight,
      child: Container(
        alignment: widget.areaAligment ?? AlignmentDirectional.bottomCenter,
        decoration: widget.areaDecoration ??
            BoxDecoration(
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 3, 12, 84),
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            _hour(),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: SpinnerText(
                  text: ":",
                  textStyle: widget.hourMinuteDigitTextStyle,
                )),
            _minute,
            _second,
            _amPm,
          ],
        ),
      ),
    );
  }

  Widget _hour() => Container(
        decoration: widget.hourMinuteDigitDecoration ??
            BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(5)),
        child: SpinnerText(
          text: _clockModel.is24HourTimeFormat
              ? hTOhh_24hTrue(_clockModel.hour)
              : hTOhh_24hFalse(_clockModel.hour)[0],
          animationStyle: widget.digitAnimationStyle,
          textStyle: widget.hourMinuteDigitTextStyle,
        ),
      );

  Widget get _minute => Container(
        decoration: widget.hourMinuteDigitDecoration ??
            BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(5)),
        child: SpinnerText(
          text: mTOmm(_clockModel.minute),
          animationStyle: widget.digitAnimationStyle,
          textStyle: widget.hourMinuteDigitTextStyle,
        ),
      );

  Widget get _second => widget.showSecondsDigit != false
      ? Container(
          margin: const EdgeInsets.only(bottom: 0, left: 4, right: 2),
          decoration: widget.secondDigitDecoration ??
              BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5)),
          child: SpinnerText(
            text: sTOss(_clockModel.second),
            animationStyle: widget.digitAnimationStyle,
            textStyle: widget.secondDigitTextStyle ??
                TextStyle(
                    fontSize: widget.hourMinuteDigitTextStyle != null
                        ? widget.hourMinuteDigitTextStyle!.fontSize! / 2
                        : 15,
                    color: widget.hourMinuteDigitTextStyle != null
                        ? widget.hourMinuteDigitTextStyle!.color!
                        : Colors.white),
          ),
        )
      : const Text("");

  Widget get _amPm => _clockModel.is24HourTimeFormat
      ? const Text("")
      : Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          margin: EdgeInsets.only(
              bottom: widget.hourMinuteDigitTextStyle != null
                  ? widget.hourMinuteDigitTextStyle!.fontSize! / 2
                  : 15),
          child: Text(
            " " + hTOhh_24hFalse(_clockModel.hour)[1],
            style: widget.amPmDigitTextStyle ??
                TextStyle(
                    fontSize: widget.hourMinuteDigitTextStyle != null
                        ? widget.hourMinuteDigitTextStyle!.fontSize! / 2
                        : 15,
                    color: widget.hourMinuteDigitTextStyle != null
                        ? widget.hourMinuteDigitTextStyle!.color!
                        : Colors.white),
          ),
        );
}
