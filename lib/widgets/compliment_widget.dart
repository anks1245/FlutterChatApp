import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_application/models/compliment_model.dart';

class ComplimentWidget extends StatelessWidget{

  final ComplimentModel compliment;

  const ComplimentWidget ({required this.compliment});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => _showComplimentBottomSheet(context, compliment),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(compliment.profileImage),
          radius: 25,
        ),
        title: Row(
          children: [
            Text(
              "${compliment.userName}, ${compliment.age}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(width: 8),
            if (compliment.isNew)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "NEW",
                  style: TextStyle(color: theme.colorScheme.primary, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(compliment.message),
            SizedBox(height: 4),
            Text(
              "Connection expires in ${compliment.connectionExpires.hours} hours",
              style: TextStyle(color: theme.colorScheme.onSurface),
            ),
          ],
        ),
      ),
    );
  }

  void _showComplimentBottomSheet(BuildContext context, ComplimentModel compliment) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Profile Info
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(compliment.profileImage),
                ),
                title: Text("${compliment.userName}, ${compliment.age}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(
                  "Connection expires in ${compliment.connectionExpires.hours} hours",
                ),
                trailing: compliment.isNew
                    ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "NEW",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
                    : null,
              ),
              SizedBox(height: 10),

              // Message Box
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.redAccent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        compliment.message,
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text("07:20pm", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // Connection Prompt
              Text(
                "You need to connect to chat.",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 10),

              // Buttons
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 48),
                ),
                onPressed: () {},
                child: Text("Connect and chat",
                    style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Hide this user",
                    style: TextStyle(color: Colors.redAccent)),
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}