import 'package:flutter/material.dart';
import 'package:rick_morty_cubitapp/views/menu_view_page.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({Key? key, required this.body,  this.close=false,  this.iconBool=false}) : super(key: key);
  final Widget body;
  final bool close;
  final bool iconBool;
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
               close?  Navigator.pop(context) : Navigator.push(context, MaterialPageRoute(
                   builder: (context) => const MenuView()));
              },
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: iconBool ? const Icon(Icons.close, color: Colors.black,) : const Icon(
                  Icons.menu, color: Colors.black,
                )
              ),
            ),
          ],
          backgroundColor: Colors.white,
        ),
        body: SafeArea(child: body,));
  }
}
