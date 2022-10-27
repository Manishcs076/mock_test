import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultContainer extends StatefulWidget {
  DefaultContainer({
    Key? key,
    this.width,
    this.height,
    this.containerColor,
    this.gradient,
    required this.borderWidth,
    required this.borderColor,
    required this.boxShadowColor,
    required this.boxOffset,
    required this.blurRadius,
    required this.spreadRadius,
    required this.child,
    required this.borderBottomLeftRadius,
    required this.borderBottomRightRadius,
    required this.borderTopLeftRadius,
    required this.borderTopRightRadius,
    this.margin,
  }) : super(key: key);

  double? width;
  double? height;
  Color? containerColor;
  double borderWidth;
  Color borderColor;
  Color boxShadowColor;
  Offset boxOffset;
  double blurRadius;
  double spreadRadius;
  Widget child;
  double? borderTopLeftRadius;
  double? borderBottomLeftRadius;
  double? borderTopRightRadius;
  double? borderBottomRightRadius;
  Gradient? gradient;
  EdgeInsetsGeometry? margin;

  @override
  State<DefaultContainer> createState() => _DefaultContainerState();
}

class _DefaultContainerState extends State<DefaultContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        gradient: widget.gradient,
        color: widget.containerColor,
        border: Border.all(
          width: widget.borderWidth,
          color: widget.borderColor,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            widget.borderTopLeftRadius!,
          ),
          topRight: Radius.circular(
            widget.borderTopRightRadius!,
          ),
          bottomLeft: Radius.circular(
            widget.borderBottomLeftRadius!,
          ),
          bottomRight: Radius.circular(
            widget.borderBottomRightRadius!,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: widget.boxShadowColor,
            offset: widget.boxOffset,
            blurRadius: widget.blurRadius,
            spreadRadius: widget.spreadRadius,
          ),
        ],
      ),
      child: widget.child,
    );
  }
}
