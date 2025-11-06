// lib/widgets/message_item.dart
import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String message;
  final VoidCallback? onTap;

  const MessageItem(this.imageUrl, this.name, this.message, {this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
        child: Row(
          children: [
            Image.asset(
              imageUrl,
              width: 60,
              height: 60,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 60,
                  height: 60,
                  color: Colors.grey,
                  child: const Icon(Icons.person, color: Colors.white),
                );
              },
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 100, 100, 100),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "12:30",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}