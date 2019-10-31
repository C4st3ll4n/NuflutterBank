import 'package:flutter/material.dart';
import 'package:flutter_nubank/pages/home/widgets/card_bottom.dart';
import 'package:flutter_nubank/pages/home/widgets/card_home.dart';
import 'package:flutter_nubank/pages/perfil_page.dart';

import 'bloc/bloc_home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  BlocHome bloc = BlocHome();

  AnimationController animController;
  Animation animOpacity, animOpacityHome, animTranslate;

  @override
  void initState() {
    super.initState();

    animController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    animOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(animController);

    animOpacityHome = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: animController, curve: Interval(0.0, 0.1)));

    animOpacityHome.addListener(() {
      setState(() {});
    });

    animTranslate = Tween(begin: 0.0, end: 470.0).animate(animController);

    animTranslate.addListener(() {
      setState(() {});
    });
  }

  _onTogleAnimation() {
    if (animController.value != 0) {
      animController.reverse();
    } else {
      animController.forward();
    }
  }

  @override
  void dispose() {
    bloc.dispose();
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [CardHome(), CardHome(), CardHome(), CardHome()];

    List<Widget> _bottom = [
      CardBottom(label: "Indique\namigos",icon: Icons.people_outline),
      CardBottom(label: "Ajustar\nlimite",icon: Icons.outlined_flag),
      CardBottom(label: "Me ajuda",icon: Icons.help_outline),
      CardBottom(label: "Cobrar",icon: Icons.attach_money),
      CardBottom(label: "Depositar",icon: Icons.monetization_on),
      CardBottom(label: "Pagar",icon: Icons.payment,),
      CardBottom(label: "Transferir",icon: Icons.compare_arrows,),

    ];

    return Scaffold(
      backgroundColor: Color.fromRGBO(109, 33, 119, 1),
      body: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: animOpacity,
            builder: (BuildContext context, Widget child) {
              return Opacity(
                opacity: animOpacity.value,
                child: PerfilPage(animated: false, scroll: false),
              );
            },
          ),
          Container(
            child: Column(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(0.0, animTranslate.value),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03),
                    child: Transform.translate(
                      offset: Offset(0.0, 0.0),
                      child: GestureDetector(
                        onTap: _onTogleAnimation,
                        onVerticalDragUpdate: (details) {
                          animController.value += details.primaryDelta / 470.0;
                        },
                        onVerticalDragEnd: (details) {
                          if (animController.value > 0.5) {
                            animController.forward();
                          } else {
                            animController.reverse();
                          }
                        },
                        child: Container(
                          constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height * 0.55),
                          child: Container(
                            child: PageView.builder(
                              itemCount: _pages.length,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index) {
                                bloc.pageChange(index: index);
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return _pages[index];
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                animOpacityHome.value == 0.0
                    ? Container(width: 0.0, height: 0.0)
                    : Opacity(
                        opacity: animOpacityHome.value,
                        child: Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Container(
                            constraints: BoxConstraints(
                                minWidth: 15.0 * _pages.length <=
                                        MediaQuery.of(context).size.width
                                    ? 15.0 * _pages.length
                                    : MediaQuery.of(context).size.width,
                                maxWidth: 15.0 * _pages.length <=
                                        MediaQuery.of(context).size.width
                                    ? 15.0 * _pages.length
                                    : MediaQuery.of(context).size.width,
                                maxHeight: 20.0),
                            child: ListView.builder(
                              itemCount: _pages.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: StreamBuilder(
                                    stream: bloc.positionPage.stream,
                                    builder: (ctx, snp) {
                                      return snp.hasData
                                          ? CircleAvatar(
                                              radius: 3.5,
                                              backgroundColor: index == snp.data
                                                  ? Colors.white
                                                  : Colors.grey,
                                            )
                                          : Container();
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                ),

                animOpacityHome.value == 0.0?
                    Container(width: 0.0, height: 0.0):
                    Expanded(child: Container(),),
                animOpacityHome.value == 0.0?
                    Container(width: 0.0, height: 0.0):
                    Opacity(opacity: animOpacityHome.value,
                    child: Container(
                      constraints: BoxConstraints(maxWidth:  MediaQuery.of(context).size.width,
                      maxHeight: MediaQuery.of(context).size.height * 0.16),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: _bottom,
                      )
                    ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
