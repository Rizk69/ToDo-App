import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoproject/Home/EditTask/EditTask.dart';
import 'package:todoproject/Home/Floting%20action.dart';
import 'package:todoproject/Home/componant/componant.dart';
import 'package:todoproject/Mytheme.dart';
import 'package:todoproject/databais/Taskes.dart';
import 'package:provider/provider.dart';
import '../Home/Home_screen.dart';
import '../Home/providre/SettingProvider.dart';
import '../Mytheme.dart';
import '../databais/My_databais.dart';

class TaskWidget extends StatefulWidget {
  Tasks task;
  TaskWidget(this.task);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<SettingProvider>(context);
    return Slidable(
      startActionPane: ActionPane(motion: DrawerMotion(), children: [
        SlidableAction(
          borderRadius: BorderRadius.circular(12),
          padding: EdgeInsets.symmetric(vertical: 10),
          onPressed: (buildconte) {
            showMassge(
                context,
                'are you sure delete',
                'ok',
                () {
                  deleteTask(widget.task);
                  Navigator.pop(context);

                  setState(() {});
                },
                negactionname: 'Cancel',
                negaction: () {
                  Navigator.pop(context);
                });
          },
          backgroundColor: Color(0xFFFE4A49),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        )
      ]),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (Context) => EditTask(widget.task)));
        },
        child: Container(
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                    color: settingprovider.isDarkMode()
                        ? Colors.black
                        : Colors.white,
                    spreadRadius: 1,
                    offset: Offset(1, 1))
              ],
              color: settingprovider.isDarkMode()
                  ? Color(0XFF141922)
                  : Colors.white,
              borderRadius: BorderRadius.circular(14)),
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              Container(
                width: 6,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: widget.task.isDone
                      ? Mytheme.green
                      : Mytheme.primarylight,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 19, top: 0, right: 0, bottom: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.task.title,
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontSize: 30,
                                    color: widget.task.isDone
                                        ? Mytheme.green
                                        : Mytheme.primarylight,
                                  ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 0),
                              child: Icon(
                                Icons.access_time,
                                color: settingprovider.isDarkMode()
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              '${widget.task.dateTime.day}/${widget.task.dateTime.month}/${widget.task.dateTime.year}',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              InkWell(
                onTap: () {
                  isDone(widget.task);
                  setState(() {});
                },
                child: widget.task.isDone
                    ? Text('Done..!',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontSize: 30, color: Mytheme.green))
                    : Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 22),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Mytheme.primarylight),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
