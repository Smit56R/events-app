import 'package:flutter/material.dart';

import '../providers/event_provider.dart';
import '../widgets/event_card.dart';
import '../models/event.dart';
import '../screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
        title: const Text(
          'Events',
          style: TextStyle(
            fontFamily: 'Inter',
            color: Color.fromRGBO(18, 13, 38, 1),
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
        actions: [
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchScreen(),
              ),
            ),
            child: Image.asset(
              'assets/images/search.png',
              height: 24,
              width: 24,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Color.fromRGBO(6, 5, 24, 1),
              size: 24,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: EventProvider.fetchEvents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong!'),
            );
          }
          List<Event> events = snapshot.data!;
          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              return EventCard(event: events[index]);
            },
          );
        },
      ),
    );
  }
}
