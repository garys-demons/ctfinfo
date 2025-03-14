import 'package:ctfinfo/constants/string_constants.dart';
import 'package:ctfinfo/features/event/screens/event_detail_screen.dart';
import 'package:ctfinfo/utils/date_time_utils.dart';
import 'package:ctfinfo/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String eventId;
  final String eventName;
  final String imageUrl;
  final String averageWeight;
  final String startDate;
  final String endDate;
  const EventCard({
    super.key,
    required this.eventName,
    required this.imageUrl,
    required this.averageWeight,
    required this.startDate,
    required this.endDate,
    required this.eventId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            EventDetailScreen.id,
            arguments: eventId,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: imageUrl.isNotEmpty
                      ? NetworkImage(
                          imageUrl,
                        )
                      : NetworkImage(
                          "https://images.ctfassets.net/aoyx73g9h2pg/3H8sLBKCH7xIph1YZmjFvd/8292d73649a27a4eb65724fa1df629f7/10684-1024x575.jpg?w=3840&q=100"),
                  radius: 35,
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      txtTitle: eventName.substring(
                          0, eventName.length > 20 ? 20 : eventName.length),
                      style: Theme.of(context).textTheme.headlineSmall,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        CustomText(
                          txtTitle: "${StringConstants.averageWeight} :",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(width: 5),
                        CustomText(
                          txtTitle: averageWeight,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    CustomText(
                      txtTitle:
                          "${DateTimeUtils.getFormattedDate(startDate)} - ${DateTimeUtils.getFormattedDate(endDate)}",
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLine: 2,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
