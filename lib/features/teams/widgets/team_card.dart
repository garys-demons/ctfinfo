import 'package:ctfinfo/constants/string_constants.dart';
import 'package:ctfinfo/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class TeamCard extends StatelessWidget {
  final String teamName;
  final String teamPoints;
  final String teamId;
  const TeamCard(
      {super.key,
      required this.teamName,
      required this.teamPoints,
      required this.teamId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Navigator.pushNamed(
          //   context,
          //   EventDetailScreen.id,
          //   arguments: eventId,
          // );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 35,
                child: CustomText(
                  txtTitle: teamName.substring(0, 1).toUpperCase(),
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    txtTitle: teamName.substring(
                        0, teamName.length > 20 ? 20 : teamName.length),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      CustomText(
                        txtTitle: "${StringConstants.teamId} :",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(width: 5),
                      CustomText(
                        txtTitle: teamId,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomText(
                        txtTitle: "${StringConstants.points} :",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(width: 5),
                      CustomText(
                        txtTitle: teamPoints,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
