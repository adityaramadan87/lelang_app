import 'package:flutter/material.dart';

class HeroContainer extends StatefulWidget {

  String heroTag;
  double height;
  double width;
  Widget child;
  EdgeInsetsGeometry margin;

  HeroContainer({
    @required this.heroTag,
    @required this.child,
    @required this.height,
    @required this.width,
    EdgeInsetsGeometry margin
  }) :
  margin = margin ?? EdgeInsets.all(0);

  @override
  _HeroContainerState createState() => _HeroContainerState();
}

class _HeroContainerState extends State<HeroContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      width: widget.width,
      height: widget.height,
      child: Hero(
          tag: widget.heroTag,
          child: widget.child
      ),
    );
  }
}
