import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            width: 100,
            height: 100,
            child: RiveAnimation.asset("assets/loadingme.riv"),
          ),
          ClipPath(
            child: Container(
              height: 100,
              width: 100,
              color: Colors.black,
            ),
            clipper: CustomClipPath(),
          )
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 5.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
