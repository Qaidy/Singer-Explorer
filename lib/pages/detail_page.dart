import 'package:flutter/material.dart';
import '../models/singer.dart';
import '../theme/retro_theme.dart';

class DetailPage extends StatefulWidget {
  final Singer singer;
  final VoidCallback? onFavoriteToggle;

  const DetailPage({
    super.key,
    required this.singer,
    this.onFavoriteToggle,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  void _toggleFavorite() {
    setState(() {
      widget.singer.isFavorite = !widget.singer.isFavorite;
    });
    widget.onFavoriteToggle?.call();
  }

  @override
  Widget build(BuildContext context) {
    final singer = widget.singer;

    return Scaffold(
      backgroundColor: RetroColors.background,
      body: RetroBackground(
        child: SafeArea(
          child: Column(
            children: [
              // ═══ WINDOW FRAME ═══
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(4),
                  decoration: RetroBevel.outsetDeep(),
                  child: Column(
                    children: [
                      // ─── TITLE BAR ───
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              RetroColors.titleBar,
                              RetroColors.titleBarEnd,
                            ],
                          ),
                        ),
                        child: Row(
                          children: [
                            // Window icon
                            Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                color: RetroColors.tertiary,
                                border: Border.all(
                                  color: RetroColors.foreground,
                                  width: 1,
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  '♫',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: RetroColors.foreground,
                                    height: 1.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                '${singer.name} - Singer Explorer',
                                style: RetroTextStyles.titleBar,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            // Minimize
                            _buildTitleBarButton('_'),
                            const SizedBox(width: 2),
                            // Maximize
                            _buildTitleBarButton('□'),
                            const SizedBox(width: 2),
                            // Close (navigates back)
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                width: 18,
                                height: 18,
                                decoration: RetroBevel.outset(),
                                child: const Center(
                                  child: Text(
                                    '×',
                                    style: TextStyle(
                                      fontSize: 12,
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
                      ),

                      // ─── MENU BAR ───
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 2,
                        ),
                        color: RetroColors.background,
                        child: Row(
                          children: [
                            _buildMenuItem('← Back', onTap: () {
                              Navigator.pop(context);
                            }),
                            _buildMenuItem(
                              singer.isFavorite ? '♥ Unfavorite' : '♡ Favorite',
                              onTap: _toggleFavorite,
                            ),
                          ],
                        ),
                      ),

                      const RetroGrooveHR(),

                      // ─── CONTENT ───
                      Expanded(
                        child: Container(
                          decoration: RetroBevel.inset(
                            color: RetroColors.surface,
                          ),
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // ══ IMAGE + INFO ROW ══
                                _buildProfileSection(singer),

                                const SizedBox(height: 8),
                                const ConstructionStripes(height: 12),
                                const SizedBox(height: 8),

                                // ══ BIOGRAPHY WINDOW ══
                                _buildBiographySection(singer),

                                const SizedBox(height: 8),

                                // ══ POPULAR SONGS WINDOW ══
                                _buildSongsSection(singer),

                                const SizedBox(height: 8),

                                // ══ STATS SECTION ══
                                _buildStatsSection(singer),

                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ═══ STATUS BAR ═══
              Container(
                margin: const EdgeInsets.fromLTRB(4, 0, 4, 4),
                decoration: RetroBevel.outsetDeep(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 2,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: RetroBevel.inset(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        child: Text(
                          'Viewing: ${singer.name}',
                          style: RetroTextStyles.small(
                            color: RetroColors.foreground,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 2),
                    Container(
                      decoration: RetroBevel.inset(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            singer.isFavorite ? '♥' : '♡',
                            style: TextStyle(
                              fontSize: 12,
                              color: singer.isFavorite
                                  ? RetroColors.secondary
                                  : RetroColors.muted,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            singer.isFavorite ? 'FAVORITED' : 'NOT FAVORITED',
                            style: RetroTextStyles.small(
                              color: RetroColors.foreground,
                            ).copyWith(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════
  //  PROFILE SECTION
  // ═══════════════════════════════════════════
  Widget _buildProfileSection(Singer singer) {
    return Container(
      decoration: RetroBevel.outsetDeep(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Title bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [RetroColors.titleBar, RetroColors.titleBarEnd],
              ),
            ),
            child: Row(
              children: [
                const Text(
                  'ARTIST PROFILE',
                  style: RetroTextStyles.titleBar,
                ),
                const Spacer(),
                if (singer.activeSince != null)
                  const RetroBlinkBadge(
                    label: 'HOT!',
                    color: RetroColors.secondary,
                  ),
              ],
            ),
          ),
          // Content
          Container(
            decoration: RetroBevel.inset(color: RetroColors.panelYellow),
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image in inset frame
                Container(
                  decoration: RetroBevel.inset(),
                  padding: const EdgeInsets.all(3),
                  child: Hero(
                    tag: 'singer-image-${singer.name}',
                    child: Image.asset(
                      singer.image,
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name with rainbow effect
                      RainbowText(
                        text: singer.name.toUpperCase(),
                        baseStyle: RetroTextStyles.h2(),
                      ),
                      const SizedBox(height: 8),

                      // Genre badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: RetroColors.accent,
                          border: Border.all(
                            color: RetroColors.foreground,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          singer.genre.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: RetroColors.surface,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Info table
                      _buildInfoRow(
                        'Nationality',
                        singer.nationality,
                      ),
                      if (singer.birthDate != null)
                        _buildInfoRow(
                          'Born',
                          singer.birthDate!,
                        ),
                      if (singer.activeSince != null)
                        _buildInfoRow(
                          'Active Since',
                          singer.activeSince!,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              '$label:',
              style: RetroTextStyles.body().copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: RetroTextStyles.body().copyWith(
                fontFamily: 'Courier New',
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ═══════════════════════════════════════════
  //  BIOGRAPHY SECTION
  // ═══════════════════════════════════════════
  Widget _buildBiographySection(Singer singer) {
    return RetroWindow(
      title: 'BIOGRAPHY',
      contentColor: RetroColors.panelYellow,
      child: Text(
        singer.biography,
        textAlign: TextAlign.justify,
        style: RetroTextStyles.body(),
      ),
    );
  }

  // ═══════════════════════════════════════════
  //  SONGS SECTION
  // ═══════════════════════════════════════════
  Widget _buildSongsSection(Singer singer) {
    return Container(
      decoration: RetroBevel.outsetDeep(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Title bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [RetroColors.titleBar, RetroColors.titleBarEnd],
              ),
            ),
            child: const Row(
              children: [
                Text('POPULAR SONGS', style: RetroTextStyles.titleBar),
                Spacer(),
                RetroBlinkBadge(
                  label: 'NEW!',
                  color: RetroColors.secondary,
                ),
              ],
            ),
          ),
          // Songs list (table style with alternating rows)
          Container(
            decoration: RetroBevel.inset(color: RetroColors.surface),
            child: Column(
              children: [
                // Header row
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: const BoxDecoration(
                    color: RetroColors.background,
                    border: Border(
                      bottom: BorderSide(
                        color: RetroColors.borderDark,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: Text(
                          '#',
                          style: RetroTextStyles.label(),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'SONG TITLE',
                          style: RetroTextStyles.label(),
                        ),
                      ),
                      Text(
                        'STATUS',
                        style: RetroTextStyles.label(),
                      ),
                    ],
                  ),
                ),
                // Song rows
                for (int i = 0; i < singer.popularSongs.length; i++)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: i.isEven
                          ? RetroColors.surface
                          : RetroColors.surfaceAlt,
                      border: const Border(
                        bottom: BorderSide(
                          color: RetroColors.borderDark,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 30,
                          child: Text(
                            '${i + 1}.',
                            style: RetroTextStyles.mono(
                              color: RetroColors.muted,
                            ).copyWith(fontSize: 12),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                '♫ ',
                                style: TextStyle(
                                  color: RetroColors.accent,
                                  fontSize: 14,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  singer.popularSongs[i],
                                  style: RetroTextStyles.body().copyWith(
                                    color: RetroColors.accent,
                                    decoration: TextDecoration.underline,
                                    decorationColor: RetroColors.accent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 1,
                          ),
                          decoration: BoxDecoration(
                            color: i == 0
                                ? RetroColors.secondary
                                : RetroColors.successDark,
                            border: Border.all(
                              color: RetroColors.foreground,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            i == 0 ? 'TOP HIT' : 'POPULAR',
                            style: const TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              color: RetroColors.surface,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ═══════════════════════════════════════════
  //  STATS SECTION (Hit Counter style)
  // ═══════════════════════════════════════════
  Widget _buildStatsSection(Singer singer) {
    return Container(
      decoration: RetroBevel.inset(color: RetroColors.foreground),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Text(
            '═══ ${singer.name.toUpperCase()} STATS ═══',
            style: RetroTextStyles.mono(color: RetroColors.success).copyWith(
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatItem(
                'SONGS',
                singer.popularSongs.length.toString(),
              ),
              _buildStatItem(
                'GENRE',
                singer.genre.split('/').first.trim(),
              ),
              _buildStatItem(
                'STATUS',
                singer.isFavorite ? 'FAV ♥' : '---',
                color: singer.isFavorite
                    ? RetroColors.secondary
                    : RetroColors.muted,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '[ Page views: ${(singer.name.hashCode.abs() % 9999 + 1000).toString().padLeft(5, '0')} ]',
            style: RetroTextStyles.mono(color: RetroColors.tertiary).copyWith(
              fontSize: 11,
            ),
          ),
          Text(
            'Last updated: 1997 | Best viewed in 800x600',
            style: RetroTextStyles.mono(color: RetroColors.muted).copyWith(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, {Color? color}) {
    return Column(
      children: [
        Text(
          label,
          style: RetroTextStyles.mono(color: RetroColors.muted).copyWith(
            fontSize: 10,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: RetroTextStyles.mono(
            color: color ?? RetroColors.success,
          ).copyWith(fontSize: 16),
        ),
      ],
    );
  }

  // ═══════════════════════════════════════════
  //  HELPERS
  // ═══════════════════════════════════════════
  Widget _buildTitleBarButton(String symbol) {
    return Container(
      width: 18,
      height: 18,
      decoration: RetroBevel.outset(),
      child: Center(
        child: Text(
          symbol,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: RetroColors.foreground,
            height: 1.0,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String label, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: RetroColors.foreground,
          ),
        ),
      ),
    );
  }
}
