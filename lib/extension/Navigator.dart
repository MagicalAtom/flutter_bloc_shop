import 'package:flutter/material.dart';


/// context , route , navigation to route
to({required BuildContext context,required route}){
Navigator.of(context).push(MaterialPageRoute(builder: (context){
  return route;
}));
}



exitPage({required BuildContext context}){
  Navigator.of(context).pop();
}