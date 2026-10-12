import 'package:flutter/material.dart';
import '../data/singers.dart';
import '../models/singer.dart';
import '../theme/retro_theme.dart';
import '../widgets/singer_card.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Singer> _singers = List.from(initialSingersData);
  bool _showOnlyFavorites = false;

  void _toggleFavorite(Singer singer) {
    setState(() {
      singer.isFavorite = !singer.isFavorite;
    });
  }

  void _openDetail(Singer singer) async {
    await Navigator.push(
      context,
      // No fancy transitions — instant page change, very 90s
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => DetailPage(
          singer: singer,
          onFavoriteToggle: () {
            setState(() {});
          },
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
        transitionDuration: Duration.zero,
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final displayedSingers = _showOnlyFavorites
        ? _singers.where((singer) => singer.isFavorite).toList()
        : _singers;

    final favCount = _singers.where((s) => s.isFavorite).length;

    return Scaffold(
      backgroundColor: RetroColors.background,
      body: RetroBackground(
        child: Column(
          children: [
            // ═══ WINDOW FRAME (outer bevel) ═══
            SafeArea(
              bottom: false,
              child: Container(
                margin: const EdgeInsets.fromLTRB(4, 4, 4, 0),
                decoration: RetroBevel.outsetDeep(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                          const Expanded(
                            child: Text(
                              'Singer Explorer',
                              style: RetroTextStyles.titleBar,
                            ),
                          ),
                          // Minimize button
                          _buildTitleBarButton('_'),
                          const SizedBox(width: 2),
                          // Maximize button
                          _buildTitleBarButton('□'),
                          const SizedBox(width: 2),
                          // Close button
                          _buildTitleBarButton('×'),
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
                          _buildMenuBarItem(
                            'File',
                            onTap: () {},
                          ),
                          _buildMenuBarItem(
                            _showOnlyFavorites ? '♥ Favorites' : 'View',
                            onTap: () {
                              setState(() {
                                _showOnlyFavorites = !_showOnlyFavorites;
                              });
                            },
                          ),
                          _buildMenuBarItem('Help', onTap: () {}),
                          const Spacer(),
                          if (_showOnlyFavorites)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 1,
                              ),
                              decoration: BoxDecoration(
                                color: RetroColors.secondary,
                                border: Border.all(
                                  color: RetroColors.foreground,
                                  width: 1,
                                ),
                              ),
                              child: const Text(
                                'FAVORITES MODE',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: RetroColors.surface,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),

                    const RetroGrooveHR(),
                  ],
                ),
              ),
            ),

            // ═══ MARQUEE BANNER ═══
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: RetroBevel.inset(color: RetroColors.titleBar),
              child: RetroMarquee(
                backgroundColor: RetroColors.titleBar,
                children: [
                  TextSpan(
                    text: '   ★ WELCOME TO SINGER EXPLORER ★   ',
                    style: RetroTextStyles.mono(color: RetroColors.tertiary),
                  ),
                  TextSpan(
                    text: '   ♫ Browse your favorite artists ♫   ',
                    style: RetroTextStyles.mono(color: RetroColors.success),
                  ),
                  TextSpan(
                    text: '   ★ Click any singer for details ★   ',
                    style: RetroTextStyles.mono(color: RetroColors.cyan),
                  ),
                  TextSpan(
                    text: '   ♥ ${_singers.length} artists in the database ♥   ',
                    style: RetroTextStyles.mono(color: RetroColors.hotPink),
                  ),
                ],
              ),
            ),

            // ═══ CONTENT AREA ═══
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                decoration: RetroBevel.inset(color: RetroColors.surface),
                child: displayedSingers.isEmpty
                    ? _buildEmptyState()
                    : _buildSingerList(displayedSingers),
              ),
            ),

            // ═══ STATUS BAR ═══
            Container(
              margin: const EdgeInsets.fromLTRB(4, 0, 4, 4),
              child: Container(
                decoration: RetroBevel.outsetDeep(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 2,
                ),
                child: Row(
                  children: [
                    // Status text
                    Expanded(
                      child: Container(
                        decoration: RetroBevel.inset(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        child: Text(
                          _showOnlyFavorites
                              ? 'Showing $favCount favorite(s)'
                              : '${displayedSingers.length} singer(s) loaded',
                          style: RetroTextStyles.small(
                            color: RetroColors.foreground,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 2),
                    // Hit counter
                    Container(
                      decoration: RetroBevel.inset(
                        color: RetroColors.foreground,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      child: Text(
                        'HITS: ${(1997 + _singers.length * 42).toString().padLeft(5, '0')}',
                        style: RetroTextStyles.mono(
                          color: RetroColors.success,
                        ).copyWith(fontSize: 11),
                      ),
                    ),
                    const SizedBox(width: 2),
                    // Favorites count
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
                            '♥ ',
                            style: TextStyle(
                              fontSize: 12,
                              color: favCount > 0
                                  ? RetroColors.secondary
                                  : RetroColors.muted,
                            ),
                          ),
                          Text(
                            '$favCount',
                            style: RetroTextStyles.small(
                              color: RetroColors.foreground,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleBarButton(String symbol) {
    return GestureDetector(
      child: Container(
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
      ),
    );
  }

  Widget _buildMenuBarItem(String label, {required VoidCallback onTap}) {
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

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: RetroBevel.outset(),
            child: Column(
              children: [
                const Text(
                  '♥',
                  style: TextStyle(
                    fontSize: 48,
                    color: RetroColors.muted,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'NO FAVORITE SINGERS YET',
                  style: RetroTextStyles.h3(),
                ),
                const SizedBox(height: 8),
                Text(
                  'Click the heart icon on any singer\nto add them to your favorites.',
                  textAlign: TextAlign.center,
                  style: RetroTextStyles.body(color: RetroColors.muted),
                ),
                const SizedBox(height: 16),
                RetroButton(
                  label: 'Show All',
                  icon: Icons.list,
                  onPressed: () {
                    setState(() {
                      _showOnlyFavorites = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSingerList(List<Singer> singers) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Column headers (table style)
        Container(
          decoration: const BoxDecoration(
            color: RetroColors.background,
            border: Border(
              bottom: BorderSide(color: RetroColors.borderDark, width: 2),
            ),
          ),
          child: Row(
            children: [
              _buildColumnHeader('', width: 60),
              _buildColumnHeader('NAME', flex: 3),
              _buildColumnHeader('GENRE', flex: 2),
              _buildColumnHeader('♥', width: 48),
            ],
          ),
        ),
        // Singer list
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: singers.length,
            itemBuilder: (context, index) {
              final singer = singers[index];
              return SingerCard(
                singer: singer,
                index: index,
                onTap: () => _openDetail(singer),
                onFavoriteToggle: () => _toggleFavorite(singer),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildColumnHeader(String label, {double? width, int? flex}) {
    final child = Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: RetroColors.borderDark.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
      ),
      child: Text(
        label,
        style: RetroTextStyles.label(),
        maxLines: 1,
      ),
    );

    if (flex != null) {
      return Expanded(flex: flex, child: child);
    }
    return child;
  }
}
