bool validateEmailAddress(String email){
  const emailRegex =  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  if(RegExp(emailRegex).hasMatch(email)){
    return true;
  }
  else return false;
}

 String? validatePassword(String value) {
  if (!(value.length > 5) && value.isNotEmpty) {
    return "Password should contain more than 5 characters";
  } else{
    return null;
  }
}

bool dob(String dob){
const dobRegex =  r'"^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\\d\\d$"';
if(RegExp(dobRegex).hasMatch(dob)){
  return true;
} else return false;


}