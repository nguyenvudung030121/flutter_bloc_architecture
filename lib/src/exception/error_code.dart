// ignore_for_file: constant_identifier_names
// Flow document detail link: https://docs.google.com/spreadsheets/d/1BeRTP2NrCyeRmfl6qmPlnUyCCZ1bp8BKIpFM_qfYxNs/edit#gid=715106303

enum ErrorCode {
  E0001,
  E0002,
  E0003,
  E0004,
  E0005,
  E0006,
  E0007,
  E9999,
  none,
}

extension ErrorCodeExtension on ErrorCode {
  static ErrorCode fromName(String value) {
    try {
      final errorCode = ErrorCode.values.byName(value);
      return errorCode;
    } catch (error) {
      return ErrorCode.none;
    }
  }
}

extension ErrorCodeDetailExt on ErrorCode {
// SignUp/SignIn - Account is not active
  bool get isAccountNotActive {
    return this == ErrorCode.E0001;
  }

// SignUp - Account already exist & active
  bool get isAccountExitAndActive {
    return this == ErrorCode.E0002;
  }

// SignIn - Email is not existed
  bool get isEmailIsNotExist {
    return this == ErrorCode.E0003;
  }

// Active account/Setup password - Token is invalid/expired
  bool get isTokenIsInvalidOrExpired {
    return this == ErrorCode.E0004;
  }

  // SignIn - Password not setup
  bool get isSignInPasswordNotSetup {
    return this == ErrorCode.E0005;
  }

  // SignIn - Password not correct
  bool get isSignInPasswordNotCorrect {
    return this == ErrorCode.E0006;
  }

  // ALL api - Jwt token Invalid
  bool get isTokenInvalid {
    return this == ErrorCode.E0007;
  }

  // Params Error
  bool get isParamsError {
    return this == ErrorCode.E9999;
  }
}
