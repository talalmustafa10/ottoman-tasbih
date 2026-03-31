import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  final Color darkMaroon = const Color(0xFF330B0B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMaroon, // The background behind the rounded white box

      appBar: AppBar(
        backgroundColor: Colors.transparent, // Makes it blend into the dark maroon scaffold
        elevation: 0,
        title: Text("Create Account", style: TextStyle(color: Colors.white, fontSize: 16)),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white), // Makes the back arrow white
      ),

      // The white box with rounded corners
      body: Container(
        width: double.infinity, // Takes up full width
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        // SingleChildScrollView lets the screen scroll up when the keyboard opens!
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(height: 10),
              Text(
                "Create Your Account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),

              // --- TEXT FIELDS ---
              buildSimpleTextField("Username"),
              SizedBox(height: 20),
              buildSimpleTextField("Password"),
              SizedBox(height: 20),
              buildSimpleTextField("Email"),
              SizedBox(height: 20),
              buildSimpleTextField("Phone Number"),
              SizedBox(height: 40),

              // --- BUTTONS ---
              buildCustomButton("Sign up", darkMaroon, null),
              SizedBox(height: 15),
              buildCustomButton("Continue with Facebook", Colors.black, Icons.facebook),
              SizedBox(height: 15),
              // We use a custom 'G' text here because Flutter doesn't have a default Google icon built-in
              buildCustomButton("Continue with Google", Colors.black, null, customIconLetter: "G"),

              SizedBox(height: 30),

              // Bottom Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?  ", style: TextStyle(color: Colors.black)),
                  Text("sign in", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // ==========================================
  // HELPER FUNCTIONS
  // ==========================================

  // Function to draw a simple text field with a bottom line
  Widget buildSimpleTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        // This makes just a simple line at the bottom
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      ),
    );
  }

  // Function to draw the big solid buttons (with or without icons)
  Widget buildCustomButton(String text, Color bgColor, IconData? icon, {String? customIconLetter}) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: () {}, // Empty so it doesn't do anything when clicked yet
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon, color: Colors.white),
            if (customIconLetter != null)
              Text(customIconLetter, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            if (icon != null || customIconLetter != null) SizedBox(width: 15), // Space between icon and text
            Text(text, style: TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}