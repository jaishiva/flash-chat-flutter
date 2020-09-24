import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: '',
  contentPadding:
      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kUserNameStyle = TextStyle(
  fontSize: 12,
  color: Colors.black45
);


const kLeftBubbleStyle = BorderRadius.only(
  bottomLeft: Radius.circular(20),
  bottomRight: Radius.circular(20),
  topRight: Radius.circular(20),
  topLeft: Radius.circular(0)
);

const kRightBubbleStyle = BorderRadius.only(
  bottomLeft: Radius.circular(20),
  bottomRight: Radius.circular(20),
  topRight: Radius.circular(0),
  topLeft: Radius.circular(20)
);