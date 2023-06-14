import 'package:art_store/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../components/arts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimary,
        leading: IconButton(icon: Icon(FeatherIcons.menu, color: kWhite,), onPressed: () {
          //Todo: Open AppDrawer
        },),
        title: Text('Home', style: TextStyle(color: kWhite),),
      ),
      body: Arts(),
    );
  }
}