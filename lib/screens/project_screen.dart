import 'package:flutter/material.dart';

const String _defaultFontFamily = 'Raleway';

class ProjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: Theme.of(context).primaryColor,
                size: 40,
              ), 
              onPressed: (){
                Navigator.of(context).pop();
              }
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                'Projeto x',
                style: TextStyle(
                  fontFamily: _defaultFontFamily,
                  color: Theme.of(context).primaryColor,
                  fontSize: 40
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                height: MediaQuery.of(context).size.height*0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Theme.of(context).disabledColor)
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Container()
                ),
                
              ),
            ),
            // Observer( //n funcionando pq tem q ser uma barra de acordo com o dia
            //   builder: (_){
            //     return LinearPercentIndicator(
            //       percent: _listTaskStore.barValue,
            //       lineHeight: 12.0,
            //       linearStrokeCap: LinearStrokeCap.butt, //para deixar reto
            //       backgroundColor: Theme.of(context).cardColor,
            //       linearGradient: Provider.of<ThemeStore>(context).defaultGradient,
            //     );
            //   }
            // )
          ],
          
        ),
      )
    );
  }
}