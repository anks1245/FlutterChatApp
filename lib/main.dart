import 'package:flutter/material.dart';
import 'package:flutter_chat_application/screens/compliments.dart';
import 'package:flutter_chat_application/screens/direct_connections.dart';
import 'package:flutter_chat_application/widgets/custom_tab_bar.dart';
import 'utils/theme.dart';
import 'utils/typography.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final materialTheme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'Flutter Chat App',
      theme: materialTheme.light(),
      darkTheme: materialTheme.dark(),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Chat'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(widget.title),
        centerTitle: false,
        bottom: PreferredSize(preferredSize: Size.fromHeight(1), child: Divider(height: 1,)),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: CustomTabBar(tabController: _tabController, tabs: ["Direct Connections", "Compliments"]),
          ),
          Expanded(child: TabBarView(
              controller: _tabController,
              children: [
                DirectConnectionsScreen(),
                ComplimentsScreen()
              ])
          )
        ],
      ),
    );
  }
}
