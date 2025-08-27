import 'package:brain_bucks/utils/colors.dart';
import 'package:flutter/material.dart';

class ImageFillProgressBar extends StatelessWidget {
  /// 0.0 .. 1.0
  final double value;
  final double height;
  final BorderRadius radius;

  /// Use AssetImage / NetworkImage / FileImage etc.
  final ImageProvider fillImage;

  const ImageFillProgressBar({
    super.key,
    required this.value,
    required this.fillImage,
    this.height = 20,
    this.radius = const BorderRadius.all(Radius.circular(12)),
  });

  @override
  Widget build(BuildContext context) {
    final v = value.clamp(0.0, 1.0);

    return ClipRRect(
      borderRadius: radius,
      child: SizedBox(
        height: height,
        // give it width constraints from parent; use SizedBox(width: double.infinity) or wrap with Expanded
        child: Stack(
          children: [
            // Track (unfilled part)
            Positioned.fill(child: Container(color: AppColors.kLightBg)),

            // Filled part (image)
            Align(
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: v,
                child: SizedBox.expand(
                  child: Image(
                    image: fillImage,
                    fit: BoxFit.cover,     // image covers the bar height/width
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
