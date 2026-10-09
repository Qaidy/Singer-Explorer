import 'package:flutter/material.dart';
import '../data/singers.dart';
import '../models/singer.dart';
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
      MaterialPageRoute(
        builder: (context) => DetailPage(
          singer: singer,
          onFavoriteToggle: () {
            setState(() {});
          },
        ),
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final displayedSingers = _showOnlyFavorites
        ? _singers.where((singer) => singer.isFavorite).toList()
        : _singers;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          "Singer Explorer",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          tooltip: 'Back',
          onPressed: () {
            if (_showOnlyFavorites) {
              setState(() {
                _showOnlyFavorites = false;
              });
            } else if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              _showOnlyFavorites ? Icons.favorite : Icons.favorite_border,
              color: _showOnlyFavorites ? Colors.redAccent : null,
            ),
            tooltip: _showOnlyFavorites
                ? 'Show all singers'
                : 'Filter favorites',
            onPressed: () {
              setState(() {
                _showOnlyFavorites = !_showOnlyFavorites;
              });
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: displayedSingers.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 64,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "No favorite singers yet",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Tap the heart icon on any singer to add them to your favorites.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: displayedSingers.length,
              itemBuilder: (context, index) {
                final singer = displayedSingers[index];
                return SingerCard(
                  singer: singer,
                  onTap: () => _openDetail(singer),
                  onFavoriteToggle: () => _toggleFavorite(singer),
                );
              },
            ),
    );
  }
}
