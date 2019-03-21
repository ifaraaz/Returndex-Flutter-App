class UserDetails {
  final String accessToken;
  final String mobileNumber;
 
  UserDetails(this.accessToken, this.mobileNumber);
}

class OtpLogin{
  final bool checkUserexist;
  final String otpValue;

OtpLogin(this.otpValue,this.checkUserexist);
}


