import 'package:flutter/foundation.dart';

import '../data/repositori_tugas.dart';
import '../model/tugas.dart';

class TugasViewModel extends ChangeNotifier {
  TugasViewModel(this._repo);

  final RepositoriTugas _repo;
  String? _galat;

  List<Tugas> get daftar => _repo.daftar;
  String? get galat => _galat;
  int get jumlahSelesai => daftar.where((tugas) => tugas.selesai).length;

  bool tambah(String input) {
    _galat = validasiJudul(input);
    final berhasil = _galat == null;
    if (berhasil) _repo.tambah(input.trim());
    notifyListeners();
    return berhasil;
  }

  bool _filter = false;
  bool get filter => _filter;
  List<Tugas> get daftarTampil =>
    _filter ? _repo.daftar.where((t) => !t.selesai).toList() : _repo.daftar;
  int get total => _repo.daftar.length;

  void ubahFilter(bool v) {
  _filter = v;
  notifyListeners();
}

  void ubahStatus(int id) {
    _repo.ubahStatus(id);
    notifyListeners();
  }
}
