class Singer {
  final String name;
  final String image;
  final String genre;
  final String nationality;
  final String? birthDate;
  final String? activeSince;
  final String biography;
  final List<String> popularSongs;
  bool isFavorite;

  Singer({
    required this.name,
    required this.image,
    required this.genre,
    required this.nationality,
    this.birthDate,
    this.activeSince,
    required this.biography,
    required this.popularSongs,
    this.isFavorite = false,
  });
}
