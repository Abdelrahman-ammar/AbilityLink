import 'package:flutter/material.dart';

class DismissibleWidget<T> extends StatelessWidget {
  final Widget child;
  final T item;
  const DismissibleWidget({
    required this.child,
    required this.item,
    required Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) =>
      Dismissible(key: ObjectKey(item), child: child);
}
