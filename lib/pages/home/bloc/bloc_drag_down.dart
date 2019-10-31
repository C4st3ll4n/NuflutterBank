import 'dart:async';

import 'package:rxdart/rxdart.dart';

class BlocDragDown{
	var positionInit;
	double height;
	var positionEnd;
	double velocity;

	BlocDragDown({this.positionInit, this.height});


	dispose(){
		positionUpdated.close();
	}

	void changePosition({double updated}){
		positionEnd = updated;
		if((updated + 2.0) > (height*0.14)) positionUpdated.sink.add((updated/height - 0.13));
	}

	void jumpToBottom(){
		if(positionEnd > height*0.2){
			Timer.periodic(Duration(milliseconds: 150), (timer){
				if(positionEnd >= height){
					timer.cancel();
				}else{
					changePosition(updated:(positionEnd + 1.0));
				}
			});
		}
	}

	double positionAtual(){

	}

}

var positionUpdated = BehaviorSubject<double>(seedValue: 0);
