import 'dart:math';
import 'package:calling/resources/call_methods.dart';
import 'package:calling/models/call.dart';
import 'package:calling/models/userclass.dart';
import 'package:flutter/material.dart';

import '../screens/callscreens/call_screen.dart';

class CallUtils {
  static final CallMethods callMethods = CallMethods();

  static dial({required UserClass from, required UserClass to, context}) async {
    Call call = Call(
      callerId: from.uid,
      callerName: from.name,
      callerPic: from.profilePhoto,
      receiverId: to.uid,
      receiverName: to.name,
      receiverPic: to.profilePhoto,
      channelId: Random().nextInt(1000).toString(), // 전화 신호 고유 번호
    );

    bool callMade = await callMethods.makeCall(call: call);
    call.hasDialled = true;

    if (callMade) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallScreen(call: call),
        )
      );
    }
  }
}