import 'package:flutter/material.dart';

class CardBottom extends StatelessWidget {

  final String label;
  final IconData icon;

  const CardBottom({Key key, this.label, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color.fromRGBO(145, 64, 169, 0.9)),
        constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width * 0.26,
            maxHeight: MediaQuery.of(context).size.height * 0.15,
            maxWidth: MediaQuery.of(context).size.width * 0.26),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 1,
              child: Icon(icon, size:25, color: Colors.white),
            ),
            Positioned(
              bottom: 2,
              left: 3,
              child: Text(label, style: TextStyle(color: Colors.white, fontSize: 16),),
            )
          ],
        ),
      ),
    );
  }
}
