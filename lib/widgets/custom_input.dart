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
        onChanged: nome ? listTaskStore.setNewTask : (string){},
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
              onPressed: () async{
                DateTime date = await showDatePicker(
                  context: context, 
                  initialDate: DateTime.now(), 
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030)
                );
                onDateSelected(date);
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