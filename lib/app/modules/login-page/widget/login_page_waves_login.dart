// 🐦 Flutter imports:

import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class WavesLogin extends StatelessWidget {
  const WavesLogin({
    super.key,
    required List<Color> colors,
    required List<int> durations,
    required List<double> heightPercentages,
    required Color backgroundColor,
  })  : _colors = colors,
        _durations = durations,
        _heightPercentages = heightPercentages,
        _backgroundColor = backgroundColor;

  final List<Color> _colors;
  final List<int> _durations;
  final List<double> _heightPercentages;
  final Color _backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.5,
      child: WaveWidget(
        config: CustomConfig(
          blur: const MaskFilter.blur(BlurStyle.solid, 20),
          colors: _colors,
          durations: _durations,
          heightPercentages: _heightPercentages,
        ),
        backgroundColor: _backgroundColor,
        size: const Size(double.infinity, double.infinity),
        waveAmplitude: 0,
        waveFrequency: 3.0,
        wavePhase: 20.0,
      ),
    );
  }
}
