import 'package:flutter/material.dart';
import 'package:format_ecran_package/format_ecran_package.dart';

class TitleText extends StatelessWidget {
  const TitleText(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
  });

  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      maxLines: maxLines,
      style: style ??
          (context.isMobile
              ? Theme.of(context).textTheme.titleSmall
              : context.isTabletOrDesktop
                  ? Theme.of(context).textTheme.titleLarge
                  : Theme.of(context).textTheme.titleLarge),
    );
  }

  TitleText copyWith({
    String? data,
    TextStyle? style,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return TitleText(
      data ?? this.data,
      style: style ?? this.style,
      textAlign: textAlign ?? this.textAlign,
      maxLines: maxLines ?? this.maxLines,
    );
  }
}
