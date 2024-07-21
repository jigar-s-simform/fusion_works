import 'dart:math';

class DummyData {
  static String getRandomFullName() {
    final firstNames = <String>[
      "John",
      "Alice",
      "Michael",
      "Emma",
      "David",
      "Olivia",
      "James",
      "Sophia",
    ];
    final lastNames = <String>[
      "Smith",
      "Johnson",
      "Brown",
      "Lee",
      "Williams",
      "Davis",
      "Jones",
      "Miller",
    ];

    // Randomly select a first name and a last name
    final String firstName = firstNames[Random().nextInt(firstNames.length)];
    final String lastName = lastNames[Random().nextInt(lastNames.length)];
    return '$firstName $lastName';
  }

  static String getRandomMobileNumber() {
    final mobileNumber = Random().nextInt(1 << 31) + (1 << 31);
    return mobileNumber.toString();
  }

  static int getRandomEmployeeCode() => Random().nextInt(900) + 100;

  static String generateRandomDateOfBirth() {
    final random = Random();
    // Generate a random year, month, and day
    final int year =
        random.nextInt(100) + 1920; // Random year between 1920 and 2020
    final int month = random.nextInt(12) + 1; // Random month between 1 and 12
    final int day = random.nextInt(28) +
        1; // Random day between 1 and 28 to account for February

    // Generate a random hour, minute, second, and millisecond
    final int hour = random.nextInt(24); // Random hour between 0 and 23
    final int minute = random.nextInt(60); // Random minute between 0 and 59
    final int second = random.nextInt(60); // Random second between 0 and 59
    final int millisecond =
        random.nextInt(1000); // Random millisecond between 0 and 999

    // Format the date in ISO 8601 format
    return '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}T'
        '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:'
        '${second.toString().padLeft(2, '0')}.${millisecond.toString().padLeft(3, '0')}Z';
  }

  static String getRandomDepartment() {
    const departmentNames = <String>[
      "MEAN",
      "FLUTTER",
      "MERN",
      "DEVOPS",
      "QA",
      "UIUX",
    ];
    final randomIndex = Random().nextInt(8);
    return departmentNames[randomIndex];
  }

  static String getRandomDesignation() {
    final List<String> designations = [
      'Junior Developer',
      'Senior Developer',
      'Project Manager',
      'Quality Assurance Specialist',
      'UI/UX Designer',
      'Product Manager',
      'Data Analyst',
      'Chief Technical Officer',
      'Scrum Master',
      'DevOps Engineer',
    ];

    // Randomly select a designation from the list
    final randomIndex = Random().nextInt(designations.length);
    return designations[randomIndex];
  }

  static String getDobFromIso(String isoDate) {
    // Parse the ISO date string and convert to DateTime
    DateTime dateTime = DateTime.parse(isoDate);
    // Format the date as YYYY-MM-DD
    String dob =
        '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
    return dob;
  }
}
