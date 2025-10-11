class Message {
  final String? text;
  final String? imagePath;
  final DateTime createdAt;
  final bool isMe;

  Message({
    this.text,
    this.imagePath,
    required this.createdAt,
    required this.isMe,
  });
}
