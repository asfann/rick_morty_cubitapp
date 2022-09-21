import 'package:flutter/material.dart';
import 'package:rick_morty_cubitapp/views/menu_view_page.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({Key? key, required this.body}) : super(key: key);
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Image.asset('images/logo-black 1.png',
            height: 49,
            width: 48,),
          ),
          actions:  [
            GestureDetector(
              onTap:  () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const MenuView()));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
            ),
          ],
          backgroundColor: Colors.white,
        ),
        body: body);
  }
}
