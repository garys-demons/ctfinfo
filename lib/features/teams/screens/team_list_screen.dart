import 'package:ctfinfo/features/teams/provider/team_provider.dart';
import 'package:ctfinfo/features/teams/widgets/team_card.dart';
import 'package:ctfinfo/widgets/custom_scaffold.dart';
import 'package:ctfinfo/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeamListScreen extends StatefulWidget {
  static const String id = "/team_list_screen";
  const TeamListScreen({super.key});

  @override
  State<TeamListScreen> createState() => _TeamListScreenState();
}

class _TeamListScreenState extends State<TeamListScreen> {
  final _teamProvider = TeamProvider();
  @override
  void initState() {
    super.initState();
    _teamProvider.getAllTeams();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ChangeNotifierProvider(
        create: (context) => _teamProvider,
        child: Consumer<TeamProvider>(
          builder: (context, value, child) {
            if (value.topTeams.l2025 == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return _buildUI(value);
          },
        ),
      ),
    );
  }

  SafeArea _buildUI(TeamProvider value) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: CustomText(
                txtTitle: 'Top Teams',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: value.topTeams.l2025!.length,
              itemBuilder: (context, index) {
                return TeamCard(
                    teamName: value.topTeams.l2025![index].teamName ?? "",
                    teamPoints: value.topTeams.l2025![index].points.toString(),
                    teamId: value.topTeams.l2025![index].teamId.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
