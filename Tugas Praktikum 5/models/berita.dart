class Berita {
  final int id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String content;
  bool isBookmarked;

  Berita({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.content,
    this.isBookmarked = false,
  });
}