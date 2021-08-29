import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  MyWidget(this.globalKeyMyWidget);
  final GlobalKey globalKeyMyWidget;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: globalKeyMyWidget,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 250,
            height: 180,
            decoration:
                BoxDecoration(color: Colors.black, shape: BoxShape.circle),
          ),
          Container(
              width: 220,
              height: 150,
              decoration:
                  BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.accessibility,
                    color: Colors.white,
                    size: 35,
                  ),
                  Text(
                    'Widget',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
