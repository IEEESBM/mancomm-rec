import 'package:validators/validators.dart' as validator;

Function nonEmptyValidator = (String value) {
  String msg = 'Name';

  if (value.isEmpty) {
    return msg + ' cannot be empty.';
  } else if (!validator.isAlpha(value.replaceAll(RegExp(' '), ''))) {
    return msg + ' needs to contain only alphabets';
  }

  return null;
};

Function regValidator = (String value) {
  String msg = "Registration number";

  if (value.isEmpty) {
    return msg + ' cannot be empty';
  } else if (!validator.isNumeric(value)) {
    return msg + ' should contain digits';
  } else if (value.length != 9) {
    return msg + ' should contain 9 digits';
  } else if (value.substring(0, 4) == "0000") {
    // FOR DEBUG PURPOSES
    return null;
  } else if (value.substring(0, 3) != "190") {
    return msg + ' should start with 190';
  }
  return null;
};

Function phoneValidator = (String value) {
  String msg = "Phone number";

  if (value.isEmpty) {
    return msg + ' cannot be empty';
  } else if (!validator.isNumeric(value)) {
    return msg + ' should contain digits';
  } else if (value.length != 10) {
    return msg + ' should contain 10 digits';
  }
  return null;
};

Function dropValidator = (int value) {
  String msg = 'Stream';

  if (value == null) {
    return msg + ' cannot be empty';
  }
  return null;
};

Function urlValidator = (String value) {
  if (value.isNotEmpty) {
    if (!Uri.parse(value).isAbsolute) {
      return 'Enter a valid url';
    }
  }
  return null;
};
