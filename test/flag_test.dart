import 'package:bullet_train/src/model/flag.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('flag test', () {
    var testValue = '''{
      "id": 2,
      "feature": {
        "id": 2,
        "name": "font_size",
        "created_date": "2018-06-04T12:51:18.646762Z",
        "initial_value": "10",
        "description": "test description",
        "type": "CONFIG",
        "project": 2
      },
      "feature_state_value": 10,
      "enabled": true,
      "environment": 2,
      "identity": null
    }
    ''';

    var flag = Flag.fromJson(testValue);
    expect(flag.stateValue, isNotNull);
    expect(flag.enabled, true);
    expect(flag.feature, isNotNull);
    expect(flag.feature.name, isNotNull);
    expect(flag.feature.type, isNotNull);
    expect(flag.feature.description, isNotNull);
  });

  test('flag state value', () {
    var testValue = '''{
      "id": 2,
      "feature": {
        "id": 2,
        "name": "font_size",
        "created_date": "2018-06-04T12:51:18.646762Z",
        "initial_value": "10",
        "description": "test description",
        "type": "CONFIG",
        "project": 2
      },
      "feature_state_value": "1.0.1",
      "enabled": true,
      "environment": 2,
      "identity": null
    }
    ''';

    var flag = Flag.fromJson(testValue);
    expect(flag.stateValue, isNotNull);
    expect(flag.enabled, true);
    expect(flag.feature, isNotNull);
    expect(flag.feature.name, isNotNull);
    expect(flag.feature.type, isNotNull);
    expect(flag.feature.description, isNotNull);
  });
}
