import 'package:flutter/material.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final widthApp = MediaQuery
        .of(context)
        .size
        .width;
    final heightApp = MediaQuery
        .of(context)
        .size
        .height;
    final paddingTop = MediaQuery
        .of(context)
        .padding
        .top;

    final myAppBar = AppBar(title: const Text('AppBar'));
    final heightBody = heightApp - paddingTop - myAppBar.preferredSize.height;

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: heightApp,
            height: heightApp * 0.3,
            color: Colors.white30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyContainer(widthApp),
                MyContainer(widthApp),
                MyContainer(widthApp)
              ],
            ),
          )
        ],
      ),
    );
  }
}



class MyContainer extends StatelessWidget {
  final double widthApp;

  const MyContainer(this.widthApp);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth * 0.03,
          height: constraints.maxHeight * 10,
          color: Colors.amber,
        );
      },
    );
  }
}