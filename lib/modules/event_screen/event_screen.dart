import 'package:flutter/material.dart';
import 'package:fusion_works/modules/event_screen/calender_view.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CalenderView(),
    );
  }
}
