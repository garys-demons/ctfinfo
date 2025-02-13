import 'package:ctfinfo/features/bottonnavbar/bottom_nav_bar.dart';
// import 'package:ctfinfo/features/teams/screens/your_team_screen.dart';
import 'package:ctfinfo/utils/shared_preferences.dart';
import 'package:ctfinfo/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class TeamidInputScreen extends StatefulWidget {
  static const String id = "/teamid-input-screen";
  const TeamidInputScreen({super.key});

  @override
  State<TeamidInputScreen> createState() => _TeamidInputScreenState();
}

class _TeamidInputScreenState extends State<TeamidInputScreen> {
  final TextEditingController _teamIdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  int teamId = 0000;

  @override
  void initState() {
    super.initState();
    _initializeTeamId();
  }

  Future<void> _initializeTeamId() async {
    await SharedPreferencesDemo.init();
    int savedTeamId =
        SharedPreferencesDemo.getInt(SharedPreferencesDemo.teamId);
    if (savedTeamId > 0) {
      setState(() {
        teamId = savedTeamId;
        _teamIdController.text = teamId.toString();
      });
    }
  }

  Future<void> _saveTeamId() async {
    int teamId = int.tryParse(_teamIdController.text) ?? 0;
    await SharedPreferencesDemo.setInt(SharedPreferencesDemo.teamId, teamId);
    await SharedPreferencesDemo.saveTeamId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                const SizedBox(width: 10.0),
                const CustomText(
                  txtTitle: "Your Team",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _teamIdController,
                    decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 2.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 2.0)))
                        .copyWith(hintText: 'Enter Your CTF TeamID'),
                    onChanged: (value) {
                      setState(() {
                        teamId = int.tryParse(value) ?? 0;
                      });
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
                        onPressed: () async {
                          await _saveTeamId();
                          // Navigator.pushNamed(
                          //   context,
                          //   BottomNavBar.id);
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
                          Navigator.pushNamed(context, BottomNavBar.id);
                        },
                        child: CustomText(
                          txtTitle: 'Add Later',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
