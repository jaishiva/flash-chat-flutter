import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}
FirebaseUser loggedInUser;
final Firestore _firestore = Firestore.instance;
class _ChatScreenState extends State<ChatScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final messageTextController = TextEditingController();
  String message;

  @override
  void initState(){
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async{
    try {
      final FirebaseUser user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            messageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageTextController.clear();
                      _firestore.collection('messages').add({
                        'text' : message,
                        'name' : loggedInUser.email,
                        'timeStamp' : Timestamp.now()
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class messageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: _firestore.collection('messages').orderBy('timeStamp',descending: true).snapshots(),
    builder: (context, snapshot) {
      if(!snapshot.hasData) {return Expanded(child: Center(child: CircularProgressIndicator(backgroundColor: Colors.lightBlue,)));}
      else{
        var messages = snapshot.data;
        List<MessageBubble> list = [];
        for(var message in messages.documents){
          String user = message.data['name'];
          String text = message.data['text'];
          list.add(MessageBubble(user: user,text: text));
        }
        return Expanded(
            child: ListView(
              reverse: true,
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            children: list,
          ),
        );
      }
    },
  );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.user,this.text});
  final String user;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: user == loggedInUser.email? CrossAxisAlignment.end: CrossAxisAlignment.start,
      children: [
        Text(user,style : kUserNameStyle),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Material(
            elevation: 5,
            borderRadius: user == loggedInUser.email? kRightBubbleStyle : kLeftBubbleStyle,
            color : user == loggedInUser.email? Colors.white : Colors.lightBlue,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
              child: Text(text,style : TextStyle(
                fontSize: 16,
                color: user == loggedInUser.email? Colors.black: Colors.white
              )),
            ),
          ),
        )
      ],
    );
  }
}