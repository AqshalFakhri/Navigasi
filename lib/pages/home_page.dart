import 'package:flutter/material.dart';
import 'package:navigasi/models/item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Item> items = [
      Item(
        name: 'Hansaplast',
        price: 20000,
        imageUrl: 'https://images.tokopedia.net/img/cache/700/VqbcmM/2022/12/4/1c0f3883-4af0-46ef-b0bb-238acac4c79b.jpg',
        stock: 10,
        rating: 4.1,
      ),
      Item(
        name: 'Betadine',
        price: 01500,
        imageUrl: 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//1030/betadine_betadine-antiseptic-solution-obat-luka-15ml_full02.jpg',
        stock: 20,
        rating: 4.2,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Items List"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Jumlah kolom
          childAspectRatio: 0.7, // Rasio lebar terhadap tinggi
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/item', arguments: item);
            },
            child: Hero(
              tag: item.name, // Tag yang unik untuk animasi Hero
              child: Card(
                child: Column(
                  children: [
                    Expanded( // Menggunakan Expanded agar gambar mengambil ruang yang tepat
                      child: Image.network(
                        item.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0), // Memberikan padding
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 4), // Jarak antara nama dan harga
                          Text('Rp ${item.price}', style: TextStyle(color: Colors.green)),
                          SizedBox(height: 4), // Jarak antara harga dan stok
                          Text('Stock: ${item.stock}'),
                          SizedBox(height: 4), // Jarak antara stok dan rating
                          Text('Rating: ${item.rating}', style: TextStyle(color: Colors.orange)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      // Tambahkan footer jika perlu
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: Text('Nama: Gilang Bagus Tri Pambudi, NIM: 362358302148'),
      ),
    );
  }
}