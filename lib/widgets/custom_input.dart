
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool nome;
  final Function(String) onCustomChange;
  final Function(String) onCustomSubmited;
  final Function onSuffixPressed;
  final TextEditingController controller;

  CustomInput(this.label, {@required this.onCustomChange, this.onCustomSubmited, this.icon, this.nome=false, this.onSuffixPressed, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width*0.9,
      child: TextFormField(
        controller: controller,
        onChanged: onCustomChange,
        onFieldSubmitted: onCustomSubmited ,
        style: TextStyle(
          color: Theme.of(context).primaryColor,                    
        ),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ), 
            onPressed: onSuffixPressed
          ),
          labelText: label,
          labelStyle: TextStyle(
            color: nome? Color(0xFFFFFFFF) : Theme.of(context).primaryColor, //input nome fixo na cor branca
          ),
          
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: nome ? Color(0xFFFFFFFF) : Theme.of(context).primaryColor, //fixo se for o nome
            )
          ),
        ),
        cursorColor: Theme.of(context).primaryColor,
      )
    );
  }
}