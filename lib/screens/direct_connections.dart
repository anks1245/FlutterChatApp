
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_application/models/direct_connection_models.dart';
import 'package:flutter_chat_application/services/ApiService.dart';
import 'package:flutter_chat_application/widgets/chat_widget.dart';
import 'package:flutter_chat_application/widgets/shimmer_loader.dart';

class DirectConnectionsScreen extends StatefulWidget {
  @override
  _DirectConnectionScreenState createState() => _DirectConnectionScreenState();
}

class _DirectConnectionScreenState extends State<DirectConnectionsScreen> {
  final ApiService _apiService = ApiService();
  List<DirectConnectionModel>? directConnection;
  bool isLoading = true;

  Future<void> _fetchData() async {
    try {
      List<DirectConnectionModel> data = await _apiService.fetchDirectConnections();
      setState(() {
        directConnection = data;
        isLoading = false;
      });
    }catch(e){
      setState(() {
        isLoading = false;
        print("Error $e");
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Scaffold(
          body: isLoading?
          ShimmerLoadingWidget() : directConnection == null || directConnection!.isEmpty ? Center(
            child: Text("No chats available"),
          ) :
          ListView.separated(
              itemCount: directConnection!.length,
              separatorBuilder: (context, index)=>Divider(
                color: theme.colorScheme.outlineVariant,
                thickness: 1,
              ),
              itemBuilder: (context, index) {
                return ChatWidget(directConnection: directConnection![index]);
              }
          ),
        ),
      ),
    );
  }
}