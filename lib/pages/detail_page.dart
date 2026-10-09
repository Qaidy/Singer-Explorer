import 'package:flutter/material.dart';
import '../models/singer.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          singer.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              singer.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: singer.isFavorite ? Colors.redAccent : null,
            ),
            tooltip: singer.isFavorite
                ? 'Remove from favorites'
                : 'Add to favorites',
            onPressed: _toggleFavorite,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Image
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Hero(
                  tag: 'singer-image-${singer.name}',
                  child: Image.asset(
                    singer.image,
                    width: double.infinity,
                    height: 280,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // Information Card
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 6.0,
              ),
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black12.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black12, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Singer Name & Heart Toggle
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          singer.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          singer.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: singer.isFavorite
                              ? Colors.redAccent
                              : Colors.grey.shade600,
                        ),
                        onPressed: _toggleFavorite,
                        tooltip: singer.isFavorite
                            ? 'Remove from favorites'
                            : 'Add to favorites',
                      ),
                    ],
                  ),

                  // Genre pill
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    margin: const EdgeInsets.only(top: 4, bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        width: 1,
                        color: Colors.blueAccent,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Text(
                      singer.genre,
                      style: const TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),

                  // Birth Date
                  if (singer.birthDate != null) ...[
                    Text(
                      "Birth Date : ${singer.birthDate}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],

                  // Nationality
                  Text(
                    "Nationality : ${singer.nationality}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Active Since
                  if (singer.activeSince != null) ...[
                    Text(
                      "Active Since : ${singer.activeSince}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],

                  const SizedBox(height: 4),

                  // Biography
                  const Text(
                    "Biography",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    singer.biography,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.45,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Popular Songs Section
                  const Text(
                    "Popular Songs",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Songs list inspired by Pokémon Skills section
                  for (final song in singer.popularSongs)
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black12,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.amber,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              song,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
