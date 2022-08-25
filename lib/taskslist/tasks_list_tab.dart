import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:todoproject/Home/providre/SettingProvider.dart';
import 'package:provider/provider.dart';
import 'package:todoproject/databais/My_databais.dart';
import 'package:todoproject/databais/Taskes.dart';
import '../../taskslist/task_widget.dart';

class TasksListTab extends StatefulWidget {
  @override
  State<TasksListTab> createState() => _TasksListTabState();
}

class _TasksListTabState extends State<TasksListTab> {
  DateTime selecteddate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<SettingProvider>(context);
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          CalendarTimeline(

            initialDate: selecteddate,
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            lastDate: DateTime.now().add(const Duration(days: 365)),
            onDateSelected: (date) {
              if(date==null)return;
              selecteddate=date;
              setState(() {

              });
            },
            leftMargin: 20,
            monthColor: settingprovider.isDarkMode()?
            Colors.white:Colors.black,
            dayColor:  settingprovider.isDarkMode()?
            Colors.white:Colors.black,
            activeDayColor:  settingprovider.isDarkMode()?
            Colors.black:Colors.white,
            activeBackgroundDayColor: const Color(0XFF5D9CEC),
            dotsColor: const Color(0xFF333A47),
            selectableDayPredicate: (data) => true,
            locale: settingprovider.curentlang,

          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot<Tasks>>(
            stream: getTasksFromFirebase(selecteddate),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('EROR 404');
              }
              List<Tasks>? tas =
                  snapshot.data?.docs.map((e) => e.data()).toList();
              return ListView.builder(
                itemBuilder: (context, index) {
                  return TaskWidget(tas![index]);
                },
                itemCount: tas?.length,
              );
            },
          ))
        ],
      ),
    );
  }
}
