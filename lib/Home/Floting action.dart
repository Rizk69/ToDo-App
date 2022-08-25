import 'package:flutter/material.dart';
import 'package:todoproject/databais/My_databais.dart';
import 'package:todoproject/databais/Taskes.dart';
import '../Home/providre/SettingProvider.dart';
import 'package:provider/provider.dart';
import 'componant/componant.dart';

class FlotingAction extends StatefulWidget {
  @override
  State<FlotingAction> createState() => _FlotingActionState();
}

class _FlotingActionState extends State<FlotingAction> {
  String title = '';

  String dec = '';
  static DateTime selectdate = DateTime.now();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<SettingProvider>(context);
    return Form(
      key: formkey,
      child: Container(
        padding: EdgeInsets.all(20),
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
            color:
            settingprovider.isDarkMode() ? Color(0XFF141922) : Colors.white,
            ),


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Text(
              'Add new Task',
              style: Theme.of(context).textTheme.headline2?.copyWith(
                color: settingprovider.isDarkMode() ? Colors.white : Colors.black,
              ),
            )),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              onChanged: (text) {
                title = text;
              },
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'plese enter a valid Title';
                }
              },
              decoration:
                   InputDecoration(hintText: 'Enter your Task Title',hintStyle: TextStyle(color:  settingprovider.isDarkMode() ? Colors.white : Colors.black,)),
            ),
            SizedBox(
              height: 12,
            ),
            TextFormField(
              onChanged: (text) {
                dec = text;
              },
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'plese enter a valid Deteils';
                }
              },
              maxLines: 4,
              decoration: InputDecoration(hintText: 'Enter your Task Deteils',hintStyle: TextStyle(color:  settingprovider.isDarkMode() ? Colors.white : Colors.black,)),
            ),
            SizedBox(
              height: 24,
            ),
            Text('Select Time',
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(fontSize: 16,color:  settingprovider.isDarkMode() ? Colors.white : Colors.black,)),
            SizedBox(
              height: 24,
            ),
            Center(
                child: InkWell(
              onTap: () {
                showDateTime();
              },
              child: Text(
                '${selectdate.day}/${selectdate.month}/${selectdate.year} ',
                style: TextStyle(
                    color: Color(0XFF707070),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            )),
            Spacer(),
            Container(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  addTaskclickbutton();
                  Navigator.pop(context);
                },
                child: Text('Add'),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showDateTime() {
    showDatePicker(
            context: context,
            initialDate: selectdate,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 365)))
        .then((select) => selectdate = select ?? selectdate);
    setState(() {});
  }

  void addTaskclickbutton() {
    if (formkey.currentState!.validate()) {
      Tasks task = Tasks(
          title: title, contant: dec, dateTime: DateUtils.dateOnly(selectdate));

      showLoading(context, 'Loding...');

      insertTask(task).then((value) {
        hidden(context);

        showMassge(context, 'Added Succecfuly', 'ok', () {
          Navigator.pop(context);
        });
      }).catchError((e) {
        hidden(context);
      });
    }
  }
}
