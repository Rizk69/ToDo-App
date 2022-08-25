import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../providre/SettingProvider.dart';

class LanguagebouttenSheet extends StatefulWidget {
  @override
  State<LanguagebouttenSheet> createState() => _LanguagebouttenSheetState();
}

class _LanguagebouttenSheetState extends State<LanguagebouttenSheet> {
  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<SettingProvider>(context);
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                settingprovider.changLang('en');
              },
              child: settingprovider.curentlang == 'en'
                  ? getSelecteditems('English')
                  : getUnSelecteditems('English')),
          SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () {
                settingprovider.changLang('ar');
              },
              child: settingprovider.curentlang == 'ar'
                  ? getSelecteditems('العربيه')
                  : getUnSelecteditems('العربيه')),
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
