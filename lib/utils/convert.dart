int strToInt(String str) {
  return int.parse(str);
} 

DateTime strToDateTime(String str) {
  return DateTime.fromMillisecondsSinceEpoch((DateTime.tryParse(str) ?? DateTime.now()).millisecondsSinceEpoch);
}