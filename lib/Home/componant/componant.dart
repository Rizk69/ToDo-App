import 'package:flutter/material.dart';

void showLoading(BuildContext context,String text){

  showDialog(

      barrierDismissible: false,context: context, builder: (context){

    return AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(width: 15,),
          Text(text,style: Theme.of(context).textTheme.headline2,)
        ],
      ),
    );

  });
}
void hidden(BuildContext context){
  Navigator.pop(context);
}
void showMassge(BuildContext context,String text,String actionname,VoidCallback action,{String? negactionname,VoidCallback? negaction}){
  showDialog(

      context: context, builder: (context){
    return AlertDialog(
      content: Text(text,style: Theme.of(context).textTheme.headline2,),
      actions: [
        TextButton(onPressed: action, child: Text(actionname)),
        if(negactionname!=null)
        TextButton(onPressed:negaction , child: Text(negactionname))
      ],
    );
  });
}
AlertDialog showUpdateTasks(){
  BuildContext context;
  return AlertDialog(
    content: Container(
      color: Colors.white,
      child: Column(
        children: [
          Text('Edit Text'),
          TextField(



            decoration: InputDecoration(hintText: 'This is Title'),
          ),
          TextField(



            decoration: InputDecoration(hintText: 'This is Detils'),
          ),
          Text('Select Time',
              style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold)),

       InkWell(
        onTap: () {
          showDateTime();
        },
        child: Text(
          '5 ',
          style: TextStyle(
              color: Color(0XFF707070),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),

       ),
        ],
      )
    ),
  );
}

void showDateTime() {
  var context;
  showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)));
}
