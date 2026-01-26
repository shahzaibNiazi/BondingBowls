class CafeconnectMessageModel {
  final String? id;
  final String? conversationId;

  final UserRefModel? sender;
  final UserRefModel? receiver;

  final String? message;
  final String? messageType;
  final String? mediaUrl;

  final bool? isRead;
  final DateTime? readAt;
  final bool? isDeleted;
  final List<String>? deletedFor;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  /// UI-only
  final bool isMe;
  final bool isSending;
  final bool isFailed;
  final String? imagePath;

  CafeconnectMessageModel({
    this.id,
    this.conversationId,
    this.sender,
    this.receiver,
    this.message,
    this.messageType,
    this.mediaUrl,
    this.isRead,
    this.readAt,
    this.isDeleted,
    this.deletedFor,
    this.createdAt,
    this.updatedAt,
    this.imagePath,
    required this.isMe,
    this.isSending = false,
    this.isFailed = false,
  });

  /// UI helpers (DON'T TOUCH UI)
  String? get text => message;

  factory CafeconnectMessageModel.fromJson(
    Map<String, dynamic> json,
    String myUserId,
  ) {
    return CafeconnectMessageModel(
      id: json['_id'],
      conversationId: json['conversationId'],
      sender: json['senderId'] != null
          ? UserRefModel.fromJson(json['senderId'])
          : null,
      receiver: json['receiverId'] != null
          ? UserRefModel.fromJson(json['receiverId'])
          : null,
      message: json['message'],
      messageType: json['messageType'],
      mediaUrl: json['mediaUrl'],
      isRead: json['isRead'],
      readAt: json['readAt'] != null ? DateTime.parse(json['readAt']) : null,
      isDeleted: json['isDeleted'],
      deletedFor: json['deletedFor'] != null
          ? List<String>.from(json['deletedFor'])
          : [],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      isMe: json['senderId']?['_id'] == myUserId,
    );
  }

  CafeconnectMessageModel copyWith({
    bool? isSending,
    bool? isFailed,
    bool? isMe,
  }) {
    return CafeconnectMessageModel(
      id: id,
      conversationId: conversationId,
      sender: sender,
      receiver: receiver,
      message: message,
      messageType: messageType,
      mediaUrl: mediaUrl,
      isRead: isRead,
      readAt: readAt,
      isDeleted: isDeleted,
      deletedFor: deletedFor,
      createdAt: createdAt,
      updatedAt: updatedAt,
      imagePath: imagePath,
      isMe: isMe ?? this.isMe, // <-- use new value if provided
      isSending: isSending ?? this.isSending,
      isFailed: isFailed ?? this.isFailed,
    );
  }
}

class UserRefModel {
  final String? id;
  final String? fullName;
  final String? profilePhoto;
  final String? nickname;

  UserRefModel({this.id, this.fullName, this.profilePhoto, this.nickname});

  factory UserRefModel.fromJson(Map<String, dynamic> json) {
    return UserRefModel(
      id: json['_id'],
      fullName: json['fullName'],
      profilePhoto: json['profilePhoto'],
      nickname: json['nickname'],
    );
  }
}
