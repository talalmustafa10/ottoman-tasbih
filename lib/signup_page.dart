import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  final Color darkMaroon = const Color(0xFF330B0B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMaroon,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Create Account", style: TextStyle(color: Colors.white, fontSize: 16)),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),

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

              buildSimpleTextField("Username"),
              SizedBox(height: 20),
              buildSimpleTextField("Password"),
              SizedBox(height: 20),
              buildSimpleTextField("Email"),
              SizedBox(height: 20),
              buildSimpleTextField("Phone Number"),
              SizedBox(height: 40),

              buildCustomButton("Sign up", darkMaroon, null),
              SizedBox(height: 15),
              buildCustomButton("Continue with Facebook", Colors.black, Icons.facebook),
              SizedBox(height: 15),

              buildCustomButton("Continue with Google", Colors.black, null, customIconLetter: "G"),

              SizedBox(height: 30),

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


  Widget buildSimpleTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),

        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      ),
    );
  }


  Widget buildCustomButton(String text, Color bgColor, IconData? icon, {String? customIconLetter}) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: () {},
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