class Call {
  String? callerId;
  String? callerName;
  String? callerPic;
  String? receiverId;
  String? receiverName;
  String? receiverPic;
  String? channelId;
  bool? hasDialled;

  Call({
    this.callerId,
    this.callerName,
    this.callerPic,
    this.receiverId,
    this.receiverName,
    this.receiverPic,
    this.channelId,
    this.hasDialled
});

  Map<String, dynamic> toMap(Call call) {
    Map<String, dynamic> callMap = Map();
    callMap['caller_id'] = call.callerId;
    callMap['caller_name'] = call.callerName;
    callMap['caller_pic'] = call.callerPic;
    callMap['receiver_id'] = call.receiverId;
    callMap['receiver_name'] = call.receiverName;
    callMap['receiver_pic'] = call.receiverPic;
    callMap['channel_id'] = call.channelId;
    callMap['has_dialed'] = call.hasDialled;
    return callMap;
  }

  Call.fromMap(Map callMap){
    callerId = callMap['caller_id'];
    callerName = callMap['caller_name'];
    callerPic = callMap['call_map'];
    receiverId = callMap['receiver_id'];
    receiverName = callMap['receiver_name'];
    receiverPic = callMap['receiver_pic'];
    channelId = callMap['channel_id'];
    hasDialled = callMap['has_dialed'];
  }
}