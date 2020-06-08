import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

const String _defaultFontFamily = 'Raleway';

class ProjectWidget extends StatelessWidget {

  final String name;
  final double value;

  ProjectWidget(this.name, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Container(
        // height: MediaQuery.of(context).size.height*0.15,
        width: MediaQuery.of(context).size.width*0.4,
        decoration: BoxDecoration(
          color: Color(0xFF7A928F),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal:10, vertical: 10),
              child: SleekCircularSlider(
                initialValue: value,
                appearance: CircularSliderAppearance(
                  angleRange: 360,
                  size: 120,
                  customWidths: CustomSliderWidths(progressBarWidth: 10),
                  customColors: CustomSliderColors(
                    hideShadow: true,
                    trackColor: Theme.of(context).primaryColor,
                    progressBarColors: [
                      Color(0xFF0CCF4F),
                      Color(0xFF22BFC3),
                    ],
                  ),
                  infoProperties: InfoProperties(
                    mainLabelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30
                    )
                  )
              ),
            ),
            ),
            Text(
              name,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: _defaultFontFamily,
                fontSize: 15
              ),
            )
          ],
        ),
      ),
    );
  }
}