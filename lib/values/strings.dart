class AppRoutes {
  const AppRoutes._();

  static const String splash = '/splash';
  static const String txtAfterSplash = '/AfterSplash';
  static const String chatScreen = '/chatScreen';
  static const String addSkills = '/AddSkills';
  static const String profile = '/profileScreen';
  static const String login = '/loginScreen';
  static const String register = '/registerScreen';
  static const String events = '/events';
  static const String addStatus = '/addStatus';
}

class ApiErrorStrings {
  const ApiErrorStrings._();

  static const String noInternetMsg = 'No internet connection.';
  static const String somethingWrongErrorMsg =
      'Something went wrong! Please try after some time.';
  static const String yourPasswordDoesNotMatches =
      'Your password & confirm password does not matches';
}

class AppStrings {
  const AppStrings._();

  static const String login = 'Login';
  static const String loginUsing =
      'Login using your credentials to access into FusionWorks.';
  static const String registerUsing =
      'Register using your email id to access FusionWorks.';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String enterYourEmail = 'Enter your email';
  static const String enterYourEmailPassword = 'Enter your password';
  static const String enterYourEmailPasswordAgain = 'Enter your password again';
  static const String or = 'or';
  static const String microsoft = 'Microsoft';
  static const String google = 'Google';
  static const String oR = 'or';
  static const String dontHaveAccount = 'Don’t have an account? ';
  static const String alreadyMember = 'Already a member? ';
  static const String register = 'Register';
  static const String calendar = 'Calendar';
  static const String oopsSomethingWentWrong = 'Oops, Something went wrong';

  // Profile screen
  static const String mobileNumber = 'Mobile Number';
  static const String employeeCode = 'Employee Code';
  static const String dateOfBirth = 'Date of Birth';

  //Skills screen
  static const String skillsTitle = 'Skills';
  static const String primarySkills = 'Primary Skills';
  static const String secondarySkills = 'Secondary Skills';
  static const String addSkill = 'Add Skill';
  static const String addStatus = 'Add Status Update';
  static const String category = 'Category';
  static const String chooseCategory = 'Choose Category';
  static const String skill = 'Skill';
  static const String chooseSkill = 'Choose Skill';
  static const String proficiency = 'Proficiency';
  static const String chooseProficiency = 'Choose Proficiency';
  static const String project = 'Project';
  static const String chooseProject = 'Choose Project';
  static const String date = 'Date';
  static const String todaysUpdate = "Today's Update";
  static const String add = 'Add';
  static const String selectDate = 'Select date';
  static const String todaysUpdatePlaceholder = "Enter your today's task";
  static const String tomorrowsPlan = "Tomorrow's plan";
  static const String tomorrowsPlanPlaceholder = "Enter your tomorrow's plan";
  static const String blockers = 'Blockers';
  static const String blockersPlaceholder = 'Enter faced blockers';
}

class AssetsString {
  const AssetsString._();

  static const String emailIcon = 'assets/icons/ic_email.svg';
  static const String passwordIcon = 'assets/icons/ic_password.svg';
  static const String eyeOpenIcon = 'assets/icons/ic_eye_open.svg';
  static const String eyeCloseIcon = 'assets/icons/ic_eye_close.svg';
  static const String microsoftIcon = 'assets/icons/ic_microsoft.png';
  static const String googleIcon = 'assets/icons/ic_google.png';
  static const String calendarIcon = 'assets/icons/ic_calendar.svg';
  static const String callIcon = 'assets/icons/ic_call.svg';
  static const String employeeCardIcon = 'assets/icons/ic_employee_card.svg';
  static const String logoutIcon = 'assets/icons/ic_logout.svg';
}
