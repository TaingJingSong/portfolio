import 'package:flutter/material.dart';

class DotBoxWidget extends StatefulWidget {
  const DotBoxWidget({
    super.key,
    this.count = 25,
    this.space = 17,
    required this.width,
    required this.height,
  });
  final int count;
  final double width, height, space;

  @override
  State<DotBoxWidget> createState() => _DotBoxWidgetState();
}

class _DotBoxWidgetState extends State<DotBoxWidget> {
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
        duration: const Duration(milliseconds: 150),
        scale: scale,
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: GridView.count(
            crossAxisCount: 5,
            mainAxisSpacing: widget.space,
            crossAxisSpacing: widget.space,
            childAspectRatio: 1,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(widget.count, (_) => _buildDot(context)),
          ),
        ),
      ),
    );
  }

  Widget _buildDot(context) {
    return Container(
      width: 5,
      height: 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
