import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'signup_page.dart'; // This is the new link to your signup page!

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color darkMaroon = const Color(0xFF330B0B);
  final Color goldColor = const Color(0xFFC79B3B);

  // This variable remembers if the search box is open or closed
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: darkMaroon,
        elevation: 0,
        // The title swaps between the text "Home" and the typing box
        title: isSearching
            ? TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Search...",
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
          ),
        )
            : Text("Home", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),

        actions: [
          // The Search Icon
          IconButton(
            icon: Icon(isSearching ? Icons.close : Icons.search, color: Colors.white),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
              });
            },
          ),
          SizedBox(width: 5),

          // --- THE ACCOUNT ICON (NOW LINKED!) ---
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupPage()),
              );
            },
          ),
          SizedBox(width: 10),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Icon(Icons.account_balance_wallet, size: 40),
            Text("Ottoman tasbih", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 10),

            Container(
              color: goldColor,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(15),
              child: Text(
                "Welcome to ottoman tasbih store we wish you good shopping experience",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),

            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15),
              child: Text("Highlighted", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 15),
                  buildSimpleProduct(context, "Kuka tasbih with letter...", "2.000TL"),
                  SizedBox(width: 15),
                  buildSimpleProduct(context, "Camel Bone tasbih with...", "3.000TL"),
                  SizedBox(width: 15),
                ],
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: buildSimpleService(Icons.local_shipping, "Fast delivery")),
                      SizedBox(width: 10),
                      Expanded(child: buildSimpleService(Icons.credit_card, "Easy payment")),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(child: buildSimpleService(Icons.headset_mic, "7/24 service")),
                      SizedBox(width: 10),
                      Expanded(child: buildSimpleService(Icons.assignment_return, "Free return")),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              color: goldColor,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text("App download", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 15),
                  Text("[ Google Play ]    [ App Store ]", style: TextStyle(color: Colors.white)),
                  SizedBox(height: 15),
                  Text("VISA  -  TROY  -  AMEX  -  MASTERCARD", style: TextStyle(color: Colors.white)),
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
        currentIndex: 0,
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
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

  // --- HOME PAGE HELPER FUNCTIONS ---
  Widget buildSimpleProduct(BuildContext context, String name, String price) {
    return Container(
      width: 160,
      color: Colors.grey[200],
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(height: 120, color: Colors.black87),
          SizedBox(height: 10),
          Text(name, style: TextStyle(fontSize: 12), textAlign: TextAlign.center),
          SizedBox(height: 5),
          Text(price, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {
              showAddToCartPopup(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: darkMaroon),
            child: Text("Add to cart", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }

  Widget buildSimpleService(IconData icon, String text) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Icon(icon, size: 30),
          SizedBox(height: 5),
          Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  void showAddToCartPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            height: 200,
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
                  radius: 30,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.shopping_cart, color: Colors.white, size: 30),
                ),
                SizedBox(height: 20),
                Text(
                  "Added to cart successfully",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}