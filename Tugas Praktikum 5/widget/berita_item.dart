import 'package:flutter/material.dart';
import '../models/berita.dart';

class BeritaItem extends StatelessWidget {
  final Berita berita;
  final VoidCallback onTap;
  final VoidCallback onBookmarkTap;

  const BeritaItem({
    Key? key,
    required this.berita,
    required this.onTap,
    required this.onBookmarkTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Leading - Thumbnail Gambar
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.network(
                berita.imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.image_not_supported,
                      size: 50,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title - Judul Berita
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          berita.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Trailing - Ikon Bookmark
                      IconButton(
                        icon: Icon(
                          berita.isBookmarked
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          color: berita.isBookmarked
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        onPressed: onBookmarkTap,
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Subtitle - Deskripsi Singkat
                  Text(
                    berita.subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}