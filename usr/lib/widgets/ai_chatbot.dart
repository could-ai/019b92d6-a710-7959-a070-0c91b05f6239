import 'package:flutter/material.dart';

class AiChatbot extends StatelessWidget {
  const AiChatbot({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // Mock AI response
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('AI Assistant'),
            content: const Text('Recommended: Check out our electronics deals! (Mock AI response)'),
            actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
          ),
        );
      },
      child: const Icon(Icons.chat),
      tooltip: 'AI Chatbot',
    );
  }
}