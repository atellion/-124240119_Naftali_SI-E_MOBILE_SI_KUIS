import 'package:flutter/material.dart';

import 'stationery_item.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  final List<StationeryItem> stationerys;
  final VoidCallback onChanged;

  const HomePage({
    super.key,
    required this.stationerys,
    required this.onChanged,
  });

  Future<void> _openDetail(
      BuildContext context, StationeryItem stationery) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetailPage(stationery: stationery)),
    );
    onChanged();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Toko Alat Tulis')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: stationerys.length,
        itemBuilder: (context, index) {
          final stationery = stationerys[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: InkWell(
              onTap: () => _openDetail(context, stationery),
              child: SizedBox(
                height: 110,
                child: Row(
                  children: [
                    Image.network(
                      stationery.imageUrl,
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 110,
                        height: 110,
                        color: Colors.purple.shade100,
                        child: const Icon(Icons.edit, color: Colors.purple),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              stationery.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              stationery.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${stationery.stock} pcs tersedia',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color:Colors.deepPurple,
                                  ),
                                ),
                                Text(
                                  'Rp ${stationery.formattedPrice} / pcs',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
