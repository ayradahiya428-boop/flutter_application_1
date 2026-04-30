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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Blueprint Logika: Variabel untuk menyimpan total belanja
  int totalBelanja = 0;

  void tambahKeKeranjang(int harga) {
    setState(() {
      totalBelanja += harga;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kasir Pesantren - UAS Irfan"),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
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
              ],
            ),
          ),
          // Blueprint UI: Menampilkan Total di bagian bawah
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey.shade300, blurRadius: 10),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Bayar:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Rp $totalBelanja",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Konfirmasi Bayar"),
                          content: Text(
                            "Total yang harus dibayar: Rp $totalBelanja",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("OK"),
                            ),
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700],
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Proses Pembayaran"),
                  ),
                ),
              ],
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
      trailing: IconButton(
        icon: const Icon(Icons.add_circle, color: Colors.green),
        onPressed: () => tambahKeKeranjang(harga),
      ),
    );
  }
}
