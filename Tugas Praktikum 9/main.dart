import 'package:flutter/material.dart';
import 'kucing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Kucing kucing1;

  @override
  void initState() {
    super.initState();
    kucing1 = Kucing('Mimi', 4.5, 'Coklat');
  }

  @override
  Widget build(BuildContext context) {
    String pesanBerat = 'Berat kucing ${kucing1.nama}\nSekarang adalah ${kucing1.berat.toStringAsFixed(2)} kg\nWarna bulu: ${kucing1.warnaBulu}';

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cats'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                pesanBerat,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    kucing1.makan(kucing1, 200); // Porsi makan 200 gram
                  });
                },
                child: Text('Makan'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    kucing1.lari(kucing1);
                  });
                },
                child: Text('Lari'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
