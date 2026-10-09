import 'package:flutter/material.dart';
import '../models/singer.dart';

class SingerCard extends StatelessWidget {
  final Singer singer;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  const SingerCard({
    super.key,
    required this.singer,
    required this.onTap,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: Hero(
                  tag: 'singer-image-${singer.name}',
                  child: Image.asset(
                    singer.image,
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      singer.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(
                          color: Colors.blueAccent.withValues(alpha: 0.4),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        singer.genre,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  singer.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color:
                      singer.isFavorite ? Colors.redAccent : Colors.grey.shade500,
                ),
                onPressed: onFavoriteToggle,
                tooltip: singer.isFavorite
                    ? 'Remove from favorites'
                    : 'Add to favorites',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
