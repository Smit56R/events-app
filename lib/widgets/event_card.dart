import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/event.dart';
import '../screens/event_details_screen.dart';

class EventCard extends StatelessWidget {
  final Event event;
  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EventDetailsScreen(event: event),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Theme.of(context).primaryColor,
                height: 92,
                width: 79,
                child: Hero(
                  tag: event.id,
                  child: Image.network(
                    event.bannerImgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            SizedBox(
              height: 85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${DateFormat('E, MMM d').format(event.dateTime)} • ${DateFormat('jm').format(event.dateTime)}',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Inter',
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    event.title.trim(),
                    softWrap: true,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(18, 13, 38, 1),
                      fontSize: 15,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        size: 14,
                        color: Color.fromRGBO(176, 177, 188, 1),
                      ),
                      SizedBox(
                        width: 220,
                        child: Text(
                          '${event.venueName} • ${event.venueCity}, ${event.venueCountry}',
                          softWrap: false,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13,
                              color: Color.fromRGBO(116, 118, 136, 1)),
                        ),
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
