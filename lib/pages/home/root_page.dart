import 'package:flutter/material.dart';
import 'package:flutter_nubank/pages/home/widgets/app_bar_home.dart';

import '../perfil_page.dart';
import 'bloc/bloc_drag_down.dart';
import 'bloc/bloc_root.dart';
import 'home_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  BlocRoot blocRoot = BlocRoot();
  BlocDragDown blocDrag;

  @override
  void initState() {
    positionUpdated.listen((value) {
      if (value > 0) blocDrag.jumpToBottom();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: GestureDetector(
          onVerticalDragStart: (value) {
            blocRoot.selectPage.sink.add(true);
            blocRoot.scroll = true;
            blocDrag = BlocDragDown(positionInit: value.globalPosition.dy,
            height: MediaQuery.of(context).size.height);
          },
          onVerticalDragUpdate: (value) {
            blocDrag.changePosition(updated:value.globalPosition.dy);
          },
          onVerticalDragEnd: (value) {
            blocDrag.velocity = value.velocity.pixelsPerSecond.dy;
          },
          onTap: () {
            blocRoot.scroll = false;
            blocRoot.selectPage.sink.add(!blocRoot.selectPage.value);
          },
          child: AppBarHome(),
        ),
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.12),
      ),
      body: StreamBuilder<Object>(
          stream: blocRoot.selectPage.stream,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Stack(
                    children: <Widget>[
                      HomePage(),
                      snapshot.data == true
                          ? PerfilPage(animated: false, scroll: blocRoot.scroll)
                          : PerfilPage(animated: true, scroll: blocRoot.scroll)
                    ],
                  )
                : Container();
          }),
    );
  }
}
