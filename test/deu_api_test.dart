import 'package:deu_api/src/api.dart';
import 'package:deu_api/src/models/lecture.dart';
import 'package:flutter_test/flutter_test.dart';

const String _username = "";
const String _password = "";
void main() {
  //TODO : Write better test
  test('deucepte_test', () async {
    final api = DeuApi.create();
    final result = await api.auth.login(_username, _password);
    print(result);

    final semesters = await api.semester.fetchSemesters();

    for (final semester in semesters) {
      print(semester.name);
      for (final lecture in await api.lecture.fetchLectureList(semester.id)) {
        print(lecture.metaData.name);
        final lectureDetail = await api.lecture.fetchLectureDetail(lecture);
        for (final lectureDetail in lectureDetail.gradeList!) {
          print(lectureDetail);
        }
      }
    }
  });
}
