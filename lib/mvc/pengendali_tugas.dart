import '../data/repositori_tugas.dart';
import '../model/tugas.dart';

class PengendaliTugas {
  PengendaliTugas(this._repo);

  final RepositoriTugas _repo;
  String? _galat;
  bool _filter = false;

  List<Tugas> get daftar => _repo.daftar;
  String? get galat => _galat;
  bool get filter => _filter;
  List<Tugas> get daftarTampil =>
    _filter ? _repo.daftar.where((t) => !t.selesai).toList() : _repo.daftar;
  int get total => _repo.daftar.length;
  int get jumlahSelesai => daftar.where((tugas) => tugas.selesai).length;

  bool tambah(String input) {
    _galat = validasiJudul(input);
    if (_galat != null) return false;
    _repo.tambah(input.trim());
    return true;
  }

  void ubahStatus(int id) => _repo.ubahStatus(id);
  void ubahFilter(bool v) => _filter = v;
}
