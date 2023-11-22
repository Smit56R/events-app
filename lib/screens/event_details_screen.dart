import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

import '../models/event.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;
  const EventDetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: 58,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromRGBO(86, 105, 255, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text(
            'BOOK NOW',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            foregroundColor: Colors.white,
            expandedHeight: 244,
            pinned: true,
            title: const Text(
              'Event Details',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 24,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: event.id,
                child: Image.network(
                  event.bannerImgUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                height: 36,
                width: 36,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_rounded,
                    color: Colors.white,
                    size: 21,
                  ),
                ),
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Text(
                    event.title,
                    softWrap: true,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 35,
                    ),
                  ),
                  ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: 48,
                        width: 48,
                        child: Image.network(
                          event.organiserIconUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      event.organiserName,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15,
                        color: Color.fromRGBO(13, 12, 38, 1),
                      ),
                    ),
                    subtitle: const Text(
                      'The Organizer',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        color: Color.fromRGBO(112, 110, 143, 1),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: 48,
                        width: 48,
                        child: Image.asset(
                          'assets/images/date.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      DateFormat('d MMMM, y').format(event.dateTime),
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(13, 12, 38, 1),
                      ),
                    ),
                    subtitle: Text(
                      '${DateFormat('EEEE').format(event.dateTime)}, ${DateFormat('jm').format(event.dateTime)}',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        color: Color.fromRGBO(112, 110, 143, 1),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: 48,
                        width: 48,
                        child: Image.asset(
                          'assets/images/location.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      event.venueName,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(13, 12, 38, 1),
                      ),
                    ),
                    subtitle: Text(
                      '${event.venueCity}, ${event.venueCountry}',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        color: Color.fromRGBO(112, 110, 143, 1),
                      ),
                    ),
                  ),
                  const Text(
                    'About Event',
                    style: TextStyle(
                      color: Color.fromRGBO(18, 13, 38, 1),
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ReadMoreText(
                    event.description,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                    ),
                    trimLength: 100,
                    colorClickableText: Theme.of(context).primaryColor,
                    trimMode: TrimMode.Length,
                    trimCollapsedText: 'Read More',
                    trimExpandedText: 'Read Less',
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
