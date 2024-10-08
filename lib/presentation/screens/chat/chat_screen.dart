import 'package:first_app/domain/entities/message.dart';
import 'package:first_app/presentation/providers/chat_provider.dart';
import 'package:first_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:first_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:first_app/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: const NetworkImage(
                'https://yt3.googleusercontent.com/FbQt8VjI66HZnrgCeAgZeAetrAfrlHxDlUY7qaQbpJa3zMtXuOf1tHC18l07ELyqgiARbO8Q=s900-c-k-c0x00ffffff-no-rj'),
          ),
        ),
        title: const Text('Chat Screen'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];
                      if (message.fromWho == FromWho.mine) {
                        return MyMessageBubble(message: message);
                      } else {
                        return HerMessageBubble(message: message);
                      }
                    })),
            MessageFieldBox(
                onValue: (value) => {chatProvider.sendMessage(value)}),
          ],
        ),
      ),
    );
  }
}
