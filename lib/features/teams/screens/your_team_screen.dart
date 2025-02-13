import 'package:ctfinfo/constants/string_constants.dart';
import 'package:ctfinfo/features/teams/provider/team_provider.dart';
import 'package:ctfinfo/features/teams/screens/teamid_input_screen.dart';
import 'package:ctfinfo/utils/shared_preferences.dart';
import 'package:ctfinfo/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourTeamScreen extends StatefulWidget {
  static const String id = "/your_team_screen";
  const YourTeamScreen({super.key});

  @override
  State<YourTeamScreen> createState() => _YourTeamScreenState();
}

class _YourTeamScreenState extends State<YourTeamScreen> {
  String? teamId;
  late TeamProvider _teamProvider;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _teamProvider = Provider.of<TeamProvider>(context, listen: false);
    _loadTeamId();
  }

  Future<void> _loadTeamId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var storedTeamId = prefs.get('teamId');

    setState(() {
      if (storedTeamId is String) {
        teamId = storedTeamId;
      } else if (storedTeamId is int) {
        teamId = storedTeamId.toString();
      } else {
        teamId = null;
      }
    });

    if (teamId != null) {
      await _teamProvider.getTeamDetail(teamId!);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Consumer<TeamProvider>(
              builder: (context, teamProvider, child) {
                return _buildUI(teamProvider);
              },
            ),
    );
  }

  SafeArea _buildUI(TeamProvider value) {
    var rating2024 = value.data2024;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomText(
                txtTitle: 'Your Team',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    //logo
                    backgroundImage: (teamId != null &&
                            value.teamDetail.logo != null &&
                            value.teamDetail.logo!.isNotEmpty)
                        ? NetworkImage(value.teamDetail.logo!)
                        : const NetworkImage(
                            "https://images.ctfassets.net/aoyx73g9h2pg/3H8sLBKCH7xIph1YZmjFvd/8292d73649a27a4eb65724fa1df629f7/10684-1024x575.jpg?w=3840&q=100"),
                    radius: 100.0,
                  ),
                  const SizedBox(height: 20.0),
                  CustomText(
                    //team name
                    txtTitle: (teamId != null && value.teamDetail.name != null)
                        ? value.teamDetail.name!
                        : "Team Name",
                    textOverflow: TextOverflow.visible,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  //teamId
                  Row(
                    children: [
                      const CustomText(
                        txtTitle: "${StringConstants.teamId} :",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      CustomText(
                        txtTitle: teamId ?? StringConstants.notAvailable,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  //country
                  Row(
                    children: [
                      const CustomText(
                        txtTitle: "${StringConstants.country} :",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      CustomText(
                        txtTitle: (teamId != null &&
                                value.teamDetail.country != null &&
                                value.teamDetail.country!.isNotEmpty)
                            ? value.teamDetail.country!
                            : StringConstants.notAvailable,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  //rating place
                  Row(
                    children: [
                      const CustomText(
                        txtTitle: "${StringConstants.ratingPlace} :",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      CustomText(
                        txtTitle: (teamId != null &&
                                rating2024 != null &&
                                rating2024['rating_place'] != null)
                            ? rating2024['rating_place'].toString()
                            : StringConstants.notAvailable,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  //organizer points
                  Row(
                    children: [
                      const CustomText(
                        txtTitle: "${StringConstants.organizerPoints} :",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      CustomText(
                        txtTitle: (teamId != null &&
                                rating2024 != null &&
                                rating2024['organizer_points'] != null)
                            ? rating2024['organizer_points'].toString()
                            : StringConstants.notAvailable,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  //rating points
                  Row(
                    children: [
                      const CustomText(
                        txtTitle: "${StringConstants.ratingPoints} :",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      CustomText(
                        txtTitle: (teamId != null &&
                                rating2024 != null &&
                                rating2024['rating_points'] != null)
                            ? rating2024['rating_points'].toString()
                            : StringConstants.notAvailable,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  //country place
                  Row(
                    children: [
                      const CustomText(
                        txtTitle: "${StringConstants.countryPlace} :",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      CustomText(
                        txtTitle: (teamId != null &&
                                rating2024 != null &&
                                rating2024['country_place'] != null)
                            ? rating2024['country_place'].toString()
                            : StringConstants.notAvailable,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            Footer(
              backgroundColor: Colors.transparent,
              child: Center(
                child: _buttons(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buttons() {
    if (teamId != null) {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            setState(() {
              SharedPreferencesDemo.clear();
            });
          },
          child: CustomText(
            txtTitle: 'Clear Data',
          ));
    } else {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: _showSettingsPanel,
          child: CustomText(
            txtTitle: 'Add Team',
          ));
    }
  }

  void _showSettingsPanel() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Your Team",
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Material(
            child: Container(
              width: 350,
              height: 400,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: TeamidInputScreen(),
            ),
          ),
        );
      },
    );
  }
}
