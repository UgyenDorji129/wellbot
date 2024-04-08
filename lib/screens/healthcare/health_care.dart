import 'package:flutter/material.dart';
import 'package:health_app/screens/healthcare/service/open_ai.dart';
import 'package:health_app/screens/healthcare/widgets/chatmessage.dart';
import 'package:health_app/screens/healthcare/widgets/threedots.dart';
import 'package:velocity_x/velocity_x.dart';

class AiHealthCare extends StatefulWidget {
  const AiHealthCare({super.key});

  @override
  State<AiHealthCare> createState() => _AiHealthCareState();
}

class _AiHealthCareState extends State<AiHealthCare> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];


  bool _isTyping = false;

  @override
  void dispose() {
    super.dispose();
  }

  void _sendMessage() async {
    if (_controller.text.isEmpty) return;
    ChatMessage message = ChatMessage(
      text: _controller.text,
      sender: "user",
      isImage: false,
    );

    setState(() {
      _messages.insert(0, message);
      _isTyping = true;
    });

    _controller.clear();
    try{
      final response = await generateResponse(message.text);
      insertNewData(response, isImage: false);
    }
    catch (e){
      insertNewData(e.toString(), isImage: false);
    }
  }

  void insertNewData(String response, {bool isImage = false}) {
    ChatMessage botMessage = ChatMessage(
      text: response,
      sender: "bot",
      isImage: isImage,
    );

    setState(() {
      _isTyping = false;
      _messages.insert(0, botMessage);
    });
  }

  Widget _buildTextComposer() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onSubmitted: (value) => _sendMessage(),
            decoration: const InputDecoration.collapsed(
                hintText: "Tell me About your Symptom?"),
          ),
        ),
        ButtonBar(
          children: [
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                _sendMessage();
              },
            )
          ],
        ),
      ],
    ).px16();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Your AI Doctor")),
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                  child: ListView.builder(
                reverse: true,
                padding: Vx.m8,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _messages[index];
                },
              )),
              if (_isTyping) const ThreeDots(),
              const Divider(
                height: 1.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: context.cardColor,
                ),
                child: _buildTextComposer(),
              )
            ],
          ),
        ));
  }
}