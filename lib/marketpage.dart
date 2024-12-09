import 'package:flutter/material.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Market",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromRGBO(68, 0, 130, 1),
                hintText: "Search Cryptocurrency",
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(Icons.search, color: Colors.white54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Trending Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(68, 0, 130, 1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Trending Coins",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Icon(Icons.trending_up, color: Colors.greenAccent),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Cryptocurrency List
            Expanded(
              child: ListView(
                children: [
                  _cryptoItem("Bitcoin", "BTC", 16750.00, 4.5, 320),
                  _cryptoItem("Ethereum", "ETH", 3480.00, -1.2, 140),
                  _cryptoItem("Litecoin", "LTC", 650.00, 2.3, 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cryptoItem(String name, String symbol, double price, double change,
      double marketCap) {
    return Card(
      color: const Color.fromRGBO(68, 0, 130, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.pinkAccent,
          child: Text(symbol[0], style: const TextStyle(color: Colors.white)),
        ),
        title: Text(
          "$name ($symbol)",
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        subtitle: Text(
          "Market Cap: \$$marketCap B",
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "\$$price",
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              "${change > 0 ? '+' : ''}$change%",
              style: TextStyle(
                color: change > 0 ? Colors.greenAccent : Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
