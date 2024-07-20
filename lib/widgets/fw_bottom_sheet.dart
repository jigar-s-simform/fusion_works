import 'package:flutter/material.dart';
import 'package:fusion_works/values/app_colors.dart';

import '../model/events/event.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({
    required this.title,
    required this.description,
    required this.eventMode,
    required this.date,
    required this.startTime,
    required this.endTime,
    this.isAllDay = false,
    super.key,
  });

  final String title;
  final String description;
  final EventMode? eventMode;
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final bool isAllDay;

  String timeOfDayToString(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  String dateTimeToDateString(DateTime dateTime) {
    return '${dateTime.year.toString().padLeft(4, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: const TextStyle(
                            fontSize: 16, color: AppColors.grey),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        width: 80,
                        decoration: const BoxDecoration(
                          color: AppColors.lightGreen,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: eventMode != null
                            ? const SizedBox.shrink()
                            : Align(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: eventMode!.isOnline
                                          ? Colors.lightGreen
                                          : AppColors.lightOrange,
                                      size: 8,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      eventMode!.isOnline
                                          ? 'Online'
                                          : 'Offline',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: AppColors.darkGreen,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                color: AppColors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Icon(Icons.calendar_today),
                const SizedBox(width: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Date',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColors.grey,
                        ),
                      ),
                      Text(
                        dateTimeToDateString(date),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Icon(Icons.access_time),
                const SizedBox(width: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Time',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColors.grey,
                        ),
                      ),
                      Text(
                        isAllDay
                            ? 'All Day'
                            : '${timeOfDayToString(startTime)} - ${timeOfDayToString(endTime)}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
