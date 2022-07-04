






class ZapRequestModel {
  String? senderName;
  String? senderId;
  String? senderDescription;
  String? senderImage;
  String? receiverId;
  double? numberOfZaps;
  DateTime? sentAt;


  ZapRequestModel({this.senderName,this.senderId,this.receiverId,this.numberOfZaps,this.senderDescription,this.senderImage,this.sentAt});


  ZapRequestModel.fromJson(json,id){
    this.senderId = json['senderId'];
    this.receiverId = json['receiverId'];
    this.senderName = json['senderName'] ?? '';
    this.numberOfZaps = json['numberOfZaps'];
    this.senderDescription = json['senderDescription'];
    this.senderImage = json['senderImage'];
    this.sentAt = json['sentAt'].toDate();

  }
  toJson() {
    return {
      'senderId': this.senderId,
      'receiverId':receiverId,
      'senderName': this.senderName,
      'numberOfZaps':this.numberOfZaps,
      'senderImage':this.senderImage,
      'senderDescription':this.senderDescription,
      'sentAt':this.sentAt,

    };
  }
}