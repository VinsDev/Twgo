import 'package:flutter/material.dart';
import 'package:helpbuddy/admin/chat/plagiarism/plagiarism.dart';
import 'package:helpbuddy/user/chat/models/message_model.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../models/user_model.dart';

Uuid uuid = const Uuid();

class ChatRoom extends StatefulWidget {
//  final ChatRoomModel? chatRoom;
  const ChatRoom(
      {Key? key,
      //required this.chatRoom,
      required this.userModel,
      required this.targetUser,
      this.reason})
      : super(key: key);
  final UserModel targetUser;
  final UserModel userModel;
  final String? reason;

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  TextEditingController messageController = TextEditingController();
  ValueNotifier<int> chatNotifierValue = ValueNotifier<int>(0);
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    messageController.text = '';
    super.initState();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  Future<void> sendMessage() async {
    String? message = messageController.text.trim();
    messageController.clear();

    if (message.isNotEmpty) {
      MessageModel messageModel = MessageModel(
        text: message,
        messageId: uuid.v1(),
        sender: widget.userModel.userId,
        sentTime: DateTime.now(),
        seen: false,
      );
    }
  }

  DateFormat timeFormat = DateFormat('hh:mm a');

  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SafeArea(
            child: Stack(children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Icon(Icons.arrow_back_ios,
                          color: Colors.black, size: 20),
                    ),
                  ),
                  widget.targetUser.userDpUrl.toString().isNotEmpty
                      ? CircleAvatar(
                          backgroundImage:
                              // NetworkImage(widget.targetUser.userDpUrl.toString()),
                              Image.asset(
                                      widget.targetUser.userDpUrl.toString())
                                  .image,
                        )
                      : const CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Icon(Icons.person),
                        ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.targetUser.userName ?? 'User',
                        style: const TextStyle(color: Colors.black),
                      ),
                      widget.targetUser.isOnline!
                          ? const Text(
                              'Online',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 12,
                              ),
                            )
                          : const Text(
                              'Offline',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            )
                    ],
                  ),
                ],
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (clicked) {
                              clicked = false;
                            } else {
                              clicked = true;
                            }
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 8.0, right: 8.0),
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0053A1),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Options',
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Icon(
                                clicked
                                    ? Icons.keyboard_arrow_up_rounded
                                    : Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      clicked
                          ? InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PlagiarismCheck()));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    right: 8.0, bottom: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 12),
                                decoration: BoxDecoration(
                                    color: const Color(0xFF0053A1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                        'assets/icons/submit_button.png'),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Submit Project',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container()
                    ],
                  ))
            ]),
          ),
          Container(
            color: const Color.fromARGB(148, 158, 158, 158),
            height: 1,
            width: double.maxFinite,
          ),
          Expanded(
              child: ValueListenableBuilder<int>(
            valueListenable: chatNotifierValue,
            builder: (BuildContext context, int value, Widget? child) {
              return ListView.builder(
                shrinkWrap: true,
                reverse: false,
                controller: scrollController,
                itemCount: t.length,
                itemBuilder: (BuildContext context, int index) {
                  MessageModel currentMessage = t[index];
                  return Row(
                    mainAxisAlignment:
                        currentMessage.sender == widget.userModel.userId
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onLongPress: () async {},
                        onDoubleTap: () async {
                          // edit message
                          if (messageController.text.isNotEmpty) {}
                        },
                        borderRadius: BorderRadius.circular(20),
                        splashColor: Colors.green,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment:
                                currentMessage.sender == widget.userModel.userId
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints: const BoxConstraints(
                                  maxWidth: 250,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: (currentMessage.sender ==
                                          widget.userModel.userId)
                                      ? const Color(0xffD2D4D8)
                                      : const Color(0xffFFF0E6),
                                ),
                                child: Text(
                                  currentMessage.text.toString(),
                                  textAlign: currentMessage.sender ==
                                          widget.userModel.userId
                                      ? TextAlign.end
                                      : TextAlign.start,
                                  style: const TextStyle(
                                    color: Color(0xff234C78),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                //  + ${DateTime.parse(currentMessage.sentTime.toString()).second} + ${DateTime.parse(currentMessage.sentTime.toString()).millisecond}
                                timeFormat.format(currentMessage.sentTime!),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          )),
          MessageInputField(
            notifierRef: chatNotifierValue,
            controller: scrollController,
          )
        ],
      ),
    );
  }
}

class MessageInputField extends StatefulWidget {
  MessageInputField({required this.notifierRef, required this.controller});
  ValueNotifier<int> notifierRef;
  ScrollController controller;
  @override
  _MessageInputFieldState createState() => _MessageInputFieldState();
}

class _MessageInputFieldState extends State<MessageInputField> {
  TextEditingController _textEditingController = TextEditingController();
  bool _isTyping = false;

  void _onTextChanged() {
    setState(() {
      _isTyping = _textEditingController.text.isNotEmpty;
    });
  }

  void _sendMessage() {
    if (_textEditingController.text.isNotEmpty) {
      // Implement your logic to send the message here
      String message = _textEditingController.text;
      t.add(MessageModel(
          messageId: '123',
          sender: '123',
          text: message,
          seen: true,
          sentTime: DateTime.now()));

      // Update message ui ...
      widget.notifierRef.value = t.length;

      widget.controller.animateTo(
        t.length * 80,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      _textEditingController.clear();
      setState(() {
        _isTyping = false;
      });
    }
  }

  void _onMicPressed() {
    // Implement your logic for microphone button here
    print('Microphone button pressed');
  }

  void _onAttachmentPressed() {
    // Implement your logic for attachment button here
    print('Attachment button pressed');
  }

  void _onCameraPressed() {
    // Implement your logic for camera button here
    print('Camera button pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.grey[300], // Set the background color
                borderRadius:
                    BorderRadius.circular(16), // Set the border radius
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      onChanged: (value) => _onTextChanged(),
                      decoration: const InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder
                            .none, // Remove the default underline border
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.camera_alt_outlined),
                    color: Colors.blue, // Set the icon color
                    onPressed: _onCameraPressed,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: _isTyping
                ? const Icon(Icons.send)
                : Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Transform.rotate(
                      alignment: Alignment.center,
                      angle: 0.785398,
                      child: IconButton(
                        icon: const Icon(Icons.attach_file),
                        color: Colors.blue, // Set the icon color
                        onPressed: _onAttachmentPressed,
                      ),
                    ),
                  ),
            color: _isTyping
                ? Theme.of(context)
                    .primaryColor // Use primary color for send icon
                : Colors.grey, // Set the icon color for microphone icon
            onPressed: _isTyping ? _sendMessage : _onMicPressed,
          ),
        ],
      ),
    );
  }
}

List<MessageModel> t = [
  MessageModel(
      messageId: '123',
      sender: 'Vincent',
      text: 'Hi how can we help ...',
      seen: true,
      sentTime: DateTime.now()),
  MessageModel(
      messageId: '123',
      sender: '123',
      text: 'User support pls i need ...',
      seen: true,
      sentTime: DateTime.now()),
  MessageModel(
      messageId: '123',
      sender: 'Vincent',
      text: 'What do you need',
      seen: true,
      sentTime: DateTime.now()),
  MessageModel(
      messageId: '123',
      sender: '123',
      text: 'To complete my project.',
      seen: true,
      sentTime: DateTime.now()),
];
