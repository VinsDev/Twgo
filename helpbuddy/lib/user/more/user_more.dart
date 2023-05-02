import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/user/chat/models/user_model.dart';
import 'package:helpbuddy/user/chat/screens/chat_room.dart';
import 'package:helpbuddy/user/profile/profile_settings.dart';
import 'package:helpbuddy/utils/constant/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class UserMore extends StatefulWidget {
  const UserMore({Key? key}) : super(key: key);

  @override
  State<UserMore> createState() => _UserMoreState();
}

class _UserMoreState extends State<UserMore> {
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
        title: Text('More',
            style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Image.asset(
              'assets/images/Account Owner.png',
              height: 40,
              width: 40,
            ),
          ),
          Text('Ore Ademiniyi', style: ConstantTheme().bigBlueStyle),
          Text('contact @ oreademiniyi.com',
              style: ConstantTheme().defaultStyle),
          const SizedBox(
            height: 30,
          ),
          InkWell(
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
            child: MoreCard(
              text: 'Educational Consult',
              icon: MdiIcons.schoolOutline,
            ),
          ),
          InkWell(
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
            child: MoreCard(
              text: 'Accomodation Request',
              icon: MdiIcons.homeCityOutline,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const ProjectSettings()),
              );
            },
            child: MoreCard(
              text: 'Prefrences',
              icon: MdiIcons.tuneVariant,
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const ProjectSettings()),
                );
              },
              child: MoreCard(
                text: 'Account Security',
                icon: MdiIcons.lock,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width * .7,
                  lineHeight: 7.0,
                  percent: 0.5,
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  animation: true,
                  barRadius: const Radius.circular(30),
                  backgroundColor: Colors.grey,
                  progressColor: Color(0xff004852),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 55),
              child: Text('Excellent',
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color.fromARGB(255, 66, 66, 66),
                      letterSpacing: 0.6)),
            ),
          ]),
          InkWell(
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
            child: MoreCard(
              text: 'Customer Support',
              icon: MdiIcons.helpCircleOutline,
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, '/select-role',
                    ModalRoute.withName('/select-role'));
              },
              child: LogoutCard(text: 'logout', icon: MdiIcons.logout)),
        ],
      ),
    );
  }
}

class MoreCard extends StatelessWidget {
  MoreCard({Key? key, required this.text, this.icon}) : super(key: key);
  String text;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: const Color(0xff004852),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(text,
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black)),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Color(0xffA7A7AB),
            )
          ],
        ),
      ),
    );
  }
}

class LogoutCard extends StatelessWidget {
  LogoutCard({Key? key, required this.text, this.icon}) : super(key: key);
  String text;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 15,
        ),
        const Icon(
          Icons.logout,
          color: Colors.red,
          size: 40,
        ),
        const SizedBox(
          width: 18,
        ),
        Text('Logout',
            style: GoogleFonts.urbanist(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.red,
            ))
      ],
    );
  }
}
