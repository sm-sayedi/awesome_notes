extension ListDeepContains on List<String> {
  bool deepContains(String term) =>
      contains(term) || any((element) => element.contains(term));
}