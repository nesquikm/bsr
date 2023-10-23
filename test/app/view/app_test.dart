import 'package:bsr/app/app.dart';
import 'package:bsr/features/library/library.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(LibraryPage), findsOneWidget);
    });
  });
}
