import 'package:flutter/material.dart';

const String _defaultFontFamily = 'Raleway';

class CustomInput extends StatelessWidget {
  final String label;
  final IconData icon;

  CustomInput(this.label, {this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      child: TextFormField(
        // onChanged:  _listTaskStore.setNewTask,
        style: TextStyle(
          color: Colors.white,                    
        ),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              icon,
              color: Color(0xFFFFFFFF),
            ), 
            onPressed: (){}
          ),
          labelText: label,
          labelStyle: TextStyle(
            color: Color(0xFFFFFFFF),
            fontFamily: _defaultFontFamily
          ),
          
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white54)),
        ),
        cursorColor: Color(0xFFFFFFFF),
      )
    );
  }
}