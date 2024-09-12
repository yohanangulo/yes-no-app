enum FromWho { me, him }

class Message {
  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho,
  });

  final String text;
  final String? imageUrl;
  final FromWho fromWho;
}
