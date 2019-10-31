import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_nubank/pages/home/bloc/bloc_drag_down.dart';

class PerfilPage extends StatefulWidget {
  bool scroll;
  bool animated;

  PerfilPage({this.animated, this.scroll});


  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  var anime = true;

  void animation(){
    Timer(Duration(milliseconds: 10), (){
      setState(() {
        anime = !anime;
      });
    });
  }

  @override
  void initState() {
    animation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: positionUpdated.stream,
        builder: (context, snapshot) {
          return AnimatedContainer(
            duration: Duration(milliseconds: widget.scroll ? 1 : 800),
            color: Color.fromRGBO(109, 33, 119, 1.0),
            width: MediaQuery.of(context).size.width,
            height: widget.scroll
                ? MediaQuery.of(context).size.height
                : widget.animated == false
                    ? anime ? 0.0 : MediaQuery.of(context).size.height
                    : anime ? MediaQuery.of(context).size.height : 0.0,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Center(
                      child: Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/qrcode.png"),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.white.withOpacity(0.7),
                                BlendMode.dstATop))),
                  )),
                ),
                Center(
                  child: Text(
                    "Banco 260 - OvumPay",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Center(
                    child: Text(
                      "Agência: 0X0001",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 15.0),
                  child: Center(
                    child: Text(
                      "Conta: X01",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Divider(
                    color: Color.fromRGBO(145, 64, 169, 1),
                    height: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    color: Color.fromRGBO(145, 64, 169, 1),
                    height: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: ListTile(
                    leading: Icon(Icons.help_outline, color: Colors.white),
                    title:
                        Text("Me ajuda", style: TextStyle(color: Colors.white)),
                    trailing:
                        Icon(Icons.keyboard_arrow_right, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    color: Color.fromRGBO(145, 64, 169, 1),
                    height: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: ListTile(
                    leading: Icon(Icons.account_circle, color: Colors.white),
                    title:
                        Text("Perfil", style: TextStyle(color: Colors.white)),
                    subtitle: Text("Nome, email, telefone",
                        style: TextStyle(color: Colors.grey)),
                    trailing:
                        Icon(Icons.keyboard_arrow_right, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    color: Color.fromRGBO(145, 64, 169, 1),
                    height: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: ListTile(
                    leading: Icon(Icons.settings, color: Colors.white),
                    title: Text("Configurar conta",
                        style: TextStyle(color: Colors.white)),
                    trailing:
                        Icon(Icons.keyboard_arrow_right, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    color: Color.fromRGBO(145, 64, 169, 1),
                    height: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: ListTile(
                    leading:
                        Icon(Icons.mobile_screen_share, color: Colors.white),
                    title: Text("Configurações do App",
                        style: TextStyle(color: Colors.white)),
                    trailing:
                        Icon(Icons.keyboard_arrow_right, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: OutlineButton(
                    onPressed: () {},
                    child: Text("Sair do App",
                        style: TextStyle(color: Colors.white)),
                    borderSide: BorderSide(color: Color.fromRGBO(145, 64, 169, 1)),
                  ),
                )
              ],
            ),
          );
        });
  }
}
