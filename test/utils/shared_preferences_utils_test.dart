import 'package:ctfinfo/features/teams/models/team_detail_model.dart';
import 'package:ctfinfo/utils/shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await SharedPreferencesUtils.init();
  });

  test('setInt and getInt', () async {
    await SharedPreferencesUtils.setInt('testInt', 42);
    expect(SharedPreferencesUtils.getInt('testInt'), 42);
  });

  test('setString and getString', () async {
    await SharedPreferencesUtils.setString('testString', 'Hello');
    expect(SharedPreferencesUtils.getString('testString'), 'Hello');
  });

  test('set and get TeamDetailModel', () async {
    Map<String, Rating>? testRating = {
      'Test Rating': Rating(
        countryPlace: 1,
        organizerPoints: 1,
        ratingPlace: 1,
        ratingPoints: 1,
      )
    };
    final team = TeamDetailModel(
        id: 1,
        name: 'Test Team',
        country: 'Test Country',
        logo: 'Test Logo',
        rating: testRating);
    await SharedPreferencesUtils.setTeamDetail('teamDetail', team);
    final retrievedTeam = SharedPreferencesUtils.getModel<TeamDetailModel>(
        'teamDetail', (json) => TeamDetailModel.fromJson(json));
    expect(retrievedTeam, isNotNull);
    expect(retrievedTeam!.id, 1);
    expect(retrievedTeam.name, 'Test Team');
    expect(retrievedTeam.country, 'Test Country');
    expect(retrievedTeam.logo, 'Test Logo');
    // expect(retrievedTeam.rating, testRating);  // For this we need to override == in rating class

    final team2 = TeamDetailModel(
      id: 1,
      name: 'Test Team',
    );
    await SharedPreferencesUtils.setTeamDetail('teamDetail', team2);
    final retrievedTeam2 = SharedPreferencesUtils.getModel<TeamDetailModel>(
        'teamDetail', (json) => TeamDetailModel.fromJson(json));
    expect(retrievedTeam2, isNotNull);
    expect(retrievedTeam2!.id, 1);
    expect(retrievedTeam2.name, 'Test Team');
  });

  test('saveTeamId and isTeamIdSaved', () async {
    await SharedPreferencesUtils.saveTeamId();
    expect(SharedPreferencesUtils.isTeamIdSaved(), true);
  });

  test('remove key', () async {
    await SharedPreferencesUtils.setString('tempKey', 'tempValue');
    expect(SharedPreferencesUtils.getString('tempKey'), 'tempValue');

    await SharedPreferencesUtils.remove('tempKey');
    expect(SharedPreferencesUtils.getString('tempKey'), '');
  });

  test('clear all preferences', () async {
    await SharedPreferencesUtils.setInt('testInt', 10);
    await SharedPreferencesUtils.setString('testString', 'test');

    await SharedPreferencesUtils.clear();

    expect(SharedPreferencesUtils.getInt('testInt'), 0);
    expect(SharedPreferencesUtils.getString('testString'), '');
  });
}
