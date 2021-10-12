import 'package:flutter/material.dart';
import 'package:flutter_ex1/screens/email_screen.dart';
import 'package:flutter_ex1/screens/phone_number_screen.dart';
import 'package:flutter_ex1/widgets/app_bar_widget.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);
  //
  static const routeName = '/tabs-screen';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBarWidget(title: 'Sign Up',),
            body: Column(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                      )
                    )
                  ),
                  child: TabBar(
                    tabs: [
                      Tab(text: 'PHONE NUMBER'),
                      Tab(text: 'EMAIL'),
                    ],
                    labelColor: Colors.red,
                    unselectedLabelColor: Colors.black45,
                    indicatorColor: Colors.red,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      PhoneNumberScreen(),
                      EmailScreen(),
                    ]),
                ),
              ],
            )),
      ),
    );
  }
}
