import 'package:flutter/material.dart';
import '../models/berita.dart';
import '../widget/berita_item.dart';

final List<Berita> beritaList = [
  Berita(
    id: 1,
    title: 'Bigetron by Vitality Resmi Juara IKL Fall 2025 Pertamanya',
    subtitle: 'Bigetron by Vitality berhasil menjuarai Indonesia Kings League (IKL) Fall 2025 untuk pertama kalinya dalam sejarah mereka.',
    imageUrl: 'https://akcdn.detik.net.id/community/media/visual/2025/10/06/bigetron-juara-ikl-fall-2025-lolos-ke-kejuaraan-dunia-honor-of-kings-kic-2025-1759728237610_169.jpeg?w=700&q=90',
    content: 'Bigetron by Vitality akhirnya menorehkan prestasi gemilang dengan menjuarai Indonesia Kings League (IKL) Fall 2025. Kemenangan ini merupakan yang pertama kalinya bagi tim besutan Team Vitality ini.\n\n'
        'Dalam pertandingan final yang berlangsung sengit, Bigetron by Vitality berhasil mengalahkan lawannya dengan skor telak. Strategi matang dan koordinasi tim yang solid menjadi kunci kesuksesan mereka.\n\n'
        'Para pemain menunjukkan performa terbaik mereka sepanjang turnamen, dengan konsistensi yang luar biasa dari babak penyisihan hingga grand final.\n\n'
        'Kemenangan ini semakin memantapkan posisi Bigetron by Vitality sebagai salah satu tim esports terkuat di Indonesia.',
  ),
  Berita(
    id: 2,
    title: 'Bigetron Red Aliens Menjadi Juara PMCO 2018',
    subtitle: 'Bigetron Red Aliens berhasil menjuarai turnamen PUBG Mobile',
    imageUrl: 'https://akcdn.detik.net.id/visual/2019/12/02/2ec44cc6-51c3-4605-8320-72351a8ba66f_169.png?w=900&q=80',
    content: 'Kemenangan Bigetron Red Aliens di ajang PMCO Fall Split Global Finals 2019 merupakan sebuah deklarasi dominasi mutlak di panggung dunia. Tampil dengan gaya bermain "bar-bar" yang khas dan rotasi tak terduga, skuad yang digawangi si kembar Zuxxy-Luxxy, Ryzen, dan Microboy ini mengguncang skena kompetitif global. Mereka tidak hanya menang, tetapi menghancurkan lobi yang diisi oleh tim-tim terbaik dari seluruh dunia, bahkan berhasil mengunci gelar juara dunia sebelum ronde terakhir dimainkan. Momen tersebut menjadi penegasan bahwa tim asal Indonesia telah tiba dan siap menjadi raja baru di panggung PUBG Mobile.\n\n'
        'Gelar juara dunia PMCO tersebut lebih dari sekadar trofi; itu adalah momen bersejarah yang mengibarkan bendera Merah Putih di puncak tertinggi kancah esports global. Kemenangan Bigetron RA menjadi titik balik, membuktikan bahwa talenta dari Indonesia mampu bersaing dan menjadi yang terbaik di level internasional. Keberhasilan mereka sontak menjadi inspirasi bagi jutaan anak muda di tanah air dan menempatkan Indonesia secara permanen di dalam peta kekuatan esports dunia, mengawali era Bigetron sebagai salah satu tim paling disegani dalam sejarah.\n\n',
        
  ),
  Berita(
    id: 3,
    title: 'Inonesia vs Bahrain',
    subtitle: 'Indonesia Menang 6-0 atas Bahrain',
    imageUrl: 'https://akcdn.detik.net.id/visual/2025/03/26/presiden-ri-prabowo-menonton-langsung-pertandingan-timnas-indonesia-vs-bahrain-instagramprabowo-1742951384064_169.png?w=900&q=80',
    content: 'Denga taktik gemilang dari sang pelatih\n\n'
        
  ),
  
];

class BeritaDetailScreen extends StatelessWidget {
  final Berita berita;

   const BeritaDetailScreen({
    Key? key,
    required this.berita,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Berita'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Header
            Image.network(
              berita.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.image_not_supported,
                    size: 50,
                    color: Colors.grey,
                  ),
                );
              },
            ),
            
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul
                  Text(
                    berita.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Subtitle
                  Text(
                    berita.subtitle,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  const Divider(),
                  
                  const SizedBox(height: 16),
                  
                  // Konten Lengkap (Custom per berita)
                  Text(
                    berita.content,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BeritaListScreen extends StatefulWidget {
  const BeritaListScreen({Key? key}) : super(key: key);

  @override
  State<BeritaListScreen> createState() => _BeritaListScreenState();
}

class _BeritaListScreenState extends State<BeritaListScreen> {
  void toggleBookmark(int id) {
    setState(() {
      final berita = beritaList.firstWhere((berita) => berita.id == id);
      berita.isBookmarked = !berita.isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita Kita'),
      ),
      body: ListView.builder(
        itemCount: beritaList.length,
        itemBuilder: (context, index) {
          final berita = beritaList[index];
          return BeritaItem(
            berita: berita,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BeritaDetailScreen(berita: berita),
                ),
              );
            },
            onBookmarkTap: () => toggleBookmark(berita.id),
          );
        },
      ),
    );
  }
}