import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Hello, User",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.pinkAccent,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Portfolio Card
            Card(
              color: const Color.fromRGBO(68, 0, 130, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Portfolio Balance",
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "\$12,345.67",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "+4.5% today",
                      style: TextStyle(color: Colors.greenAccent),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Recent Transactions
            const Text(
              "Recent Transactions",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _transactionCard("BTC", "\$123.45", "Received"),
                  _transactionCard("ETH", "\$456.78", "Sent"),
                  _transactionCard("LTC", "\$78.90", "Received"),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Market Trends
            const Text(
              "Market Trends",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(68, 0, 130, 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Text(
                    "Graph Placeholder",
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _transactionCard(String coin, String amount, String type) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(68, 0, 130, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.pinkAccent,
            child: Text(
              coin[0],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            amount,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            type,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
