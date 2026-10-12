import 'package:flutter/material.dart';

/// =============================================================
/// RETRO 90s DESIGN SYSTEM — Design Tokens for Flutter
/// =============================================================
/// Faithfully recreating Windows 95 / GeoCities aesthetic.
/// All colors at maximum saturation, zero border-radius, beveled
/// everything.

// ─────────────────────────────────────────────
//  COLOR PALETTE
// ─────────────────────────────────────────────

class RetroColors {
  RetroColors._();

  // Core surfaces
  static const Color background = Color(0xFFC0C0C0); // Win95 button face gray
  static const Color foreground = Color(0xFF000000); // Pure black
  static const Color muted = Color(0xFF808080); // 50% gray
  static const Color surface = Color(0xFFFFFFFF); // White
  static const Color surfaceAlt = Color(0xFFE8E8E8); // Light gray (alt rows)

  // Accent colors (pure RGB, max saturation)
  static const Color accent = Color(0xFF0000FF); // Hyperlink blue
  static const Color secondary = Color(0xFFFF0000); // Hot red
  static const Color tertiary = Color(0xFFFFFF00); // Bright yellow
  static const Color success = Color(0xFF00FF00); // Lime green
  static const Color successDark = Color(0xFF00AA00); // Readable green

  // Borders (3D bevel system)
  static const Color borderLight = Color(0xFFFFFFFF); // Highlight edge
  static const Color borderDark = Color(0xFF808080); // Shadow edge
  static const Color borderDarker = Color(0xFF404040); // Deep shadow
  static const Color borderLighter = Color(0xFFDFDFDF); // Soft highlight

  // Windows title bar
  static const Color titleBar = Color(0xFF000080); // Navy
  static const Color titleBarEnd = Color(0xFF1084D0); // Gradient end

  // Content panels
  static const Color panelYellow = Color(0xFFFFFFCC); // Notepad yellow

  // Links
  static const Color visitedLink = Color(0xFF800080); // Purple
  static const Color hoverLink = Color(0xFFFF0000); // Red

  // Special
  static const Color hotPink = Color(0xFFFF00FF); // Magenta
  static const Color cyan = Color(0xFF00FFFF); // Cyan
  static const Color teal = Color(0xFF008080); // Teal
}

// ─────────────────────────────────────────────
//  3D BEVEL DECORATIONS
// ─────────────────────────────────────────────

class RetroBevel {
  RetroBevel._();

  /// Outset (raised) bevel — element pops out like a Win95 button
  static BoxDecoration outset({
    Color color = RetroColors.background,
  }) {
    return BoxDecoration(
      color: color,
      border: const Border(
        top: BorderSide(color: RetroColors.borderLight, width: 2),
        left: BorderSide(color: RetroColors.borderLight, width: 2),
        bottom: BorderSide(color: RetroColors.borderDark, width: 2),
        right: BorderSide(color: RetroColors.borderDark, width: 2),
      ),
    );
  }

  /// Inset (sunken) bevel — element looks pressed in like an input field
  static BoxDecoration inset({
    Color color = RetroColors.surface,
  }) {
    return BoxDecoration(
      color: color,
      border: const Border(
        top: BorderSide(color: RetroColors.borderDark, width: 2),
        left: BorderSide(color: RetroColors.borderDark, width: 2),
        bottom: BorderSide(color: RetroColors.borderLight, width: 2),
        right: BorderSide(color: RetroColors.borderLight, width: 2),
      ),
    );
  }

  /// Enhanced outset with deeper shadow for prominent elements
  static BoxDecoration outsetDeep({
    Color color = RetroColors.background,
  }) {
    return BoxDecoration(
      color: color,
      border: const Border(
        top: BorderSide(color: RetroColors.borderLight, width: 2),
        left: BorderSide(color: RetroColors.borderLight, width: 2),
        bottom: BorderSide(color: RetroColors.borderDarker, width: 2),
        right: BorderSide(color: RetroColors.borderDarker, width: 2),
      ),
    );
  }

  /// Colored outset bevel for accent buttons
  static BoxDecoration outsetColored({
    required Color color,
    required Color highlight,
    required Color shadow,
  }) {
    return BoxDecoration(
      color: color,
      border: Border(
        top: BorderSide(color: highlight, width: 2),
        left: BorderSide(color: highlight, width: 2),
        bottom: BorderSide(color: shadow, width: 2),
        right: BorderSide(color: shadow, width: 2),
      ),
    );
  }

  /// Window frame decoration — the outer container for Win95-style windows
  static BoxDecoration windowFrame() {
    return outsetDeep(color: RetroColors.background);
  }
}

// ─────────────────────────────────────────────
//  TYPOGRAPHY
// ─────────────────────────────────────────────

class RetroTextStyles {
  RetroTextStyles._();

  // Font families emulating 90s system fonts
  static const String _sansSerif = 'Segoe UI';
  static const String _heading = 'Impact';
  static const String _mono = 'Courier New';

