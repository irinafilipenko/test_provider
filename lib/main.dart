import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:test_provider/pages/count_page.dart';
import 'package:test_provider/pages/event_page.dart';
import 'package:test_provider/pages/user_page.dart';
import 'package:test_provider/providers/count_provider.dart';
import 'package:test_provider/providers/event_provider.dart';
import 'package:test_provider/providers/user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<CountProvider>.value(value: CountProvider()),
          FutureProvider(
            create: (_) async => UserProvider().loadUserData(),
            initialData: UserProvider().userList,
          ),
          StreamProvider(
              create: (_) => EventProvider().intStream(), initialData: 0)
        ],
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Provider Demo"),
              centerTitle: true,
              bottom: const TabBar(
                tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.add),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.person,
                    ),
                  ),
                  Tab(
                    icon: Icon(Icons.message),
                  ),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                MyCountPage(),
                MyUserPage(),
                MyEventPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
