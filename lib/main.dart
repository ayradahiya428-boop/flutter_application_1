import 'package:flutter/material.dart';

void main() {
  runApp(const SistemPesantrenApp());
}

class SistemPesantrenApp extends StatelessWidget {
  const SistemPesantrenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const PesantrenHomePage(),
    );
  }
}

class PesantrenHomePage extends StatelessWidget {
  const PesantrenHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          foregroundColor: Colors.white,
          toolbarHeight: 120, // Menambah tinggi agar muat logo & teks besar
          centerTitle: true, // Membuat judul ke tengah
          title: Column(
            children: [
              // MENAMBAHKAN LOGO DARI URL
              Image.network(
                'https://penerimaan.nurulfalahpusat.com/assets/img/logo.png', // URL Logo Nurul Falah
                height: 60,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.school, size: 50),
              ),
              const SizedBox(height: 8),
              // MEMPERBESAR NAMA SISTEM
              const Text(
                "NURUL FALAH PUSAT",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            isScrollable: true,
            tabs: [
              Tab(icon: Icon(Icons.group), text: "Santri"),
              Tab(icon: Icon(Icons.admin_panel_settings), text: "Pengurus"),
              Tab(icon: Icon(Icons.inventory), text: "Inventaris"),
              Tab(icon: Icon(Icons.person_pin), text: "Profil"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            HalamanData(tipe: "Santri"),
            HalamanData(tipe: "Pengurus"),
            HalamanData(tipe: "Inventaris"),
            HalamanProfil(),
          ],
        ),
      ),
    );
  }
}

// Halaman Profil Irfan Mansyur
class HalamanProfil extends StatelessWidget {
  const HalamanProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.green,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 20),
          const Card(
            child: ListTile(
              title: Text("Nama Pengembang"),
              subtitle: Text("Irfan Mansyur"),
            ),
          ),
          const Card(
            child: ListTile(title: Text("NPM"), subtitle: Text("20241220123")),
          ),
          const Card(
            child: ListTile(
              title: Text("Program Studi"),
              subtitle: Text("Teknik Informatika"),
            ),
          ),
        ],
      ),
    );
  }
}

class HalamanData extends StatefulWidget {
  final String tipe;
  const HalamanData({super.key, required this.tipe});

  @override
  State<HalamanData> createState() => _HalamanDataState();
}

class _HalamanDataState extends State<HalamanData>
    with AutomaticKeepAliveClientMixin {
  final List<Map<String, String>> listData = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  @override
  bool get wantKeepAlive => true;

  void tambahData() {
    if (nameController.text.isNotEmpty && detailController.text.isNotEmpty) {
      setState(() {
        listData.add({
          "nama": nameController.text,
          "detail": detailController.text,
        });
      });
      nameController.clear();
      detailController.clear();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    String labelDetail = widget.tipe == "Santri"
        ? "Kamar"
        : (widget.tipe == "Pengurus" ? "Jabatan" : "Jumlah/Kondisi");
    IconData iconUtama = widget.tipe == "Santri"
        ? Icons.person
        : (widget.tipe == "Pengurus"
              ? Icons.admin_panel_settings
              : Icons.inventory_2);
    Color warnaTema = widget.tipe == "Santri"
        ? Colors.green
        : (widget.tipe == "Pengurus" ? Colors.blue : Colors.orange);

    return Scaffold(
      body: listData.isEmpty
          ? Center(child: Text("Belum ada data ${widget.tipe}"))
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: listData.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: warnaTema,
                      child: Icon(iconUtama, color: Colors.white),
                    ),
                    title: Text(
                      listData[index]['nama']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "$labelDetail: ${listData[index]['detail']}",
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(labelDetail),
        backgroundColor: Colors.green[800],
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _showAddDialog(String labelDetail) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Tambah ${widget.tipe}"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: widget.tipe == "Inventaris"
                    ? "Nama Barang"
                    : "Nama Lengkap",
              ),
            ),
            TextField(
              controller: detailController,
              decoration: InputDecoration(labelText: labelDetail),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          ElevatedButton(onPressed: tambahData, child: const Text("Simpan")),
        ],
      ),
    );
  }
}
