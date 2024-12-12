class AuthExceptions {
  static const Map<String, String> errorMessages = {
    "INVALID_LOGIN_CREDENTIALS": "Não foi possivel localizar sua conta.",
    "USER_DISABLED": "A conta de usuário foi desativada por um administrador.",
    "EMAIL_EXISTS": "O endereço de e-mail já está sendo usado por outra conta.",
    "OPERATION_NOT_ALLOWED": "O método de login escolhido não esta disponivel.",
    "TOO_MANY_ATTEMPTS_TRY_LATER":
        "Bloqueamos todas as solicitações deste dispositivo devido a atividades incomuns. Tente mais tarde.",
  };
  final String keyError;

  const AuthExceptions(this.keyError);

  String errorResponse() {
    return errorMessages[keyError] ??
        'Ocorreu um erro ao fazer a solicitação de login. Tente novamente.';
  }
}
