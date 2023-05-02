import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/user/chat/models/user_model.dart';
import 'package:helpbuddy/user/chat/screens/chat_room.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UserMessages extends StatefulWidget {
  const UserMessages({Key? key}) : super(key: key);

  @override
  State<UserMessages> createState() => _UserMessagesState();
}

class _UserMessagesState extends State<UserMessages> {
  UserModel? userModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 16,
          ),
        ),
        title: Text('Chats',
            style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 23, 81, 143),
                fontSize: 15,
                letterSpacing: 0.6)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Text('Chats',
                    style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff2781E1),
                        fontSize: 14,
                        letterSpacing: 0.6)),
                Expanded(child: Container()),
                Text('Broadcast Messages',
                    style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff2781E1),
                        fontSize: 14,
                        letterSpacing: 0.6)),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MessageCard(
            text: 'Henry Tisdale',
            icon: MdiIcons.schoolOutline,
          ),
          MessageCard(
            text: 'Henry Tisdale',
            icon: MdiIcons.schoolOutline,
          ),
          MessageCard(
            text: 'Henry Tisdale',
            icon: MdiIcons.schoolOutline,
          ),
          MessageCard(
            text: 'Henry Tisdale',
            icon: MdiIcons.schoolOutline,
          ),
          MessageCard(
            text: 'Henry Tisdale',
            icon: MdiIcons.schoolOutline,
          ),
        ],
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  MessageCard({Key? key, required this.text, this.icon}) : super(key: key);
  String text;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatRoom(
                  userModel: UserModel(
                      userId: '123',
                      userName: 'Omolola',
                      userEmail: 'a@g',
                      phoneNumber: '1',
                      gender: 'Male',
                      firstName: 'Omo',
                      lastName: 'Lola',
                      amount: '123',
                      userDpUrl: 'assets/images/Account Owner.png',
                      password: '123',
                      isOnline: true,
                      role: 'user',
                      nationality: 'NG'),
                  targetUser: UserModel(
                      userId: '123',
                      userName: 'Omolola',
                      userEmail: 'a@g',
                      phoneNumber: '1',
                      gender: 'Male',
                      firstName: 'Omo',
                      lastName: 'Lola',
                      amount: '123',
                      userDpUrl: 'assets/images/Account Owner.png',
                      password: '123',
                      isOnline: true,
                      role: 'user',
                      nationality: 'NG')),
            ));
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/Account Owner.png',
                  height: 50,
                  width: 50,
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(text,
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: Colors.black)),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(text,
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: const Color.fromARGB(255, 143, 143, 143))),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text('Delivered',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            fontSize: 12,
                            color: /* Color.fromARGB(255, 160, 160, 160) */
                                Color(0xff2781E1))),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('06:09',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: const Color.fromARGB(255, 143, 143, 143))),
                const SizedBox(
                  height: 4,
                ),
                CircleAvatar(
                  radius: 11,
                  child: Text('3',
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
