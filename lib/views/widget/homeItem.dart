import 'package:flutter/material.dart';

import 'package:whitemastery_machine_test/models/user_model.dart';
import 'package:whitemastery_machine_test/utils/utils.dart';

class HomeItemWidget extends StatefulWidget {
  final UserModel user;
  const HomeItemWidget({
    super.key,
    required this.user,
  });

  @override
  State<HomeItemWidget> createState() => _HomeItemWidgetState();
}

class _HomeItemWidgetState extends State<HomeItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          '/profile',
          arguments: widget.user.avatar,
        ),
        child: Hero(
          tag: widget.user.avatar,
          child: CircleAvatar(
            backgroundImage: NetworkImage(widget.user.avatar),
          ),
        ),
      ),
      title: GestureDetector(
        onTap: () => Utils.showSnackbar(context, "ID :${widget.user.id}"),
        child: Text(
          "${widget.user.firstName} ${widget.user.lastName}",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      subtitle: Text(widget.user.email,
          style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
