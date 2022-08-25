class Tasks {
  static const String collectionname = 'tasks';
  String id;
  String title;
  String contant;
  DateTime dateTime ;
  bool isDone;

  Tasks(
      {this.id = '',
      required this.title,
      required this.contant,
        required this.dateTime,
      this.isDone = false});

  Tasks.fromFirestore(Map<String, dynamic> data)
      : this(
            id: data['id'],
            title: data['title'],
            contant: data['contant'],
            dateTime: DateTime.fromMillisecondsSinceEpoch(data['dateTime']),
            isDone: data['isDone']);

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'title': title,
      'contant': contant,
      'dateTime': dateTime.millisecondsSinceEpoch ,
      'isDone': isDone
    };
  }
}
