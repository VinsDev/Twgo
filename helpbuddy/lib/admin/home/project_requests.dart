import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../api_client/api_client.dart';
import '../../mymodels/myusermodels.dart';

class ProjectRequests extends StatefulWidget {
  const ProjectRequests({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<ProjectRequests> createState() => _ProjectRequestsState();
}

class _ProjectRequestsState extends State<ProjectRequests> {
  List? projectsList;

  @override
  void initState() {
    super.initState();
    fetchProjects(widget.token).then((response) {
      setState(() {
        var t = response;
        projectsList = t.map((json) => Project.fromJson(json)).toList();
      });
    });
  }

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
          title: Text('Project Requests',
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
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ProjectsRequestsCard(data: 'abc@hotmail.com'),
                  Container(
                    width: double.maxFinite,
                    height: 1,
                    color: Colors.grey,
                  )
                ],
              );
            }));
  }
}

class ProjectsRequestsCard extends StatelessWidget {
  const ProjectsRequestsCard({Key? key, required this.data}) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Title',
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w400,
                // color: const Color(0xff2781E1),
                color: const Color.fromARGB(255, 116, 116, 116),
                fontSize: 14,
              )),
          Text('Intensity of sunlight',
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w500,
                // color: const Color(0xff2781E1),
                color: Colors.black,
                fontSize: 14,
              )),
          const SizedBox(
            height: 8,
          ),
          Text('Time limit: 2 Weeks',
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w500,
                // color: const Color(0xff2781E1),
                color: Colors.black,
                fontSize: 14,
              )),
          const SizedBox(
            height: 8,
          ),
          Text('£300',
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w500,
                // color: const Color(0xff2781E1),
                color: Colors.black,
                fontSize: 14,
              )),
          Text('Budget',
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w400,
                // color: const Color(0xff2781E1),
                color: Colors.black,
                fontSize: 14,
              )),
          const SizedBox(
            height: 8,
          ),
          Text('Posted 1 minute ago',
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w400,
                // color: const Color(0xff2781E1),
                color: const Color.fromARGB(255, 146, 146, 146),
                fontSize: 14,
              )),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(child: Container()),
              InkWell(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text('Accept',
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 14,
                        )),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

fetchProjects(String token) async {
  final response = await ApiClient(authToken: token).get('projects');
  return response;
}
