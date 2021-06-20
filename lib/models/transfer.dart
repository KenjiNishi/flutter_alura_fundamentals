class Transfer {
  final double value;
  final String accountNumber;

  Transfer(this.value, this.accountNumber);

  @override
  String toString() {
    return 'Transfer{value:$value, accountNumber:$accountNumber}';
  }
}
