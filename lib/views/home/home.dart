import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:whitemastery_machine_test/provider/user_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, userProvider, _) {
      return Scaffold(
        appBar: AppBar(),
        body: Skeletonizer(
          enabled: userProvider.state == AppState.loading,
          child: ListView.separated(
              itemBuilder: (_, i) {
                var user = userProvider.userList[i];
                return Text(user.firstName);
              },
              separatorBuilder: (_, __) => const SizedBox(
                    height: 15,
                  ),
              itemCount: userProvider.userList.length),
        ),
      );
    });
  }
}
