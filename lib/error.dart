import 'package:all_news/select_page.dart';
import 'package:flutter/material.dart';
class ErrorPage extends StatelessWidget {
  static const id = 'ErrorPage';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "images/error.png",
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.15,
              left: MediaQuery.of(context).size.width * 0.3,
              right: MediaQuery.of(context).size.width * 0.3,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 13),
                      blurRadius: 25,
                      color: Color(0xFF5666C2).withOpacity(0.17),
                    ),
                  ],
                ),
                child: FlatButton(
                  color: Color(0xFFFF6F6F),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  onPressed: () {
                    Navigator.pushNamed(context, SelectionPage.id);
                  },
                  child: Text(
                    "Go Back".toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
