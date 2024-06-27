import '../models/models.dart';

class M20240625Init {
  static const query = [
    '''
      CREATE TABLE ${SettingModel.kTableName} (key TEXT PRIMARY KEY,
      value TEXT)
    ''',
    '''
      INSERT INTO ${SettingModel.kTableName} (key, value) VALUES('first_time', 1)
    ''',
  ];
}
