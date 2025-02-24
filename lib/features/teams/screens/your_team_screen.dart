import 'package:ctfinfo/constants/string_constants.dart';
import 'package:ctfinfo/features/teams/provider/team_provider.dart';
import 'package:ctfinfo/utils/shared_preferences.dart';
import 'package:ctfinfo/utils/validator.dart';
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
  final TextEditingController _teamIdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _teamProvider = Provider.of<TeamProvider>(context, listen: false);
    _loadTeamDetails();
    _initializeTeamId();
  }

  Future<void> _initializeTeamId() async {
    await SharedPreferencesDemo.init();
    String savedTeamId =
        SharedPreferencesDemo.getString(SharedPreferencesDemo.teamId);
    if (savedTeamId.isNotEmpty) {
      setState(() {
        teamId = savedTeamId;
      });
    }
  }

  Future<void> _saveTeamId() async {
    String teamId = _teamIdController.text;
    await SharedPreferencesDemo.setString(SharedPreferencesDemo.teamId, teamId);
    await SharedPreferencesDemo.saveTeamId();
    _loadTeamDetails();
    setState(() {});
  }

  Future<void> _loadTeamDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedTeamId = prefs.getString('teamId');

    if (storedTeamId != null) {
      await _teamProvider.getTeamDetail(storedTeamId);
    }
  }

  Future<void> _clearTeamId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('teamId');
    setState(() {
      teamId = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body
          // : isLoading
          //     ? const Center(child: CircularProgressIndicator())
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
              height: 150,
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
          onPressed: _clearTeamId,
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
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const CustomText(
                  txtTitle: 'Enter Your Team ID',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: _teamIdController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 2.0),
                    ),
                  ).copyWith(hintText: 'Enter Your CTF TeamID'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your CTF team ID';
                    } else if (!Validator.isDigit(teamId: value)) {
                      return 'Please enter your valid CTF team ID';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _saveTeamId();
                          Navigator.pop(context);
                          setState(() {});
                        }
                      },
                      child: CustomText(
                        txtTitle: 'Save',
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: CustomText(
                        txtTitle: 'Cancel',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
