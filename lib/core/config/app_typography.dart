import 'package:flutter/material.dart';

class AppTypography extends TextStyle {
  final double? size;
  final Color? fontColor;
  final FontWeight? weight;
  final FontStyle? style;
  final TextOverflow? textOverflow;

  const AppTypography({
    this.size = 14,
    this.fontColor = Colors.black,
    this.weight = FontWeight.normal,
    this.style = FontStyle.normal,
    this.textOverflow = TextOverflow.visible,
  }) : super(
    color: fontColor,
    fontSize: size,
    fontWeight: weight,
    fontStyle: style,
    overflow: textOverflow,
  );

  factory AppTypography.copyWith({
    double? size,
    Color? color,
    FontWeight? weight,
    FontStyle? fontStyle,
    TextOverflow? overflow,
  }) {
    return AppTypography(
      size: size,
      fontColor: color,
      style: fontStyle,
      weight: weight,
      textOverflow: overflow,
    );
  }

  factory AppTypography.header20({
    Color? color,
    TextOverflow? overflow,
  }) {
    return AppTypography(
      size: 20,
      fontColor: color,
      weight: FontWeight.w900,
      textOverflow: overflow,
    );
  }

  factory AppTypography.header18({
    Color? color,
    TextOverflow? overflow,
  }) {
    return AppTypography(
      size: 18,
      fontColor: color,
      weight: FontWeight.w900,
      textOverflow: overflow,
    );
  }

  factory AppTypography.title18({
    Color? color,
    TextOverflow? overflow,
  }) {
    return AppTypography(
      size: 18,
      fontColor: color,
      weight: FontWeight.w700,
      textOverflow: overflow,
    );
  }

  factory AppTypography.title16({
    Color? color,
    TextOverflow? overflow,
  }) {
    return AppTypography(
      size: 16,
      fontColor: color,
      weight: FontWeight.w700,
      textOverflow: overflow,
    );
  }

  factory AppTypography.body14({
    Color? color,
    TextOverflow? overflow,
    FontStyle? style,
  }) {
    return AppTypography(
      size: 14,
      fontColor: color,
      weight: FontWeight.normal,
      textOverflow: overflow,
      style: style,
    );
  }

  factory AppTypography.body12({
    Color? color,
    TextOverflow? overflow,
    FontStyle? style,
  }) {
    return AppTypography(
      size: 12,
      fontColor: color,
      weight: FontWeight.normal,
      textOverflow: overflow,
      style: style,
    );
  }

  factory AppTypography.body10({
    Color? color,
    TextOverflow? overflow,
    FontStyle? style,
  }) {
    return AppTypography(
      size: 10,
      fontColor: color,
      weight: FontWeight.normal,
      textOverflow: overflow,
      style: style,
    );
  }

  factory AppTypography.action({
    Color? color,
    TextOverflow? overflow,
    FontStyle? style,
  }) {
    return AppTypography(
      size: 14,
      fontColor: color,
      weight: FontWeight.w600,
      textOverflow: overflow,
      style: style,
    );
  }
}
