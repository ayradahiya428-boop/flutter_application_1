import 'package:flutter/material.dart';

void main() {
  runApp(const KasirPesantrenApp());
}

class KasirPesantrenApp extends StatelessWidget {
  const KasirPesantrenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kasir Pesantren',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ), // Nuansa hijau pesantren
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kasir Pesantren - PP Nurul_Falah"),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Daftar Belanja Santri",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          _itemProduk("Kitab Kuning", 50000),
          _itemProduk("Sarung Wadimor", 65000),
          _itemProduk("Peci Hitam", 25000),
          _itemProduk("Sajadah", 45000),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Fitur pembayaran segera hadir!")),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[700],
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            child: const Text(
              "Proses Pembayaran",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemProduk(String nama, int harga) {
    return ListTile(
      leading: const Icon(Icons.shopping_cart_checkout, color: Colors.green),
      title: Text(nama),
      subtitle: Text("Rp $harga"),
      trailing: const Icon(Icons.add_circle, color: Colors.green),
    );
  }
}
