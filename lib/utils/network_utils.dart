class NetworkUtils {
  static int SUCCESS_CODE_START = 200;
  static int SUCCESS_CODE_END = 299;

  static bool statusInSuccess(int status) {
    return status >= SUCCESS_CODE_START && status <= SUCCESS_CODE_END;
  }
}
