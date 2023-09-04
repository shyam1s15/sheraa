bool isPhoneNumberValid(String phoneNumber) {
  // Define a regular expression pattern for phone numbers.
  // This pattern allows for various formats including:
  // - (123) 456-7890
  // - 123-456-7890
  // - 123.456.7890
  // - 1234567890
  final pattern = r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';

  // Create a regular expression object.
  final regExp = RegExp(pattern);

  // Check if the phone number matches the pattern.
  return regExp.hasMatch(phoneNumber);
}
