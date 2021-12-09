


import 'package:flutter/material.dart';
// typedef VoidCallback1Booll = void Function(bool);

class CustomSwitch extends StatefulWidget {
  bool value;
  Function(bool) callback;
  CustomSwitch({required this.value,required this.callback});

  @override
  State<StatefulWidget> createState() => _SwitchState(value: this.value, callback: this.callback);
}

class _SwitchState extends State<CustomSwitch>{
  bool value;
  Function(bool) callback;
  _SwitchState({required this.value,required this.callback});

  void stateChange(bool a){
    if(value == false){
      setState(() {
        value = true;
      });
    }
    else{
      setState(() {
        value = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Switch(value: value, onChanged: callback);
  }
}