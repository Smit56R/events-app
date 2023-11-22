class Event {
  final int id;
  final String title;
  final String description;
  final String bannerImgUrl;
  final DateTime dateTime;
  final String organiserName;
  final String organiserIconUrl;
  final String venueName;
  final String venueCity;
  final String venueCountry;

  const Event({
    required this.id,
    required this.title,
    required this.description,
    required this.bannerImgUrl,
    required this.dateTime,
    required this.organiserName,
    required this.organiserIconUrl,
    required this.venueName,
    required this.venueCity,
    required this.venueCountry,
  });

  static Event fromJson(Map<String, dynamic> event) {
    return Event(
      id: event['id']!,
      title: event['title']!,
      description: event['description']!,
      bannerImgUrl: event['banner_image']!,
      dateTime: DateTime.parse(event['date_time']!),
      organiserName: event['organiser_name']!,
      organiserIconUrl: event['organiser_icon']!,
      venueName: event['venue_name']!,
      venueCity: event['venue_city']!,
      venueCountry: event['venue_country']!,
    );
  }
}
