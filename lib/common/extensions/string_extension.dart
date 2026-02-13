extension StringExtension on String {
  String formatPhoneNumber() {
    if (startsWith('+880')) {
      return this;
    }
    
    return '+88$this';
  }
}