import 'package:flutter/material.dart';

class BoxLineWidget extends StatefulWidget {
  const BoxLineWidget({super.key, required this.width, required this.height});
  final double width, height;

  @override
  State<BoxLineWidget> createState() => _BoxLineWidgetState();
}

class _BoxLineWidgetState extends State<BoxLineWidget> {
  double scale = 1;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          scale = 1.2;
        });
      },
      onExit: (_) {
        setState(() {
          scale = 1;
        });
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 100),
        scale: scale,
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary,
              width: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
