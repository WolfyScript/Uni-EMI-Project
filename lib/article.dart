abstract class Article {
  String title;
  String summary;
  String content;
  DateTime creationDate;
  DateTime? editDate;

  Article(
      {required this.title,
      required this.summary,
      required this.content,
      required this.creationDate,
      this.editDate});

  void setEditedOn(DateTime editDate) {
    this.editDate = editDate;
  }

  DateTime? getEditedOn() {
    return editDate;
  }

  bool wasEdited() {
    return editDate != null;
  }
}
