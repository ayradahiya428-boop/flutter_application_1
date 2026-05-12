import 'package:flutter/material.dart';

class AkademikPage extends StatelessWidget {
  const AkademikPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Akademik"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          _buildActionCard(context, "Input Data Santri", "Biodata santri baru",
              Icons.person_add_alt_1),
          _buildActionCard(
              context, "Jadwal", "Agenda harian", Icons.calendar_today),
        ],
      ),
    );
  }

  Widget _buildActionCard(
      BuildContext context, String title, String desc, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        contentPadding: const EdgeInsets.all(15),
        leading: CircleAvatar(
            backgroundColor: Colors.green[50],
            child: Icon(icon, color: Colors.green)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(desc),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          if (title == "Input Data Santri") {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const FormSantriPage()));
          }
        },
      ),
    );
  }
}

class FormSantriPage extends StatelessWidget {
  const FormSantriPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Formulir Santri")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
                decoration: InputDecoration(
                    labelText: "Nama Lengkap",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)))),
            const SizedBox(height: 20),
            TextField(
                decoration: InputDecoration(
                    labelText: "Alamat Asal",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)))),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 55)),
              onPressed: () => Navigator.pop(context),
              child: const Text("SIMPAN DATA"),
            )
          ],
        ),
      ),
    );
  }
}
