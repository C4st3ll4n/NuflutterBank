import 'package:flutter/material.dart';

class CardHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22.0, right: 22.0),
      child: Container(
        constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width * 0.9,
            minHeight: MediaQuery.of(context).size.height * 0.5,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            maxHeight: MediaQuery.of(context).size.height * 0.6),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(2.0)),
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            Positioned(
                top: 20.0,
                left: 20.0,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.credit_card,
                      size: 20,
                      color: Colors.grey.shade700,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Text("Cartão de Crédito", style: TextStyle(),),
                    )
                  ],
                )),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.2,
              left: 30.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("FATURA ATUAL",
                      style: TextStyle(
                          color: Colors.lightBlue, fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.045)),
                  Text("R\$ 900.00",
                      style: TextStyle(
                          color: Colors.lightBlue, fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.080)),
                  Row(
                    children: <Widget>[
                      Text("Limite disponível: ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.045)),
                      Text("R\$ 200.00",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.045)),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: 35,
              right: 20,
              child: Container(
                constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width * 0.03,
                    minHeight: MediaQuery.of(context).size.height * 0.30,
                    maxWidth: MediaQuery.of(context).size.width * 0.03,
                    maxHeight: MediaQuery.of(context).size.height * 0.30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(color: Colors.deepOrange),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(color: Colors.blue),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(color: Colors.green),
                      )
                    ],
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
