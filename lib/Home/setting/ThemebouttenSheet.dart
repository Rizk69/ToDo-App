import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../providre/SettingProvider.dart';

class ThemebouttenSheet extends StatefulWidget {
  @override
  State<ThemebouttenSheet> createState() => _ThemebouttenSheetState();
}

class _ThemebouttenSheetState extends State<ThemebouttenSheet> {
  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<SettingProvider>(context);

    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                settingprovider.changThem(ThemeMode.light);
              },
              child: settingprovider.isDarkMode()
                  ? getUnSelecteditems('light')
                  : getSelecteditems('light'),),
    SizedBox(
    height: 12,
    ),


          InkWell(
              onTap: () {
                settingprovider.changThem(ThemeMode.dark);
              },
              child: settingprovider.isDarkMode()
                  ? getSelecteditems('dark')
                  : getUnSelecteditems('dark'),)
        ],
      ),
    );
  }

  Widget getSelecteditems(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: Theme.of(context)
                .textTheme
                .headline2
                ?.copyWith(color: Theme.of(context).primaryColor)),
        Icon(
          Icons.check,
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }

  Widget getUnSelecteditems(String text) {
    return Row(
      children: [Text(text, style: Theme.of(context).textTheme.headline2)],
    );
  }
}
