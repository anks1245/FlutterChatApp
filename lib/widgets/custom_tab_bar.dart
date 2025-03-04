
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget{
  final TabController tabController;
  final List<String> tabs;

  const CustomTabBar({required this.tabController, required this.tabs, Key? key}) : super(key: key);

  @override
  _CustomTabBar createState() => _CustomTabBar();

}

class _CustomTabBar extends State<CustomTabBar> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(6),
      child: TabBar(
          controller: widget.tabController,
          isScrollable: false,
          indicator: BoxDecoration(
            color: theme.colorScheme.onTertiaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Colors.black12,
          dividerColor: Colors.transparent,
          dividerHeight: 0,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          labelColor: Colors.white,
          splashFactory: NoSplash.splashFactory,
          tabs: widget.tabs.map((tab)=> Tab(text: tab)).toList()),
    );
  }

}