  /// Hero heading — huge, bold, uppercase
  static TextStyle hero({Color color = RetroColors.foreground}) => TextStyle(
        fontFamily: _heading,
        fontSize: 48,
        fontWeight: FontWeight.w900,
        color: color,
        letterSpacing: 1.5,
        height: 1.2,
      );

  /// Section heading
  static TextStyle h2({Color color = RetroColors.foreground}) => TextStyle(
        fontFamily: _heading,
        fontSize: 28,
        fontWeight: FontWeight.w900,
        color: color,
        letterSpacing: 1.0,
        height: 1.3,
      );

  /// Subsection heading
  static TextStyle h3({Color color = RetroColors.foreground}) => TextStyle(
        fontFamily: _sansSerif,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: color,
        height: 1.3,
      );

  /// Body text
  static TextStyle body({Color color = RetroColors.foreground}) => TextStyle(
        fontFamily: _sansSerif,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: color,
        height: 1.5,
      );

  /// Small / metadata text
  static TextStyle small({Color color = RetroColors.muted}) => TextStyle(
        fontFamily: _sansSerif,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: color,
        height: 1.4,
      );

  /// Monospace text — for counters, stats, code-like elements
  static TextStyle mono({Color color = RetroColors.success}) => TextStyle(
        fontFamily: _mono,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: color,
        letterSpacing: 2.0,
        height: 1.4,
      );

  /// Label text — uppercase, small
  static TextStyle label({Color color = RetroColors.foreground}) => TextStyle(
        fontFamily: _sansSerif,
        fontSize: 11,
        fontWeight: FontWeight.bold,
        color: color,
        letterSpacing: 1.2,
        height: 1.4,
      );

  /// Title bar text — white bold for window title bars
  static const TextStyle titleBar = TextStyle(
    fontFamily: _sansSerif,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: RetroColors.surface,
    height: 1.0,
  );
}

// ─────────────────────────────────────────────
//  REUSABLE WIDGETS
// ─────────────────────────────────────────────

/// Windows 95 style title bar gradient
class RetroTitleBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final bool showCloseButton;

  const RetroTitleBar({
    super.key,
    required this.title,
    this.actions,
    this.showCloseButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [RetroColors.titleBar, RetroColors.titleBarEnd],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: RetroTextStyles.titleBar,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ...?actions,
          if (showCloseButton)
            GestureDetector(
              onTap: () => Navigator.maybePop(context),
              child: Container(
                width: 20,
                height: 20,
                decoration: RetroBevel.outset(),
                child: const Center(
                  child: Text(
                    '×',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: RetroColors.foreground,
                      height: 1.0,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// A Windows 95 style window/panel container
class RetroWindow extends StatelessWidget {
  final String title;
  final Widget child;
  final bool showCloseButton;
  final List<Widget>? titleActions;
  final Color contentColor;

  const RetroWindow({
    super.key,
    required this.title,
    required this.child,
    this.showCloseButton = false,
    this.titleActions,
    this.contentColor = RetroColors.surface,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: RetroBevel.outsetDeep(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RetroTitleBar(
            title: title,
            showCloseButton: showCloseButton,
            actions: titleActions,
          ),
          Container(
            decoration: RetroBevel.inset(color: contentColor),
            padding: const EdgeInsets.all(12),
            child: child,
          ),
        ],
      ),
    );
  }
}

/// A classic 90s beveled button
class RetroButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final IconData? icon;
  final double? width;

  const RetroButton({
    super.key,
    required this.label,
    this.onPressed,
    this.color,
    this.textColor,
    this.icon,
    this.width,
  });

  @override
  State<RetroButton> createState() => _RetroButtonState();
}

class _RetroButtonState extends State<RetroButton> {
  bool _isPressed = false;

  BoxDecoration _getDecoration() {
    final baseColor = widget.color ?? RetroColors.background;

    if (_isPressed) {
      return RetroBevel.inset(color: baseColor);
    }
    return RetroBevel.outset(color: baseColor);
  }

  @override
  Widget build(BuildContext context) {
    final txtColor = widget.textColor ?? RetroColors.foreground;

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onPressed?.call();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: Transform.translate(
        offset: _isPressed ? const Offset(1, 1) : Offset.zero,
        child: Container(
          width: widget.width,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: _getDecoration(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, size: 16, color: txtColor),
                const SizedBox(width: 6),
              ],
              Text(
                widget.label.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: txtColor,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Groove-style horizontal rule (3D etched divider)
class RetroGrooveHR extends StatelessWidget {
  const RetroGrooveHR({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [RetroColors.borderDark, RetroColors.borderLight],
          stops: [0.5, 0.5],
        ),
      ),
    );
  }
}

/// Scrolling marquee text widget
class RetroMarquee extends StatefulWidget {
  final List<InlineSpan> children;
  final double speed;
  final double height;
  final Color? backgroundColor;

  const RetroMarquee({
    super.key,
    required this.children,
    this.speed = 50,
    this.height = 32,
    this.backgroundColor,
  });

  @override
  State<RetroMarquee> createState() => _RetroMarqueeState();
}

class _RetroMarqueeState extends State<RetroMarquee>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
    _controller.addListener(_scroll);
  }

  void _scroll() {
    if (_scrollController.hasClients) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      if (maxScroll > 0) {
        final offset = (_controller.value * maxScroll * 2) % (maxScroll + 200);
        if (offset <= maxScroll) {
          _scrollController.jumpTo(offset);
        }
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      color: widget.backgroundColor ?? RetroColors.titleBar,
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: RichText(
            text: TextSpan(children: widget.children),
          ),
        ),
      ),
    );
  }
}

/// Animated rainbow text
class RainbowText extends StatefulWidget {
  final String text;
  final TextStyle? baseStyle;

  const RainbowText({super.key, required this.text, this.baseStyle});

  @override
  State<RainbowText> createState() => _RainbowTextState();
}

class _RainbowTextState extends State<RainbowText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  static const List<Color> _colors = [
    Color(0xFFFF0000),
    Color(0xFFFF8000),
    Color(0xFFFFFF00),
    Color(0xFF00FF00),
    Color(0xFF0080FF),
    Color(0xFF8000FF),
    Color(0xFFFF0000),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getColor(double t) {
    final index = (t * (_colors.length - 1)).floor();
    final localT = (t * (_colors.length - 1)) - index;
    if (index >= _colors.length - 1) return _colors.last;
    return Color.lerp(_colors[index], _colors[index + 1], localT)!;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Text(
          widget.text,
          style: (widget.baseStyle ?? RetroTextStyles.hero()).copyWith(
            color: _getColor(_controller.value),
          ),
        );
      },
    );
  }
}

