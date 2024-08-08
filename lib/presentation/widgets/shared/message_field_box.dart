import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();

    final textController = TextEditingController();

    final outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(10),
    );

    final inputDecoration = InputDecoration(
      enabledBorder: outlineInputBorder,
      border: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      hintText: 'End your message with a ?',
      suffixIcon: IconButton(
        icon: const Icon(Icons.send),
        onPressed: () {
          final textValue = textController.value.text;
          onValue(textValue);
          textController.clear();
        },
      ),
    );

    return TextFormField(
      onTapOutside: ($event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
