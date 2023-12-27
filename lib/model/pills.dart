import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

class pills {
  final String id;
  final String pillName;
  final formatter = DateFormat().add_jm().format(DateTime.now());

  pills({required this.pillName}) : id = uuid.v4();
}
