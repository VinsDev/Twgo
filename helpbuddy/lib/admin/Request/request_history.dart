import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/widget/button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RequestHistory extends StatefulWidget {
  const RequestHistory({Key? key}) : super(key: key);

  @override
  State<RequestHistory> createState() => _RequestHistoryState();
}

class _RequestHistoryState extends State<RequestHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
          title: Text('Request History',
              style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.black)),
          centerTitle: true,
        ),
        body: ListView.builder(
            padding: EdgeInsets.only(top: 20),
            itemCount: 10,
            itemBuilder: (BuildContext context, int int) {
              return const RequestCard(data: 'abc@hotmail.com');
            }));
  }
}

class RequestCard extends StatelessWidget {
  const RequestCard({Key? key, required this.data}) : super(key: key);
  // QueryDocumentSnapshot<Object?>? data;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.only(right: 20, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 243, 243, 243),
            blurRadius: 2,
            offset: Offset(0.0, 2.0),
          ),
        ],
      ),
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 5, height: 90, color: Colors.green),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data,
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Request History',
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: const Color(0xff686868))),
                ],
              )
            ],
          ),
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(color: Color(0xffD9FFEF)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('Complete',
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: const Color(0xff006C3F))),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text('D  H  M  S'),
              const Text('27:15:09:02'),
            ],
          ),
        ],
      ),
    );
  }
}
