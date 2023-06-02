import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/utils/constant/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SuperAdminMore extends StatefulWidget {
  const SuperAdminMore({Key? key}) : super(key: key);

  @override
  State<SuperAdminMore> createState() => _SuperAdminMoreState();
}

class _SuperAdminMoreState extends State<SuperAdminMore> {
 

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
                fontSize: 18,
                color: Colors.black)),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              width: 110,
              child: Stack(children: [
                CircleAvatar(
                  radius: 55,
                  backgroundImage:
                      Image.asset('assets/images/Account Owner.png').image,
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: InkWell(
                    onTap: () {} /* => getImageFromGallery() */,
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(100)),
                      child: const Icon(
                        Icons.add_photo_alternate_sharp,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                )
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Ore Ademiniyi', style: ConstantTheme().bigBlueStyle),
            Text('contact @ oreademiniyi.com',
                style: ConstantTheme().defaultStyle),
            const SizedBox(
              height: 30,
            ),
            MoreCard(
                text: 'Educational Consult',
                icon: MdiIcons.schoolOutline,
                destination: () {}),
            MoreCard(
                text: 'Accomodation Request',
                icon: MdiIcons.homeCityOutline,
                destination: () {}),
            MoreCard(
                text: 'Advert Placement',
                icon: MdiIcons.speakerWireless,
                destination: () {}),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/super-admin/more/settings');
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                height: 50,
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.settings, size: 25),
                        const SizedBox(
                          width: 15,
                        ),
                        Text('Settings',
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
            ),
            const Spacer(
              flex: 2,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/select-role',
                    (Route<dynamic> route) => false,
                  );
                },
                child: LogoutCard(text: 'logout', icon: MdiIcons.logout)),
            const Spacer()
          ],
        ),
      ),
    );
  }
}

class MoreCard extends StatelessWidget {
  MoreCard({Key? key, required this.text, this.icon, required this.destination})
      : super(key: key);
  String text;
  IconData? icon;
  Function()? destination;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: destination,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        height: 50,
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, size: 25),
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
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 35,
              color: Colors.red,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(text,
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w200,
                    fontSize: 16,
                    color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
