import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistem Pesantren Nurul Falah',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
        fontFamily: 'sans-serif',
      ),
      home: const SplashScreen(),
    );
  }
}

// --- 1. SPLASH SCREEN (Tampilan Lebih Elegan) ---
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MainNavigation()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green, Colors.teal],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: const Icon(Icons.account_balance,
                  size: 80, color: Colors.green),
            ),
            const SizedBox(height: 25),
            const Text("NURUL FALAH",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2)),
            const Text("Sistem Informasi Terpadu",
                style: TextStyle(color: Colors.white70, fontSize: 16)),
            const SizedBox(height: 50),
            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}

// --- 2. NAVIGASI UTAMA ---
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const AkademikPage(),
    const KeuanganPage(),
    const ProfilPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_selectedIndex]), // Aman untuk iPhone Notch
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          selectedItemColor: Colors.green[700],
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: 'Beranda'),
            BottomNavigationBarItem(
                icon: Icon(Icons.school_rounded), label: 'Akademik'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet_rounded),
                label: 'Keuangan'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded), label: 'Profil'),
          ],
        ),
      ),
    );
  }
}

// --- 3. BERANDA (Grid Dashboard) ---
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.all(25),
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Assalamu'alaikum,",
                            style: TextStyle(color: Colors.white70)),
                        Text("Admin Irfan",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: Colors.green)),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            children: [
              _buildMenuCard(Icons.people, "Santri", "120 Orang"),
              _buildMenuCard(Icons.menu_book, "Kurikulum", "KMI/Modern"),
              _buildMenuCard(Icons.campaign, "Pengumuman", "3 Baru"),
              _buildMenuCard(Icons.event_available, "Kehadiran", "98%"),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildMenuCard(IconData icon, String title, String info) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.green),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(info, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}

// --- 4. AKADEMIK ---
class AkademikPage extends StatelessWidget {
  const AkademikPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Akademik"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          _buildActionCard(
              context,
              "Input Data Santri",
              "Kelola biodata santri baru",
              Icons.person_add_alt_1,
              const FormSantriPage()),
          _buildActionCard(context, "Jadwal", "Agenda belajar mengajar",
              Icons.calendar_today, null),
        ],
      ),
    );
  }

  Widget _buildActionCard(BuildContext context, String title, String desc,
      IconData icon, Widget? page) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        contentPadding: const EdgeInsets.all(15),
        leading: CircleAvatar(
            backgroundColor: Colors.green[50],
            child: Icon(icon, color: Colors.green)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(desc),
        onTap: () {
          if (page != null)
            Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        },
      ),
    );
  }
}

// --- 5. FORM INPUT (Desain Form Modern) ---
class FormSantriPage extends StatefulWidget {
  const FormSantriPage({super.key});
  @override
  State<FormSantriPage> createState() => _FormSantriPageState();
}

class _FormSantriPageState extends State<FormSantriPage> {
  final _name = TextEditingController();
  final _address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Formulir Santri")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _name,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                labelText: "Nama Lengkap",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _address,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.location_on),
                labelText: "Alamat Asal",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Data ${_name.text} Berhasil Disimpan")));
                Navigator.pop(context);
              },
              child: const Text("SIMPAN PERUBAHAN",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}

// Placeholder Pages
class KeuanganPage extends StatelessWidget {
  const KeuanganPage({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text("Halaman Keuangan"));
}

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});
  @override
  Widget build(BuildContext context) => Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.green,
              child: Icon(Icons.person, size: 50, color: Colors.white)),
          const SizedBox(height: 10),
          const Text("Irfan Mansyur",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const Text("Informatika - Univ. Islam Madura"),
        ],
      ));
}
