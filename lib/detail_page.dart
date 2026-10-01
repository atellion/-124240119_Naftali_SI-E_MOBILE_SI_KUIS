import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'stationery_item.dart';

class DetailPage extends StatefulWidget {
  final StationeryItem stationery;

  const DetailPage({super.key, required this.stationery});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late final TextEditingController _descController;
  late final TextEditingController _stockController;
  late final TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _descController =
        TextEditingController(text: widget.stationery.description);
    _stockController =
        TextEditingController(text: widget.stationery.stock.toString());
    _priceController =
        TextEditingController(text: widget.stationery.price.toString());
  }

  @override
  void dispose() {
    _descController.dispose();
    _stockController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _save() {
    final desc = _descController.text.trim();
    final stock = int.tryParse(_stockController.text.trim());
    final price = int.tryParse(_priceController.text.trim());

    if (desc.isEmpty || stock == null || price == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Isi semua data')),
      );
      return;
    }

    widget.stationery.description = desc;
    widget.stationery.stock = stock;
    widget.stationery.price = price;

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final stationery = widget.stationery;

    return Scaffold(
      appBar: AppBar(title: Text(stationery.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                stationery.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 200,
                  color: Colors.purple.shade100,
                  child: const Icon(Icons.edit, size: 60, color: Colors.purple),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  stationery.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp ${stationery.formattedPrice} / pcs',
                  style: const TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      controller: _descController,
                      decoration: const InputDecoration(
                        labelText: 'Deskripsi',
                        prefixIcon: Icon(Icons.description),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _stockController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        labelText: 'Stok tersedia (pcs)',
                        prefixIcon: Icon(Icons.inventory_2_rounded),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _priceController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        labelText: 'Harga (Rp)',
                        prefixIcon: Icon(Icons.money),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: FilledButton.icon(
                style: FilledButton.styleFrom(backgroundColor: Colors.purple),
                onPressed: _save,
                icon: const Icon(Icons.save),
                label: const Text('Simpan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
