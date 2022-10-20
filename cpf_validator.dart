void main() {
  // valid cpf (true)
  print(validateCpf('135.469.810-06'));

  // invalid cpf (false)
  print(validateCpf('123.123.123.12'));
}

bool validateCpf(String cpf) {
  String numbers = cpf.replaceAll(RegExp(r'[^\w\s]+'), '');
  int firstDigit = int.parse(numbers[9]);
  int secondDigit = int.parse(numbers[10]);

  return validateDigit(numbers.substring(0, 9), firstDigit) &&
      validateDigit(numbers.substring(0, 10), secondDigit);
}

bool validateDigit(String cpf, int digit) {
  int multiplier = 1;
  int divider = 11;
  int sum = 0;

  for (var i = cpf.length - 1; i >= 0; i--) {
    sum += int.parse(cpf[i]) * ++multiplier;
  }

  int mod = sum % divider > 2 ? divider - (sum % divider) : 0;

  return mod == digit;
}
