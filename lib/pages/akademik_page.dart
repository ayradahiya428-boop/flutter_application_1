import 'package:flutter/material.dart';

// --- 1. MODEL DATA (NAMA, ASRAMA, ALAMAT, BAPAK, IBU) ---
class Santri {
  final String nama;
  final String asrama;
  final String alamat;
  final String namaBapak;
  final String namaIbu;

  Santri({
    required this.nama,
    required this.asrama,
    required this.alamat,
    required this.namaBapak,
    required this.namaIbu,
  });
}

// --- 2. LIST GLOBAL ---
List<Santri> daftarSantriGlobal = [];

// --- 3. HALAMAN UTAMA AKADEMIK ---
class AkademikPage extends StatefulWidget {
  const AkademikPage({super.key});

  @override
  State<AkademikPage> createState() => _AkademikPageState();
}

class _AkademikPageState extends State<AkademikPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Akademik Pesantren",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green[700],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.person_add_alt_1,
                  color: Colors.blue,
                  size: 30,
                ),
                title: const Text(
                  "Input Data Santri",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("Tambah biodata santri baru"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FormInputSantri(),
                    ),
                  );
                  setState(() {});
                },
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "Daftar Santri Terdaftar",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            daftarSantriGlobal.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "Belum ada data santri.",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: daftarSantriGlobal.length,
                    itemBuilder: (context, index) {
                      final santri = daftarSantriGlobal[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          title: Text(
                            santri.nama,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Asrama: ${santri.asrama}"),
                              Text(
                                "Ortu: ${santri.namaBapak} & ${santri.namaIbu}",
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

// --- 4. HALAMAN FORM INPUT ---
class FormInputSantri extends StatefulWidget {
  const FormInputSantri({super.key});

  @override
  State<FormInputSantri> createState() => _FormInputSantriState();
}

class _FormInputSantriState extends State<FormInputSantri> {
  final _namaController = TextEditingController();
  final _asramaController = TextEditingController();
  final _alamatController = TextEditingController();
  final _bapakController = TextEditingController();
  final _ibuController = TextEditingController();

  void _simpanData() {
    if (_namaController.text.isNotEmpty && _asramaController.text.isNotEmpty) {
      daftarSantriGlobal.add(
        Santri(
          nama: _namaController.text,
          asrama: _asramaController.text,
          alamat: _alamatController.text,
          namaBapak: _bapakController.text,
          namaIbu: _ibuController.text,
        ),
      );

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Nama dan Asrama wajib diisi!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Data Santri"),
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: "Nama Lengkap Santri",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _asramaController,
              decoration: const InputDecoration(
                labelText: "Asrama",
                prefixIcon: Icon(Icons.home),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _alamatController,
              decoration: const InputDecoration(
                labelText: "Alamat",
                prefixIcon: Icon(Icons.location_on),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _bapakController,
              decoration: const InputDecoration(
                labelText: "Nama Bapak",
                prefixIcon: Icon(Icons.man),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _ibuController,
              decoration: const InputDecoration(
                labelText: "Nama Ibu",
                prefixIcon: Icon(Icons.woman),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: _simpanData,
              child: const Text(
                "SIMPAN DATA SANTRI",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
