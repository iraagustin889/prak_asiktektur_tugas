import 'package:flutter/material.dart';
import '../data/repositori_tugas.dart';
import '../ui/panel_tugas.dart';
import 'pengendali_tugas.dart';
class LayarMvc extends StatefulWidget {
  const LayarMvc({super.key});
  @override
  State<LayarMvc> createState() => _LayarMvcState();
}
class _LayarMvcState extends State<LayarMvc> {
  final _pengendali = PengendaliTugas(RepositoriTugas());
  bool _tambah(String input) {
    final berhasil = _pengendali.tambah(input);
    setState(() {});
    return berhasil;
  }
  void _ubahStatus(int id) {
    setState(() => _pengendali.ubahStatus(id));
  }

  void ubahFilter(bool v) => setState(() => _pengendali.ubahFilter(v));

  @override
  Widget build(BuildContext context) => PanelTugas(
    judul: 'Daftar Tugas · MVC',
    daftar: _pengendali.daftarTampil,
    total: _pengendali.total,         // <-- tambah
    filter: _pengendali.filter,       // <-- tambah
    onFilter: ubahFilter,
    jumlahSelesai: _pengendali.jumlahSelesai,
    galat: _pengendali.galat,
    onTambah: _tambah,
    onUbahStatus: _ubahStatus,
  );

}
