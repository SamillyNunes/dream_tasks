import 'package:dream_tasks/stores/list_task_store.dart';
import 'package:flutter/material.dart';

const String _defaultFontFamily = 'Raleway';

class CustomInput extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool nome;
  final ListTaskStore listTaskStore;

  CustomInput(this.label, this.listTaskStore, {this.icon, this.nome=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      child: TextFormField(
        onChanged: nome ? listTaskStore.setNewTask : (string){},
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