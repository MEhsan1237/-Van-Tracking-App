import 'package:flutter_test/flutter_test.dart';
import 'package:school_van/app/app.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const SafeVanApp());
    expect(find.byType(SafeVanApp), findsOneWidget);
  });
}
