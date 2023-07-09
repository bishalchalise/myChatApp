import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Message {
  final String senderId;
  final String senderEmail;
  final String recieverId;
  final Timestamp timeStamp;
  final String message;
  Message({
    required this.senderId,
    required this.senderEmail,
    required this.recieverId,
    required this.timeStamp,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'senderEmail': senderEmail,
      'recieverId': recieverId,
      'timeStamp': timeStamp,
      'message': message,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      senderId: map['senderId'] as String,
      senderEmail: map['senderEmail'] as String,
      recieverId: map['recieverId'] as String,
      timeStamp: map['timeStamp'] as Timestamp,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) => Message.fromMap(json.decode(source) as Map<String, dynamic>);
}
