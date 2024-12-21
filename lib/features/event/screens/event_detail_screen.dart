import 'package:ctfinfo/constants/string_constants.dart';
import 'package:ctfinfo/features/event/provider/event_provider.dart';
import 'package:ctfinfo/utils/date_time_utils.dart';
import 'package:ctfinfo/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailScreen extends StatefulWidget {
  static const String id = "/event_detail_screen";
  final String eventId;
  const EventDetailScreen({super.key, required this.eventId});

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  final _eventProvider = EventProvider();

  @override
  void initState() {
    super.initState();
    _eventProvider.getEventDetail(widget.eventId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider(
        create: (context) => _eventProvider,
        child: Consumer<EventProvider>(
          builder: (context, eventProvider, child) {
            if (eventProvider.eventDetail.id == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return _buildUI(eventProvider);
          },
        ),
      ),
    );
  }

  SafeArea _buildUI(EventProvider value) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: FooterView(
          footer: Footer(
            backgroundColor: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (!await launchUrl(
                        Uri.parse(value.eventDetail.url.toString()))) {
                      throw Exception('Could not launch');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: CustomText(
                    txtTitle: StringConstants.openWebsite,
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    if (!await launchUrl(
                        Uri.parse(value.eventDetail.ctftimeUrl.toString()))) {
                      throw Exception('Could not launch');
                    }
                  },
                  child: CustomText(
                    txtTitle: StringConstants.viewOnCtfTimes,
                  ),
                ),
              ],
            ),
          ),
          children: [
            const SizedBox(height: 20),
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
                const SizedBox(width: 10),
                const CustomText(
                  txtTitle: "CTF Detail",
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
                    backgroundImage: value.eventDetail.logo!.isNotEmpty
                        ? NetworkImage(
                            value.eventDetail.logo!,
                          )
                        : NetworkImage(
                            "https://images.ctfassets.net/aoyx73g9h2pg/3H8sLBKCH7xIph1YZmjFvd/8292d73649a27a4eb65724fa1df629f7/10684-1024x575.jpg?w=3840&q=100"),
                    radius: 50,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    txtTitle: value.eventDetail.title ?? "Event Name",
                    textOverflow: TextOverflow.visible,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const CustomText(
                  txtTitle: "${StringConstants.start} :",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                CustomText(
                  txtTitle:
                      "${DateTimeUtils.getFormattedDate(value.eventDetail.start.toString())} - ${DateTimeUtils.getFormattedTime(value.eventDetail.start.toString())} UTC",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const CustomText(
                  txtTitle: "${StringConstants.end} :",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                CustomText(
                  txtTitle:
                      "${DateTimeUtils.getFormattedDate(value.eventDetail.finish.toString())} - ${DateTimeUtils.getFormattedTime(value.eventDetail.finish.toString())} UTC",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const CustomText(
                  txtTitle: "${StringConstants.averageWeight} :",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                CustomText(
                  txtTitle: value.eventDetail.weight.toString(),
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const CustomText(
                  txtTitle: "${StringConstants.participants} :",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                CustomText(
                  txtTitle: value.eventDetail.participants.toString(),
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const CustomText(
                  txtTitle: "${StringConstants.format} :",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                CustomText(
                  txtTitle: value.eventDetail.format ?? "Format",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const CustomText(
                  txtTitle: "${StringConstants.mode} :",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                CustomText(
                  txtTitle:
                      value.eventDetail.onsite == true ? "Onsite" : "Online",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),
            value.eventDetail.location != ""
                ? Row(
                    children: [
                      const CustomText(
                        txtTitle: "${StringConstants.location} :",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      CustomText(
                        txtTitle: value.eventDetail.location,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
