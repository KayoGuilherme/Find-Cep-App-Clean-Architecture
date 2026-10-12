sealed class ValidationMessagesConst {
  static String notEmpty(String inputLabel) => 'Favor, inserir $inputLabel';
  static String lenght(String inputLabel, int length) =>
      '$inputLabel não deve exceder $length caractere(${length > 1 ? 's' : ''})';
}
