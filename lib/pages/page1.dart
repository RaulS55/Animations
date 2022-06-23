import 'package:animate_do/animate_do.dart';
import 'package:animations_ft/pages/navegation_page.dart';
import 'package:animations_ft/pages/twiter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Page1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animaciones"),
        actions: [
          IconButton(
              onPressed: (() {
                Navigator.push(context,
                    CupertinoPageRoute(builder: ((context) => TwiterPage())));
              }),
              icon: const FaIcon(FontAwesomeIcons.twitter)),
          FadeInLeft(
            duration: const Duration(seconds: 1),
            child: IconButton(
                onPressed: (() {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: ((context) => NavegationPage())));
                }),
                icon: const FaIcon(Icons.navigate_next)),
          ),
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: () {},
          child: const FaIcon(FontAwesomeIcons.play),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElasticIn(
                delay: const Duration(milliseconds: 1200),
                child: const FaIcon(Icons.new_releases,
                    size: 40, color: Colors.blue)),
            FadeInDown(
              delay: const Duration(milliseconds: 200),
              child: const Text(
                "TITULO",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
              ),
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 800),
              child: const Text(
                "Soy otro texto",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            FadeInLeft(
              delay: const Duration(milliseconds: 1000),
              child: Container(
                width: 150,
                height: 2,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
