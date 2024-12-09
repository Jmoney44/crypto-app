import 'package:flutter/material.dart';

class TradingPages extends StatelessWidget {
  const TradingPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Trading",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          DropdownButton<String>(
            dropdownColor: const Color.fromRGBO(68, 0, 130, 1),
            value: "BTC/USDT",
            onChanged: (String? value) {},
            items: <String>["BTC/USDT", "ETH/USDT", "LTC/USDT"]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }).toList(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Chart Section
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(68, 0, 130, 1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text(
                  "Chart Placeholder",
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Order Type Tabs
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const TabBar(
                    indicatorColor: Colors.pinkAccent,
                    tabs: [
                      Tab(text: "Market"),
                      Tab(text: "Limit"),
                    ],
                  ),
                  SizedBox(
                    height: 200,
                    child: TabBarView(
                      children: [
                        _orderForm("Market Order"),
                        _orderForm("Limit Order"),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Buy/Sell Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent[400],
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Buy",
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Sell",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _orderForm(String orderType) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            orderType,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 8),
          _inputField("Price", "0.00"),
          const SizedBox(height: 8),
          _inputField("Quantity", "0"),
          const SizedBox(height: 8),
          _inputField("Total", "0.00"),
        ],
      ),
    );
  }

  Widget _inputField(String label, String hint) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: const Color.fromRGBO(68, 0, 130, 1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }
}
