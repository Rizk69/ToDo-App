import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoproject/Home/providre/SettingProvider.dart';
import 'package:todoproject/Home/setting/setting_tabs.dart';




import '../taskslist/tasks_list_tab.dart';
import 'Floting action.dart';
import 'package:provider/provider.dart';
class Home_Screen extends StatefulWidget {
  static const String routenamed = 'home';

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<SettingProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List',style: TextStyle(color:settingprovider.isDarkMode()
            ? Colors.black
            : Colors.white ),),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(

        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        clipBehavior: Clip.antiAlias,
        elevation: 0,

        child: BottomNavigationBar(


          currentIndex: selectedindex,
          onTap: (index) {
            setState(() {
              selectedindex = index;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(

        onPressed: flotingAction,

        child: Icon(Icons.add),
      ),
      body: tabs[selectedindex],
    );
  }

  List<Widget> tabs = [TasksListTab(), SettingsTab()];

  void flotingAction(){
    showModalBottomSheet(
      context: context,
      builder: (buildContext) {
      return FlotingAction();
      } );
    }
  }


