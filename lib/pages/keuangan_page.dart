import 'package:flutter/material.dart';

class KeuanganPage extends StatelessWidget {
  const KeuanganPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keuangan Pesantren"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- Info Bendahara ---
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green[700],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.green, size: 35),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Bendahara Utama:",
                          style:
                              TextStyle(color: Colors.white70, fontSize: 14)),
                      Text("Ach Fauzi",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),

            // --- Ringkasan Saldo ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _buildSummaryCard("Pemasukan", "Rp 15.200.000", Colors.blue),
                  const SizedBox(width: 10),
                  _buildSummaryCard(
                      "Pengeluaran", "Rp 4.500.000", Colors.orange),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // --- Daftar Transaksi Terakhir ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Transaksi Terakhir",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("Lihat Semua",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            const SizedBox(height: 10),

            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildTransactionItem("Sumbangan Donatur", "12 Mei 2026",
                    "+ Rp 2.000.000", Colors.green),
                _buildTransactionItem("Pembayaran SPP - Irfan", "11 Mei 2026",
                    "+ Rp 500.000", Colors.green),
                _buildTransactionItem("Listrik & Air", "10 Mei 2026",
                    "- Rp 1.200.000", Colors.red),
                _buildTransactionItem("Beli Kitab Kuning", "09 Mei 2026",
                    "- Rp 3.000.000", Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String title, String amount, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(color: color, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(amount,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem(
      String title, String date, String amount, Color color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.1),
        child: Icon(
            amount.contains('+') ? Icons.arrow_downward : Icons.arrow_upward,
            color: color,
            size: 20),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(date),
      trailing: Text(amount,
          style: TextStyle(color: color, fontWeight: FontWeight.bold)),
    );
  }
}
