
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/page/detail/detail_page.dart';
import 'package:weather/page/home/home_page.dart';

class BottomNavigationCustom extends StatefulWidget {
  const BottomNavigationCustom({super.key});

  @override
  State<BottomNavigationCustom> createState() => _BottomNavigationCustomState();
}

class _BottomNavigationCustomState extends State<BottomNavigationCustom> {
  List<Icon> list = [
    const Icon(CupertinoIcons.home, color: Color(0xff1D6CF3)),
    const Icon(CupertinoIcons.list_bullet, color:  Color(0xff1D6CF3),),
  ];

  List<Widget> listPage = [
    const HomePage(),
    const DetailPage(),
  ];
  int activePage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: listPage[activePage],
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.transparent,
        onTap: (index) {
          setState(() {
            activePage = index;
          });
        },
        items: list,
      ),
    );
  }
}
