import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whitemastery_machine_test/provider/user_provider.dart';

import '../widget/widget.dart';

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
        appBar: AppBar(
          title: Text(
            "Home",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Center(
          child: userProvider.state == AppState.loading
              ? const CircularProgressIndicator()
              : userProvider.state == AppState.error
                  ? Text(userProvider.errorMessage)
                  : ListView.separated(
                      itemBuilder: (_, i) {
                        var user = userProvider.userList[i];
                        return HomeItemWidget(
                          user: user,
                        );
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
