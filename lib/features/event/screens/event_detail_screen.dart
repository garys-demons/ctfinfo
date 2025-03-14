import 'package:ctfinfo/constants/image_constants.dart';
import 'package:ctfinfo/constants/string_constants.dart';
import 'package:ctfinfo/features/event/provider/event_provider.dart';
import 'package:ctfinfo/style/pallet.dart';
import 'package:ctfinfo/utils/date_time_utils.dart';
import 'package:ctfinfo/widgets/custom_button.dart';
import 'package:ctfinfo/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
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
      // backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConstants.bgPrimary),
            fit: BoxFit.cover,
          ),
        ),
        child: ChangeNotifierProvider(
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
      ),
    );
  }

  SafeArea _buildUI(EventProvider value) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    color: Pallet.greenColour,
                  ),
                ),
                const SizedBox(width: 10),
                CustomText(
                  txtTitle: "CTF Detail",
                  style: Theme.of(context).textTheme.headlineLarge,
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
                    radius: 100.0,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    txtTitle: value.eventDetail.title ?? "Event Name",
                    textOverflow: TextOverflow.visible,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CustomText(
                  txtTitle: "${StringConstants.start} :",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(width: 10),
                CustomText(
                  txtTitle:
                      "${DateTimeUtils.getFormattedDate(value.eventDetail.start.toString())} - ${DateTimeUtils.getFormattedTime(value.eventDetail.start.toString())} UTC",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CustomText(
                  txtTitle: "${StringConstants.end} :",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(width: 10),
                CustomText(
                  txtTitle:
                      "${DateTimeUtils.getFormattedDate(value.eventDetail.finish.toString())} - ${DateTimeUtils.getFormattedTime(value.eventDetail.finish.toString())} UTC",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CustomText(
                  txtTitle: "${StringConstants.averageWeight} :",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(width: 10),
                CustomText(
                  txtTitle: value.eventDetail.weight.toString(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CustomText(
                  txtTitle: "${StringConstants.participants} :",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(width: 10),
                CustomText(
                  txtTitle: value.eventDetail.participants.toString(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CustomText(
                  txtTitle: "${StringConstants.format} :",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(width: 10),
                CustomText(
                  txtTitle: value.eventDetail.format ?? "Format",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CustomText(
                  txtTitle: "${StringConstants.mode} :",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(width: 10),
                CustomText(
                  txtTitle:
                      value.eventDetail.onsite == true ? "Onsite" : "Online",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 10),
            value.eventDetail.location != ""
                ? Row(
                    children: [
                      CustomText(
                        txtTitle: "${StringConstants.location} :",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(width: 10),
                      CustomText(
                        txtTitle: value.eventDetail.location,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  )
                : SizedBox(),
            const SizedBox(height: 150.0,),
            Footer(
              backgroundColor: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: StringConstants.openWebsite, 
                    onPressed: () async {
                        if (!await launchUrl(
                            Uri.parse(value.eventDetail.url.toString()))) {
                          throw Exception('Could not launch');
                        }
                      },
                    ),
                  const SizedBox(width: 10),
                  CustomButton(
                    text: StringConstants.viewOnCtfTimes, 
                    onPressed: () async {
                      if (!await launchUrl(
                          Uri.parse(value.eventDetail.ctftimeUrl.toString()))) {
                        throw Exception('Could not launch');
                      }
                    },
                    )
                ],
              ),
          ),
          ],
        )
      ),
    );
  }
}

         
