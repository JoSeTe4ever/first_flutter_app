import 'package:first_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:flutter/material.dart';

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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) => const MyMessageBubble(),
            ))
          ],
        ),
      ),
    );
  }
}
