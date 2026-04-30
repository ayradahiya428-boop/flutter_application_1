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
      length: 2, // Dua Tab: Santri dan Pengurus
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          foregroundColor: Colors.white,
          title: const Text("Manajemen Pesantren"),
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.group), text: "Data Santri"),
              Tab(
                icon: Icon(Icons.admin_panel_settings),
                text: "Data Pengurus",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            HalamanData(tipe: "Santri"),
            HalamanData(tipe: "Pengurus"),
          ],
        ),
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

class _HalamanDataState extends State<HalamanData> {
  // Data Awal
  final List<Map<String, String>> listData = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

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
                      backgroundColor: widget.tipe == "Santri"
                          ? Colors.green
                          : Colors.blue,
                      child: const Icon(Icons.person, color: Colors.white),
                    ),
                    title: Text(listData[index]['nama']!),
                    subtitle: Text(
                      widget.tipe == "Santri"
                          ? "Kamar: ${listData[index]['detail']}"
                          : "Jabatan: ${listData[index]['detail']}",
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Tambah ${widget.tipe}"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Nama Lengkap"),
            ),
            TextField(
              controller: detailController,
              decoration: InputDecoration(
                labelText: widget.tipe == "Santri" ? "Nama Kamar" : "Jabatan",
              ),
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
