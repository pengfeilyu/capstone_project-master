import 'dart:io';
import 'dart:convert';
import 'dart:core';

class Storage {
  File f;
  int numQuestions;
  LineSplitter ls;
  List<String> questionsWithType;

  //when initializing if the file is new enter a string list of questions with their types. if file already exists pass null
  Storage(String filePath, List<String> newQuestionsWithType) {
    f = new File(filePath);
    ls = new LineSplitter();
    if (newQuestionsWithType != null) {
      questionsWithType = newQuestionsWithType;
      numQuestions = (questionsWithType.length / 2) as int;
      f.writeAsStringSync(numQuestions.toString() + '\ndate,');
      for (int i = 0; i < questionsWithType.length; i++) {
        f.writeAsStringSync(questionsWithType[i] + ',', mode: FileMode.append);
      }
    } else {
      String wholeFileAsString = f.readAsStringSync();
      List<String> lines = ls.convert(wholeFileAsString);
      numQuestions = int.parse(lines[0]);
      questionsWithType = lines[1].split(",");
      questionsWithType.removeAt(0);
    }
  }

  List<String> getFileAsString() {
    String wholeFileAsString = f.readAsStringSync();
    return ls.convert(wholeFileAsString);
  }

  bool addEntry(List stringEntries) {
    if (stringEntries.length == numQuestions) {
      DateTime dateToday = DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day);
      String date = dateToday.toString();
      f.writeAsStringSync(date + ',', mode: FileMode.append);
      for (int i = 0; i < numQuestions; i++) {
        f.writeAsStringSync(stringEntries[i] + ',', mode: FileMode.append);
      }
      f.writeAsStringSync('\n', mode: FileMode.append);
      return true;
    }
    return false;
  }

  List getEntry(int lineNum) {
    List<String> lines = getFileAsString();
    List<String> entry = lines[lineNum].split(',');
    entry.removeAt(0);
    return entry;
  }

  List getLineNumsForDate(String date) {
    List lineNums = new List(2);
    lineNums[0] = -1;
    lineNums[1] = -1;
    bool first = true;
    List<String> lines = getFileAsString();
    for (int i = 0; i < lines.length; i++) {
      if (first && lines[i].split(',')[0] == date) {
        lineNums[0] = i;
        first = false;
      } else if (!first && lines[i].split(',')[0] == date) {
        lineNums[1] = i;
      } else if (!first) {
        break;
      }
    }
    return lineNums;
  }

  int getNumEntriesOnDate(String date) {
    List firstLastLine = getLineNumsForDate(date);
    return firstLastLine[1] - firstLastLine[0] + 1;
  }

  List getAllEntriesOnDate(String date) {
    List<int> lineNums = getLineNumsForDate(date);
    List<List> entries = new List();
    for (int i = lineNums[0]; i <= lineNums[1]; i++) {
      entries.add(getEntry(i));
    }
    return entries;
  }

  bool deleteEntries(String date, int entryNumber) {
    bool success = false;
    List<int> firstAndLast = getLineNumsForDate(date);
    int ofset = entryNumber - 1;
    int firstLineNum = firstAndLast[0];
    int lastLineNum = firstAndLast[1];
    int lineToDelete = firstLineNum + ofset;
    if (lineToDelete <= lastLineNum) {
      success = true;
      //delete the line
      List<String> lines = getFileAsString();
      lines.removeAt(lineToDelete);
      f.writeAsStringSync(lines[0]);
      for (int i = 1; i < lines.length; i++) {
        f.writeAsStringSync(lines[i] + '\n', mode: FileMode.append);
      }
    }
    return success;
  }
}
