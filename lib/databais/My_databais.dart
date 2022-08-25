import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoproject/databais/Taskes.dart';

CollectionReference<Tasks> getTaskscollection() {
  return FirebaseFirestore.instance
      .collection(Tasks.collectionname)
      .withConverter<Tasks>(fromFirestore: (snapshot, options) {
    return Tasks.fromFirestore(snapshot.data()!);
  }, toFirestore: (task, options) {
    return task.toFirestore();
  });
}

Future<void> insertTask(Tasks task) {
  var taskCollection = getTaskscollection();
  var taskDoc = taskCollection.doc();
  task.id = taskDoc.id;
  return taskDoc.set(task);
}

Stream<QuerySnapshot<Tasks>> getTasksFromFirebase(DateTime dateTime) {
  var tasks = getTaskscollection();
  return tasks
      .where('dateTime',
          isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch)
      .snapshots();
}

Future<void> deleteTask(Tasks task) {
  var delete = getTaskscollection();
  return delete.doc(task.id).delete();
}

isDone(Tasks task) {
  var todo = getTaskscollection();
  todo.doc(task.id).update({'isDone': task.isDone ? false : true});
}

updateTask(Tasks tasks) {
  var tas = getTaskscollection();
  tas.doc(tasks.id).update({
    'title': tasks.title,
    'contant': tasks.contant,
    'dateTime': tasks.dateTime.millisecondsSinceEpoch
  });
}
