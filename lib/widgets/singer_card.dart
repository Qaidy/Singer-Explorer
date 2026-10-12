import 'package:flutter/material.dart';
import '../models/singer.dart';
import '../theme/retro_theme.dart';

class SingerCard extends StatefulWidget {
  final Singer singer;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;
  final int index;

  const SingerCard({
    super.key,
    required this.singer,
    required this.onTap,
    required this.onFavoriteToggle,
    this.index = 0,
  });

  @override
  State<SingerCard> createState() => _SingerCardState();
}

class _SingerCardState extends State<SingerCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final singer = widget.singer;
    // Alternating row background
    final bgColor = widget.index.isEven
        ? RetroColors.surface
        : RetroColors.surfaceAlt;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            decoration: BoxDecoration(
              color: _isHovered
                  ? RetroColors.titleBar
                  : bgColor,
              border: Border.all(
                color: RetroColors.borderDark,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                // Image cell with border
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: const Border(
                      right: BorderSide(
                        color: RetroColors.borderDark,
                        width: 2,
                      ),
                    ),
                    color: bgColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      decoration: RetroBevel.inset(),
                      padding: const EdgeInsets.all(2),
                      child: Hero(
                        tag: 'singer-image-${singer.name}',
                        child: Image.asset(
                          singer.image,
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),

                // Name cell
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: RetroColors.borderDark,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          singer.name,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: _isHovered
                                ? RetroColors.surface
                                : RetroColors.foreground,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Nationality
                        Text(
                          singer.nationality,
                          style: TextStyle(
                            fontSize: 11,
                            color: _isHovered
                                ? RetroColors.surfaceAlt
                                : RetroColors.muted,
                            fontFamily: 'Courier New',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Genre cell — pill-style badge
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: RetroColors.borderDark,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: _isHovered
                            ? RetroColors.titleBarEnd
                            : RetroColors.titleBar,
                        border: Border.all(
                          color: RetroColors.foreground,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        singer.genre.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: RetroColors.surface,
                          letterSpacing: 0.5,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),

                // Favorite cell
                SizedBox(
                  width: 48,
                  child: Center(
                    child: _RetroFavButton(
                      isFavorite: singer.isFavorite,
                      onPressed: widget.onFavoriteToggle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Beveled favorite toggle button
class _RetroFavButton extends StatefulWidget {
  final bool isFavorite;
  final VoidCallback onPressed;

  const _RetroFavButton({
    required this.isFavorite,
    required this.onPressed,
  });

  @override
  State<_RetroFavButton> createState() => _RetroFavButtonState();
}

class _RetroFavButtonState extends State<_RetroFavButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onPressed();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: Transform.translate(
        offset: _pressed ? const Offset(1, 1) : Offset.zero,
        child: Container(
          width: 28,
          height: 28,
          decoration: _pressed
              ? RetroBevel.inset()
              : RetroBevel.outset(),
          child: Center(
            child: Text(
              widget.isFavorite ? '♥' : '♡',
              style: TextStyle(
                fontSize: 16,
                color: widget.isFavorite
                    ? RetroColors.secondary
                    : RetroColors.foreground,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
