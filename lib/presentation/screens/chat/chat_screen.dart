import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/core/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  final avatar = 'https://www.britishcouncil.org/sites/default/files/famelab_whtas_the_science_behind_a_smile.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(avatar),
          ),
        ),
        title: const Text('Brother 🙌🏻'),
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  Widget _buildChatContent(ChatProvider chatProvider) {
    if (chatProvider.messageList.isEmpty) {
      return const Center(
        child: Text('Start a conversation', style: TextStyle(fontSize: 20)),
      );
    }

    return ListView.builder(
      controller: chatProvider.chatScrollController,
      itemCount: chatProvider.messageList.length,
      itemBuilder: (context, index) {
        final message = chatProvider.messageList[index];

        if (message.fromWho == FromWho.me) {
          return MyMessageBubble(message: message);
        }

        return HerMessageBubble(message: message);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: _buildChatContent(chatProvider)),
            MessageFieldBox(onValue: chatProvider.sendMessage),
          ],
        ),
      ),
    );
  }
}
