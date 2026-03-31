import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final Color darkMaroon = const Color(0xFF330B0B);
  final Color goldColor = const Color(0xFFC79B3B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: darkMaroon,
        elevation: 0,
        title: Text("Cart", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Icon(Icons.account_balance_wallet, size: 40),
                        Text("Ottoman tasbih", style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Shipping To", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("Change", style: TextStyle(color: goldColor, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Beylikdüzü, İstanbul\nTürkiye", style: TextStyle(fontSize: 14)),
                  Divider(height: 30, color: Colors.grey[300]),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Payment Method", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("Change", style: TextStyle(color: goldColor, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("xxx - xxxx - xxxx - 9494", style: TextStyle(fontSize: 14)),
                  Divider(height: 30, color: Colors.grey[300]),

                  Text("Order Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 15),

                  buildCartItem("Kehribar tasbih Blue", "1.000TL"),
                  buildCartItem("Kehribar tasbih Orange", "1.000TL"),
                  buildCartItem("Camel bone tasbih", "3.000TL"),
                ],
              ),
            ),

            Container(
              color: goldColor,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  buildPriceRow("Subtotal", "5.000TL"),
                  buildPriceRow("Shipping", "200TL"),
                  Divider(color: Colors.white54),
                  buildPriceRow("Total", "5.200TL", isTotal: true),
                  SizedBox(height: 15),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showOrderPlacedPopup(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text("Place Order", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: darkMaroon,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: 2, // 2 is Cart
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context); // Pops the cart page off and returns to Home
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Tasbih"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.support_agent), label: "Service"),
        ],
      ),
    );
  }

  // --- CART PAGE HELPER FUNCTIONS ---
  Widget buildCartItem(String title, String price) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: [
          Container(height: 60, width: 60, color: Colors.black87),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              SizedBox(height: 5),
              Text(price, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          )
        ],
      ),
    );
  }

  Widget buildPriceRow(String label, String amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.white, fontSize: isTotal ? 18 : 14, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
          Text(amount, style: TextStyle(color: Colors.white, fontSize: isTotal ? 18 : 14, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }

  void showOrderPlacedPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            height: 250,
            width: 200,
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(Icons.cancel, size: 30, color: Colors.black),
                  ),
                ),
                SizedBox(height: 10),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.check, color: Colors.white, size: 50),
                ),
                SizedBox(height: 20),
                Text(
                  "Order Placed",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "Your order #294753 was placed successfully",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}