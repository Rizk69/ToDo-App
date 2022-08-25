import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoproject/Home/providre/SettingProvider.dart';
import 'package:todoproject/Mytheme.dart';
import 'package:todoproject/databais/Taskes.dart';

import '../../databais/My_databais.dart';

class EditTask extends StatefulWidget {
  static const routename = 'edit';
  Tasks tasks;
  EditTask(this.tasks);

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<SettingProvider>(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 15),
          width: double.infinity,
          height: size.height * 0.2,
          color: Mytheme.bluee,
          child: Row(
            children: [
              InkWell(
                onTap:(){
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_outlined,
                  size: 30,
                  color: settingprovider.isDarkMode()
                      ? Colors.black
                      : Colors.white,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                'To DO List',
                style: TextStyle(
                    color: settingprovider.isDarkMode()
                        ? Colors.black
                        : Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: settingprovider.isDarkMode()
                          ? Colors.black
                          : Colors.white,
                      spreadRadius: 1,
                      offset: const Offset(1, 1))
                ],
                color: settingprovider.isDarkMode()
                    ? const Color(0XFF141922)
                    : Colors.white,
                borderRadius: BorderRadius.circular(25)),
            margin: const EdgeInsets.only(top: 120, left: 20, right: 20),
            width: double.infinity,
            height: size.height * 0.7,
            child: Container(
              padding:
                  const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                    'Edit Text',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: settingprovider.isDarkMode()
                          ? Colors.white
                          : Colors.black,
                    ),
                  )),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    initialValue: widget.tasks.title,
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: settingprovider.isDarkMode()
                            ? Colors.white
                            : Colors.black),
                    decoration: InputDecoration(
                      hintText: 'This is Title',
                      hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: settingprovider.isDarkMode()
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: widget.tasks.contant,
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: settingprovider.isDarkMode()
                            ? Colors.white
                            : Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Task Details',
                      hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: settingprovider.isDarkMode()
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Select Date',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                      child: InkWell(
                    onTap: () {

                      showDateTime(context);

                    },
                    child: Text(
                      '${selectdate.day}/${selectdate.month}/${selectdate.year}',
                      style: const TextStyle(
                          color: Color(0XFF707070),
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                  const Spacer(),
                  Center(
                    child: MaterialButton(
                      color: Mytheme.bluee,
                      minWidth: 255,
                      height: 55,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      onPressed: () {
                        updateTask(widget.tasks);
                        Navigator.pop(context);

                      },
                      child: const Text(
                        'Save Change',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }

  var selectdate =DateTime.now();

  void showDateTime(context) {
    showDatePicker(
        context: context,
        initialDate: selectdate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)))
        .then((select) => selectdate = select ?? selectdate);
    setState(() {

    });
  }
}
