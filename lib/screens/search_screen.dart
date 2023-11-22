import 'package:flutter/material.dart';

import '../providers/event_provider.dart';
import '../widgets/search_card.dart';
import '../models/event.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  final FocusNode _searchBox = FocusNode();
  String _search = "";

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    _searchBox.dispose();
  }

  void _onSubmit() {
    setState(() {
      _search = _searchController.text;
    });
    _searchBox.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
        title: const Text(
          'Search',
          style: TextStyle(
            fontFamily: 'Inter',
            color: Color.fromRGBO(18, 13, 38, 1),
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              focusNode: _searchBox,
              onSubmitted: (_) => _onSubmit(),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                prefixIcon: Image.asset(
                  'assets/images/search_blue.png',
                  height: 24,
                  width: 24,
                ),
                hintText: 'Type Event Name',
                hintStyle: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 20,
                  color: Color.fromRGBO(196, 196, 196, 1),
                ),
              ),
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
            FutureBuilder(
              future: EventProvider.searchEvents(_search),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return const Expanded(
                    child: Center(
                      child: Text('Something went wrong!'),
                    ),
                  );
                }
                List<Event> events = snapshot.data!;
                if (events.isEmpty) {
                  return Expanded(
                    child: Center(
                      child: Text(_searchController.text.isNotEmpty
                          ? 'No results matched!'
                          : 'Try searching...'),
                    ),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      return SearchCard(event: events[index]);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
