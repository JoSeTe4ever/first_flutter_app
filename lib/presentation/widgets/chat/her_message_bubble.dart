import 'package:first_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;

  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child:
                Text('Hello ASDASDASD', style: TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 5),
        _ImageBubble(imgUrl: message.imgUrl ?? ''),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imgUrl;
  const _ImageBubble({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size);
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imgUrl,
          width: size.width * 0.7,
          height: size.height * 0.2,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
