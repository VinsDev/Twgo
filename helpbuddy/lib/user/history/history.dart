import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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
          title: Text('History',
              style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.black)),
          centerTitle: true,
        ),
        body: ListView.builder(
            padding: const EdgeInsets.only(top: 20),
            itemCount: 10,
            itemBuilder: (BuildContext context, int int) {
              return const HistoryCard(data: 'abc@hotmail.com');
            }));
  }
}

class HistoryCard extends StatelessWidget {
  const HistoryCard({Key? key, required this.data}) : super(key: key);
  // QueryDocumentSnapshot<Object?>? data;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.only(right: 20, top: 10),
      decoration: const BoxDecoration(
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
                  Text('History Details',
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: const Color(0xff686868))),
                ],
              )
            ],
          ),
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
        ],
      ),
    );
  }
}
