enum OrderOption {
  dateModified,
  dateCreated;

  String get name {
    return switch (this) {
      OrderOption.dateModified => 'Modified Date',
      OrderOption.dateCreated => 'Created Date'
    };
  }
}
