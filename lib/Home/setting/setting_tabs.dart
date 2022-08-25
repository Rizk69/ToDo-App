import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providre/SettingProvider.dart';
import 'LanguagebouttenSheet.dart';
import 'ThemebouttenSheet.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<SettingProvider>(context);

    return Container(

      padding: EdgeInsets.all(24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        SizedBox(
          height: 30,
        ),
        Text(
          'Language',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            showLanguagebouttenSheet();
          },
          child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color:Color(0XFF5D9CEC), width: 2),
                borderRadius: BorderRadius.circular(0),
                color: settingprovider.isDarkMode()?
                Color(0XFF141922):Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Englush',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Icon(Icons.arrow_drop_down_sharp,color:Color(0XFF5D9CEC))
                ],
              )),
        ),
        SizedBox(
          height: 15,
        ),
        Text('Mode', style: Theme.of(context).textTheme.bodyText2),
        SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            showThemebouttenSheet();
          },
          child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color:Color(0XFF5D9CEC), width: 2),
                borderRadius: BorderRadius.circular(0),
                color:settingprovider.isDarkMode()?
                Color(0XFF141922):Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    settingprovider.isDarkMode()?'Dark':'Light',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Icon(Icons.arrow_drop_down_sharp,color:Color(0XFF5D9CEC) ,)
                ],
              )),
        ),
      ]),
    );
  }

  void showLanguagebouttenSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return LanguagebouttenSheet();
        });
  }

  void showThemebouttenSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return ThemebouttenSheet();
        });
  }
}


