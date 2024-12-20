import 'package:ctfinfo/constants/string_constants.dart';
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
          debugPrint("EventCard Clicked");
        },
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
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    txtTitle: eventName.substring(
                        0, eventName.length > 20 ? 20 : eventName.length),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      CustomText(
                        txtTitle: "${StringConstants.averageWeight} :",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(width: 5),
                      CustomText(
                        txtTitle: averageWeight,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  CustomText(
                    txtTitle:
                        "${DateTimeUtils.getFormattedDate(startDate)} - ${DateTimeUtils.getFormattedDate(endDate)}",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                    maxLine: 2,
                    textOverflow: TextOverflow.ellipsis,
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
