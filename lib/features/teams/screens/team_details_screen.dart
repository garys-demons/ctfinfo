import 'package:ctfinfo/constants/string_constants.dart';
import 'package:ctfinfo/features/teams/provider/team_provider.dart';
import 'package:ctfinfo/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeamDetailsScreen extends StatefulWidget {
  static const String id = "/team-details-screen";
  final String teamId;
  const TeamDetailsScreen({
    super.key,
    required this.teamId,
  });

  @override
  State<TeamDetailsScreen> createState() => _TeamDetailsScreenState();
}

class _TeamDetailsScreenState extends State<TeamDetailsScreen> {
  final _teamProvider = TeamProvider();

  @override
  void initState() {
    super.initState();
    _teamProvider.getTeamDetail(widget.teamId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider(
        create: (context) => _teamProvider,
        child: Consumer<TeamProvider>(
          builder: (context, teamProvider, child) {
            if (teamProvider.teamDetail.id == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            var rating2024 = teamProvider.data2024;
            if (rating2024 == null) {
              return Center(
                child: Text('No Rating Data for 2024 Available'),
              );
            }
            return _buildUI(teamProvider, rating2024);
          },
        ),
      ),
    );
  }

  SafeArea _buildUI(TeamProvider value, var rating2024) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
                const SizedBox(width: 10.0),
                const CustomText(
                  txtTitle: "Team Detail",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    //logo
                    backgroundImage: value.teamDetail.logo!.isNotEmpty
                        ? NetworkImage(value.teamDetail.logo!)
                        : NetworkImage(
                            "https://images.ctfassets.net/aoyx73g9h2pg/3H8sLBKCH7xIph1YZmjFvd/8292d73649a27a4eb65724fa1df629f7/10684-1024x575.jpg?w=3840&q=100"),
                    radius: 100.0,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //team name
                  CustomText(
                    txtTitle: value.teamDetail.name ?? "Team Name",
                    textOverflow: TextOverflow.visible,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  //teamid
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      const CustomText(
                        txtTitle: "${StringConstants.teamId} :",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      CustomText(
                        txtTitle: value.teamDetail.id.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  //Country
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      const CustomText(
                        txtTitle: "${StringConstants.country} :",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      value.teamDetail.country == ""
                          ? CustomText(
                              txtTitle: StringConstants.notAvailable,
                              style: TextStyle(fontSize: 16),
                            )
                          : CustomText(
                              txtTitle: value.teamDetail.country,
                              style: TextStyle(fontSize: 16),
                            ),
                    ],
                  ),
                  //rating place
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      const CustomText(
                        txtTitle: "${StringConstants.ratingPlace} :",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      rating2024['rating_place'] != null
                          ? CustomText(
                              txtTitle: rating2024['rating_place'].toString(),
                              style: TextStyle(fontSize: 16),
                            )
                          : CustomText(
                              txtTitle: StringConstants.notAvailable,
                              style: TextStyle(fontSize: 16),
                            ),
                    ],
                  ),
                  //organizer points
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      const CustomText(
                        txtTitle: "${StringConstants.organizerPoints} :",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      rating2024['organizer_points'] != null
                          ? CustomText(
                              txtTitle:
                                  rating2024['organizer_points'].toString(),
                              style: TextStyle(fontSize: 16),
                            )
                          : CustomText(
                              txtTitle: StringConstants.notAvailable,
                              style: TextStyle(fontSize: 16),
                            ),
                    ],
                  ),
                  //rating points
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      const CustomText(
                        txtTitle: "${StringConstants.ratingPoints} :",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      rating2024['rating_points'] != null
                          ? CustomText(
                              txtTitle: rating2024['rating_points'].toString(),
                              style: TextStyle(fontSize: 16),
                            )
                          : CustomText(
                              txtTitle: StringConstants.notAvailable,
                              style: TextStyle(fontSize: 16),
                            ),
                    ],
                  ),
                  //country place
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      const CustomText(
                        txtTitle: "${StringConstants.countryPlace} :",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      rating2024['country_place'] != null
                          ? CustomText(
                              txtTitle: rating2024['country_place'].toString(),
                              style: TextStyle(fontSize: 16),
                            )
                          : CustomText(
                              txtTitle: StringConstants.notAvailable,
                              style: TextStyle(fontSize: 16),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
