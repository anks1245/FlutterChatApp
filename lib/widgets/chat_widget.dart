
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_application/models/direct_connection_models.dart';
import 'package:flutter_chat_application/models/user_connections_model.dart';
import 'package:flutter_chat_application/screens/chat.dart';

class ChatWidget extends StatelessWidget{

  final DirectConnectionModel directConnection;

  const ChatWidget ({required this.directConnection});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
        leading: CircleAvatar(
            backgroundImage: NetworkImage(directConnection.user.avatar),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(directConnection.user.name, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 5,),
                if (directConnection.user.verified)
                  Icon(Icons.verified, color: Colors.green, size: 16)
                else
                  Icon(Icons.schedule, size: 16)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //add extras here
                if(directConnection.user.status != null)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Text(
                        directConnection.user.status!,
                      style: TextStyle(
                        fontSize: 8
                      ),
                    ),
                  ),

                // if(directConnection.pinned != null && directConnection.pinned == true)
                  // ImageIcon(AssetImage('assets/pin.png')),
                
                if(directConnection.read == true)
                  Padding(padding: EdgeInsets.all(5), child: Icon(Icons.circle, color: theme.colorScheme.primaryContainer, size: 10,),)
              ],
            )
          ],
        ),
        subtitle: Text(
            directConnection.message,
            style: TextStyle(color: theme.colorScheme.primary),
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Chat(user: directConnection.user)));
        },
    );
  }

}