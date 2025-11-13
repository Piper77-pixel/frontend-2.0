import 'package:brain_bucks/utils/box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTabBar<K extends Object, V extends String> extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.segments,
    required this.controller, // 👈 Rx instead of ValueNotifier
    this.activeStyle = const TextStyle(fontWeight: FontWeight.w600),
    this.inactiveStyle,
    this.itemPadding = const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.backgroundColor = const Color(0x42000000),
    this.sliderColor = const Color(0xFFFFFFFF),
    this.sliderOffset = 2.0,
    this.animationDuration = const Duration(milliseconds: 250),
    this.shadow = const <BoxShadow>[BoxShadow(color: Color(0x42000000), blurRadius: 8.0)],
    this.sliderDecoration,
    this.enableDrag = true,
  })  : assert(segments.length > 1, 'Minimum segments amount is 2');

  /// Controls segments selection with GetX
  final Rx<K> controller;

  /// Map of segments
  final Map<K, V> segments;

  final TextStyle activeStyle;
  final TextStyle? inactiveStyle;
  final EdgeInsetsGeometry itemPadding;
  final BorderRadius borderRadius;
  final Color sliderColor;
  final Color backgroundColor;
  final double sliderOffset;
  final Duration animationDuration;
  final List<BoxShadow>? shadow;
  final BoxDecoration? sliderDecoration;
  final bool enableDrag;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final value = controller.value;
      final valueIndex = segments.keys.toList().indexOf(value);

      final maxSize = _obtainMaxTextSize();
      final itemSize = Size(maxSize.width + itemPadding.horizontal, maxSize.height + itemPadding.vertical);
      final containerSize = Size(itemSize.width * segments.length, itemSize.height);

      return Container(
        constraints: BoxConstraints.tightFor(width: containerSize.width, height: containerSize.height),
        clipBehavior: Clip.hardEdge,
        decoration: boxDecoration(color: backgroundColor, borderRadius: borderRadius),
        child: Opacity(
          opacity: 1,
          child: Stack(
            fit: StackFit.expand,
            children: [
              AnimatedAlign(
                duration: animationDuration,
                curve: Curves.ease,
                alignment: _obtainAlignment(context, valueIndex),
                child: FractionallySizedBox(
                  widthFactor: 1 / segments.length,
                  heightFactor: 1,
                  child: Container(
                    margin: EdgeInsets.all(sliderOffset),
                    decoration: sliderDecoration ??
                        boxDecoration(
                          color: sliderColor,
                          borderRadius: borderRadius.subtract(BorderRadius.all(Radius.circular(sliderOffset))),
                          boxShadow: shadow,
                        ),
                  ),
                ),
              ),
              Row(
                children: [
                  for (final entry in segments.entries)
                    Expanded(
                      child: GestureDetector(
                        onHorizontalDragUpdate: enableDrag
                            ? (details) => _handleSegmentMove(details, entry.key, Directionality.of(context), itemSize)
                            : null,
                        onTap: () => controller.value = entry.key,
                        child: Container(
                          height: itemSize.height,
                          alignment: Alignment.center,
                          color: Colors.transparent,
                          child: AnimatedDefaultTextStyle(
                            duration: animationDuration,
                            style: (value == entry.key ? activeStyle : (inactiveStyle ?? const TextStyle(color: Colors.black54))),
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            child: Text(entry.value, textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  /// Compute max size for text to align
  Size _obtainMaxTextSize() {
    Size textPainter(String text) {
      final tp = TextPainter(
        text: TextSpan(text: text, style: activeStyle),
        maxLines: 1,
        textDirection: TextDirection.ltr,
      )..layout(minWidth: 0, maxWidth: double.infinity);
      return tp.size;
    }

    return segments.values.map(textPainter).reduce((a, b) => a.width >= b.width ? a : b);
  }

  Alignment _obtainAlignment(BuildContext context, int index) {
    final textDirection = Directionality.of(context);
    final alignmentValue = 2 * (index / (segments.length - 1)) - 1;
    return Alignment(textDirection == TextDirection.rtl ? -alignmentValue : alignmentValue, 0);
  }

  void _handleSegmentMove(DragUpdateDetails touch, K value, TextDirection textDirection, Size itemSize) {
    final indexKey = segments.keys.toList().indexOf(value);
    final indexMove = textDirection == TextDirection.rtl
        ? (itemSize.width * indexKey - touch.localPosition.dx) / itemSize.width + 1
        : (itemSize.width * indexKey + touch.localPosition.dx) / itemSize.width;

    if (indexMove >= 0 && indexMove <= segments.keys.length) {
      controller.value = segments.keys.elementAt(indexMove.toInt());
    }
  }
}
