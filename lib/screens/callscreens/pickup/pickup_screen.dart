import 'package:calling/screens/callscreens/call_screen.dart';
import 'package:calling/models/call.dart';
import 'package:calling/resources/call_methods.dart';
import 'package:flutter/material.dart';

class PickupScreen extends StatelessWidget {
  final Call call;
  final CallMethods callMethods = CallMethods();

  PickupScreen({
    required this.call
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Incoming...",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(height: 50),
            Image.network(
              call.callerPic!,
              height: 150,
              width: 150,
            ),
            SizedBox(height: 15),
            Text(
              call.callerName!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 75,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () async {
                    await callMethods.endCall(call: call);
                  },
                  icon: Icon(Icons.call_end),
                  color: Colors.redAccent,
                ),
                SizedBox(width: 25),
                IconButton(
                  icon: Icon(Icons.call),
                  color: Colors.green,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CallScreen(call: call),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

