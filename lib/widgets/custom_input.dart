import 'package:dream_tasks/stores/list_task_store.dart';
import 'package:flutter/material.dart';

const String _defaultFontFamily = 'Raleway';

class CustomInput extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool nome;
  final ListTaskStore listTaskStore;
  final Function(DateTime) onDateSelected;

  CustomInput(this.label, this.listTaskStore, {this.icon, this.nome=false, this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      child: TextFormField(
        onChanged: (value){
          if(nome){
            listTaskStore.setNewTask(value);
          }
        },
        style: TextStyle(
          color: Theme.of(context).primaryColor,                    
        ),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: IconButton(
              icon: Icon(
                icon,
                color: Theme.of(context).primaryColor,
              ), 
              onPressed: (){ //observar q todos os inputs tao com a acao da data
                
              }
            ), 
            onPressed: (){}
          ),
          labelText: label,
          labelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontFamily: _defaultFontFamily
          ),
          
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
        ),
        cursorColor: Theme.of(context).primaryColor,
      )
    );
  }
}