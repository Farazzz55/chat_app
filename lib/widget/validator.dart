class AppValidator{
  static String ? validateEmail(String ? value){
    RegExp emailValid =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if(value==null){
      return 'this field is required' ;
    } else if (value.trim().isEmpty){
      return 'this field is required' ;
    } else if (emailValid.hasMatch(value)==false){
      return 'enter valid email' ;
    }else{
      return null;
    }
  }
  static String? validatePassword(String ? value){
    RegExp passwordValid=RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');
    if(value==null){
      return 'this field is required' ;
    }else if (value.isEmpty){
      return 'this field is required' ;
    } else if (value.length<8||!passwordValid.hasMatch(value)){
      return 'write strong password' ;
    } else{
      return null;
    }
  }
  static String ? validateConfirmPassword(String ? value , String ? password){
    if(value==null||value.isEmpty){
      return 'this field is required' ;
    } else if(value!=password){
      return 'confirm password doesnt match password';
    } else{
      return null;
    }
  }
  static String ? validateUserName(String ? value){
    RegExp userNameValid=RegExp(r'^[a-zA-Z0-9,.-]+$');
    if(value==null){
      return 'this field is required' ;
    } else if (value.isEmpty){
      return 'this field is required' ;
    }else if(!userNameValid.hasMatch(value)){
     return 'enter valid username';
    } else{
      return null;
    }
  }
  static String ? validateFullName(String ? value){
    if(value==null){
      return 'this field is required' ;
    } else if (value.isEmpty){
      return 'this field is required' ;
    }else{
      return null;
    }
  }
  static String ? validatePhoneNumber(String ? value){
    if(value==null){
      return 'this field is required' ;
    } else if (int.tryParse(value.trim()) == null){
      return 'numbers only' ;
    }else if(value.trim().length!=11){
      return 'value must equal 11 digit';
    } else{
      return null;
    }
  }
}