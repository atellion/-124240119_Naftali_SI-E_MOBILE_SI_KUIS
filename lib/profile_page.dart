import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name;

  const ProfilePage({super.key, required this.name});

  Widget _infoCard(IconData icon, String title, String subtitle) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.purple.shade100,
          child: Icon(icon, color: Colors.purpleAccent),
        ),
        title: Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 24),
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.purple.shade100,
              child: const Icon(Icons.person, size: 44, color: Colors.purple),
            ),
            const SizedBox(height: 12),
            Text(
              name.toUpperCase(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text('Pemilik Toko Alat Tulis', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),
            _infoCard(Icons.shopping_bag, 'Toko Alat Tulis',
                'Pesan makanan favorit Anda dengan mudah.'),
            _infoCard(Icons.note_alt, 'Barang Unggulan',
                'Pulpen, Buku Tulis, dan Pensil.'),
          ],
        ),
      ),
    );
  }
}
