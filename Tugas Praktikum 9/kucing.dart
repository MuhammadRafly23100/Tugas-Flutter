import 'hewan.dart';

class Kucing extends Hewan {
  String warnaBulu;

  Kucing(String nama, double berat, this.warnaBulu) : super(nama, berat);

  @override
  String makan(Hewan hewan, double porsi) {
    hewan.berat += 1; // Increase weight by 1kg when eating
    return('Kucing ${hewan.nama} sedang makan sebanyak $porsi gram. Beratnya menjadi ${hewan.berat} kg.');
  }

  String lari(Hewan hewan) {
    hewan.berat -= 0.5; // Decrease weight by 0.5kg when running
    return('Kucing ${hewan.nama} sedang berlari. Beratnya menjadi ${hewan.berat} kg.');
  }
}
