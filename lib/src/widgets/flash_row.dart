import 'package:flutter/material.dart';

class FlashRow extends StatefulWidget {
  final Widget child;
  final bool shouldFlash;
  final Color flashColor;
  const FlashRow({
    super.key,
    required this.child,
    required this.shouldFlash,
    this.flashColor = Colors.black,
  });

  @override
  State<FlashRow> createState() => _FlashRowState();
}

class _FlashRowState extends State<FlashRow> {
  Color? _backgroundColor;

  @override
  void didUpdateWidget(covariant FlashRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.shouldFlash) {
      setState(() => _backgroundColor = widget.flashColor);
      Future.delayed(const Duration(milliseconds: 200), () {
        if (mounted) {
          setState(() => _backgroundColor = null);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: _backgroundColor,
      child: widget.child,
    );
  }
}

class FlashCell extends StatefulWidget {
  final Widget child;
  final bool shouldFlash;
  final Duration duration;
  final Color flashColor;

  const FlashCell({
    super.key,
    required this.child,
    required this.shouldFlash,
    this.duration = const Duration(milliseconds: 600),
    this.flashColor = Colors.black,
  });

  @override
  State<FlashCell> createState() => _FlashCellState();
}

class _FlashCellState extends State<FlashCell> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _colorAnimation = ColorTween(
      begin: null,
      end: widget.flashColor,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void didUpdateWidget(covariant FlashCell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.shouldFlash) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Container(
          color: _colorAnimation.value?.withOpacity(1.0 - _controller.value),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class FlashingRowOverlay extends StatelessWidget {
  final bool show;
  final double height;
  final Widget child;
  final Color color;

  const FlashingRowOverlay({
    super.key,
    required this.show,
    required this.child,
    this.height = 56,
    this.color = Colors.yellowAccent,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: show ? 0.5 : 0.0,
          child: Container(
            height: height,
            color: color,
          ),
        ),
      ],
    );
  }
}
