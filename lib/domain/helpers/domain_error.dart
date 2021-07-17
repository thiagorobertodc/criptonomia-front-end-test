enum DomainError { unexpected, invalidCredentials, emailInUse, accessDenied }

extension DomainErrorExtension on DomainError {
  String get description {
    switch (this) {
      case DomainError.invalidCredentials:
        return 'Credenciais inválidas.';
      case DomainError.emailInUse:
        return 'Email já cadastrado.';
      default:
        return 'Algo errado aconteceu. Tente novamente em breve.';
    }
  }
}
