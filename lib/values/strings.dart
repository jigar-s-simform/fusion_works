class AppRoutes {
  const AppRoutes._();

  static const String splash = '/splash';
  static const String txtAfterSplash = '/AfterSplash';
  static const String profile = '/profileScreen';
  static const String login = '/loginScreen';
  static const String register = '/registerScreen';
  static const String events = '/events';
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

  // Profile screen
  static const String mobileNumber = 'Mobile Number';
  static const String employeeCode = 'Employee Code';
  static const String dateOfBirth = 'Date of Birth';
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
