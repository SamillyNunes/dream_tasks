import 'package:dream_tasks/stores/theme_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DaysSequenceWidget extends StatelessWidget {

  final int sequence;
  final int record;

  DaysSequenceWidget(this.sequence,this.record);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.2,
      decoration: BoxDecoration(
        gradient: Provider.of<ThemeStore>(context).defaultGradient,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width*0.6,
            child: Text(
              'Você completou sua meta $sequence dias seguidos!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.only(top:5),
            child: Text(
              'Seu recorde é de $record dias',
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: 15
              ),
            ),
          )
        ],
      ),
    );
  }
}