/// Blinking "NEW!" / "HOT!" badge
class RetroBlinkBadge extends StatefulWidget {
  final String label;
  final Color color;
  final Color textColor;

  const RetroBlinkBadge({
    super.key,
    this.label = 'NEW!',
    this.color = RetroColors.secondary,
    this.textColor = RetroColors.surface,
  });

  @override
  State<RetroBlinkBadge> createState() => _RetroBlinkBadgeState();
}

class _RetroBlinkBadgeState extends State<RetroBlinkBadge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
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
      builder: (context, child) {
        final scale = 1.0 + (_controller.value * 0.08);
        return Transform.scale(
          scale: scale,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: widget.color,
              border: Border.all(color: RetroColors.foreground, width: 2),
              boxShadow: [
                BoxShadow(
                  color: widget.color.withValues(alpha: 0.5 * _controller.value),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Text(
              widget.label,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 10,
                color: widget.textColor,
                letterSpacing: 1.0,
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Construction stripe pattern
class ConstructionStripes extends StatelessWidget {
  final double height;

  const ConstructionStripes({super.key, this.height = 20});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, height),
      painter: _ConstructionPainter(),
    );
  }
}

class _ConstructionPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final yellowPaint = Paint()..color = RetroColors.tertiary;
    final blackPaint = Paint()..color = RetroColors.foreground;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), yellowPaint);

    const stripeWidth = 20.0;
    for (double x = -size.height; x < size.width + size.height; x += stripeWidth * 2) {
      final path = Path()
        ..moveTo(x, size.height)
        ..lineTo(x + stripeWidth, size.height)
        ..lineTo(x + size.height + stripeWidth, 0)
        ..lineTo(x + size.height, 0)
        ..close();
      canvas.drawPath(path, blackPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Hit counter display — classic 90s visitor counter
class RetroHitCounter extends StatelessWidget {
  final int count;
  final String label;

  const RetroHitCounter({
    super.key,
    required this.count,
    this.label = 'VISITORS',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: RetroBevel.inset(color: RetroColors.foreground),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$label: ',
            style: RetroTextStyles.mono(color: RetroColors.success),
          ),
          Text(
            count.toString().padLeft(7, '0'),
            style: RetroTextStyles.mono(color: RetroColors.success).copyWith(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

/// Tiled 90s background pattern
class RetroBackground extends StatelessWidget {
  final Widget child;

  const RetroBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _TiledBackgroundPainter(),
      child: child,
    );
  }
}

class _TiledBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final basePaint = Paint()..color = RetroColors.background;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), basePaint);

    final dotPaint = Paint()
      ..color = const Color(0xFFB8B8B8)
      ..strokeWidth = 1;

    for (double y = 0; y < size.height; y += 4) {
      for (double x = 0; x < size.width; x += 4) {
        if ((x ~/ 4 + y ~/ 4) % 2 == 0) {
          canvas.drawRect(Rect.fromLTWH(x, y, 1, 1), dotPaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
