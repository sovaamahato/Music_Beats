import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  final child;
  const MyBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.all(3),
      child: Center(
        child: child,
      ),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: const [
            //shadow for bottom right
            BoxShadow(
                color: Color.fromARGB(221, 102, 96, 96),
                offset: Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10),
            //shadow for top left
            BoxShadow(
                color: Colors.white,
                offset: Offset(
                  -5.0,
                  -5.0,
                ),
                blurRadius: 10),
          ]),
    );
  }
}
