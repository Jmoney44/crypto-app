import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Wallet",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.pinkAccent,
            tabs: [
              Tab(text: "Assets"),
              Tab(text: "Transactions"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Assets Tab
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  _cryptoAsset("Bitcoin", "BTC", 0.5, 16750.00),
                  _cryptoAsset("Ethereum", "ETH", 2.0, 3480.00),
                  _cryptoAsset("Litecoin", "LTC", 10.0, 650.00),
                ],
              ),
            ),

            // Transactions Tab
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  _transactionItem("BTC", "Received", "+0.1", "2 mins ago"),
                  _transactionItem("ETH", "Sent", "-0.5", "1 hour ago"),
                  _transactionItem("LTC", "Received", "+5.0", "1 day ago"),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.pinkAccent,
          child: const Icon(Icons.send, color: Colors.white),
        ),
      ),
    );
  }

  Widget _cryptoAsset(String name, String symbol, double amount, double value) {
    return Card(
      color: const Color.fromRGBO(68, 0, 130, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  "$symbol: $amount",
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
            Text(
              "\$${(amount * value).toStringAsFixed(2)}",
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _transactionItem(String symbol, String type, String amount, String time) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.pinkAccent,
        child: Text(symbol[0], style: const TextStyle(color: Colors.white)),
      ),
      title: Text(
        "$type $amount $symbol",
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        time,
        style: const TextStyle(color: Colors.white70),
      ),
    );
  }
}