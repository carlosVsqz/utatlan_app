import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utatlan_app/src/blocs/auth/authentication_bloc.dart';
import 'package:utatlan_app/src/ui/Widgets/BestFoodWidget.dart';
import 'package:utatlan_app/src/ui/Widgets/BottomNavBarWidget.dart';
import 'package:utatlan_app/src/ui/Widgets/PopularFoodsWidget.dart';
import 'package:utatlan_app/src/ui/Widgets/SearchWidget.dart';
import 'package:utatlan_app/src/ui/Widgets/TopMenus.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const IconData logout = IconData(0xe848, fontFamily: 'MaterialIcons');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0,
        title: Text(
          "What would you like to eat?",
          style: TextStyle(
              color: Color(0xFF3a3737),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        brightness: Brightness.light,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.exit_to_app,
//              logout,
                color: Color(0xFF3a3737),
              ),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SearchWidget(),
            TopMenus(),
            PopularFoodsWidget(),
            BestFoodWidget(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}

