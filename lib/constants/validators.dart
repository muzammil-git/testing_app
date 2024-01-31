const String emptyName = 'Please enter your name';
const String invalidName = 'Please enter valid full name';
const String emptyEmail = 'Please enter your email';
const String invalidEmail = 'Enter valid email';
const String emptyPhone = 'Please enter your phone number';
const String invalidPhone= 'Enter valid phone number';
const String emptyPwd = 'Please enter your password';
const String weakPwd = 'Weak password';
const String emptyRePwd = 'Please re-enter your password';
const String invalidPassword = 'Please enter valid password';
const String misMatched = "Password doesn't match";
const String emptyArea = 'Please enter your area';
const String emptyAddress = 'Please enter your address';


// RegExp emailRegex = RegExp(
//     r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$");
RegExp nameRegex = RegExp(r"^[a-z A-Z]+$");
RegExp phoneNumberRegex = RegExp(r"^0[0-9]{9}$");
RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');


//At least 8 characters long.
// Contains at least one uppercase letter.
// Contains at least one lowercase letter.
// Contains at least one digit.
// May contain special characters (optional).
RegExp passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&.]{8,}$');



String? isPhoneNumberValid(String number) {
  var regex = RegExp(r"^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$");

  if(regex.hasMatch(number)){
    return null;
  }
  return "Invalid Phone Number";
}