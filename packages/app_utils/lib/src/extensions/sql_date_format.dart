String convertToYYYYMMDD(String? input) {
  if (input == null || input.isEmpty) {
    // If the input is null or empty, return it as is
    return input ?? '';
  } else {
    // Split the input into day, month, and year parts
    List<String> dateParts = input.split('/');

    // Determine the year part
    String yearPart =
        dateParts.length == 3 ? dateParts[2] : DateTime.now().year.toString();

    // Create the YYYY-MM-DD formatted date
    String formattedDate =
        '$yearPart-${dateParts[1].padLeft(2, '0')}-${dateParts[0].padLeft(2, '0')}';

    return formattedDate;
  }
}
