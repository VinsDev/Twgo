import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/admin/chat/plagiarism/plagiarism.dart';
import 'package:helpbuddy/constants/dimensions.dart';
import 'package:helpbuddy/user/chat/models/message_model.dart';
import 'package:helpbuddy/user/chat/screens/change_delivery_date.dart';
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

  bool blocked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
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
                        ? Image.asset(
                            widget.targetUser.userDpUrl.toString(),
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
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/icons/verified.png',
                      width: 20,
                      height: 20,
                    )
                  ],
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
                                child: Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          currentMessage.sender ==
                                                  widget.userModel.userId
                                              ? CrossAxisAlignment.end
                                              : CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          constraints: const BoxConstraints(
                                            maxWidth: 250,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: (currentMessage.sender ==
                                                    widget.userModel.userId)
                                                ? const Color.fromARGB(
                                                    73, 9, 43, 110)
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
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: currentMessage.sender ==
                                                      widget.userModel.userId
                                                  ? 0
                                                  : 35),
                                          child: Text(
                                            //  + ${DateTime.parse(currentMessage.sentTime.toString()).second} + ${DateTime.parse(currentMessage.sentTime.toString()).millisecond}
                                            (widget.reason == 'formA' ||
                                                        widget.reason ==
                                                            'get-to-work') &&
                                                    currentMessage.sender !=
                                                        widget.userModel.userId
                                                ? 'Support: ${timeFormat.format(currentMessage.sentTime!)}'
                                                : timeFormat.format(
                                                    currentMessage.sentTime!),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Color.fromARGB(
                                                  255, 7, 33, 145),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    currentMessage.sender ==
                                            widget.userModel.userId
                                        ? Container()
                                        : Positioned(
                                            bottom: 0,
                                            left: 0,
                                            child: Image.asset(
                                              widget.targetUser.userDpUrl
                                                  .toString(),
                                              width: 30,
                                              height: 30,
                                            ),
                                          )
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
                blocked
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 20.0),
                            child: Text(
                              'Chats blocked',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      )
                    : MessageInputField(
                        notifierRef: chatNotifierValue,
                        controller: scrollController,
                      )
              ],
            ),
            widget.reason == 'formA' || widget.reason == 'get-to-work'
                ? Container()
                : Align(
                    alignment: Alignment.topRight,
                    child: Stack(
                      children: [
                        clicked
                            ? Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                    margin: const EdgeInsets.only(
                                        right: 8.0, bottom: 10, top: 30),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF0053A1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          optionItem(
                                              'Change delivery date',
                                              const ChangeDate(),
                                              Image.asset(
                                                  'assets/icons/date.png')),
                                          InkWell(
                                            onTap: () =>
                                                addBalanceModal(context),
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 3),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 10),
                                              decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    19, 0, 49, 94),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset(
                                                      'assets/icons/payment.png'),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Text(
                                                    'Make Payments',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                blocked = true;
                                              });
                                            },
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 3),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 10),
                                              decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    19, 0, 49, 94),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset(
                                                      'assets/icons/block.png'),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Text(
                                                    'Block',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ])),
                              )
                            : Container(),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
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
                              margin:
                                  const EdgeInsets.only(top: 8.0, right: 8.0),
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
                        ),
                      ],
                    ))
          ],
        ),
      ),
    );
  }

  Widget optionItem(String title, Widget destination, Image icon) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => destination));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 3),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: const BoxDecoration(
          color: Color.fromARGB(19, 0, 49, 94),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
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

void addBalanceModal(BuildContext context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40 * factor),
            topRight: Radius.circular(40 * factor)),
      ),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(left: 30 * factor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Container()),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 15.0 * factor, right: 15.0 * factor),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.clear_rounded,
                          size: 30 * factor,
                        )),
                  )
                ],
              ),
              balanceLabels('Your Total balance:', '£1000'),
              balanceLabels('Amount Deposited:', '£750'),
              balanceLabels('Referral Bonus:', '£250'),
              Text('*Note that 1twgo = £20',
                  style: GoogleFonts.urbanist(
                    fontSize: 14 * factor,
                    color: const Color.fromARGB(255, 129, 129, 129),
                    fontWeight: FontWeight.w600,
                  )),
              Expanded(child: Container()),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, '/user/add-balance/make-payment');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 8 * factor, horizontal: 12 * factor),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12 * factor),
                          color: const Color(0xff2781E1)),
                      child: Center(
                        child: Text('Add balance',
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 14 * factor,
                            )),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 8 * factor, horizontal: 12 * factor),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12 * factor),
                          border: Border.all(
                              color: const Color.fromARGB(255, 37, 37, 37),
                              width: 1.2 * factor)
                          // color: const Color(0xff2781E1)
                          ),
                      child: Center(
                        child: Text('View history',
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w400,
                              color: const Color.fromARGB(255, 37, 37, 37),
                              fontSize: 14 * factor,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30 * factor,
                  )
                ],
              ),
              SizedBox(
                height: 20 * factor,
              )
            ],
          ),
        );
      });
}

Widget balanceLabels(String label, String balance) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.urbanist(
          fontSize: 16 * factor,
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox(
        height: 4 * factor,
      ),
      Text(balance,
          style: TextStyle(
              fontSize: 32 * factor,
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(255, 85, 85, 85))),
      SizedBox(
        height: 12 * factor,
      )
    ],
  );
}
