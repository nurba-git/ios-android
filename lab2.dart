void checkBalance({
  required String name,
  required double balance,
}) =>
    print('$name, your current balance is: ${balance}');


double deposit({
  required double currentBalance,
  double? amount,
}) {
  double depositAmount = amount ?? 0.0;

  double updatedBalance = currentBalance + depositAmount;

  print('Deposit: ${depositAmount}');
  print('Updated balance: ${updatedBalance}');

  return updatedBalance;
}


double withdraw({
  required String name,
  required double currentBalance,
  double? amount,
  int? pinCode,
}) {
  int enteredPin = pinCode ?? 0000;

  if (enteredPin != 1234) {
    print('Error: Incorrect PIN. Transaction declined.');
    return currentBalance;
  }

  double withdrawAmount = amount ?? 0.0;

  if (withdrawAmount > currentBalance) {
    print('Error: Insufficient funds. Transaction declined.');
    return currentBalance;
  }

  double updatedBalance = currentBalance - withdrawAmount;

  print('$name, withdrawal successful.');
  print('Withdrawn: ${withdrawAmount}');
  print('Remaining balance: ${updatedBalance}');

  return updatedBalance;
}


void main() {
  String name = 'Nurbakyt';
  double balance = 50000.0;

  checkBalance(
    name: name,
    balance: balance,
  );

  balance = deposit(
    currentBalance: balance,
    amount: 10000.0,
  );

  balance = withdraw(
    name: name,
    currentBalance: balance,
    amount: 15000.0,
    pinCode: 1234,
  );

  checkBalance(
    name: name,
    balance: balance,
  );
}