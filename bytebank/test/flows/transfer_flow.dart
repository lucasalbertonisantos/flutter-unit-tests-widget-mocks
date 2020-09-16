import 'package:bytebank/main.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contacts_list.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:bytebank/screens/transaction_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mocks/mocks.dart';
import 'actions.dart';

void main(){
  testWidgets('Should transfer to a contact', (tester) async {
    final mockContactDao = MockContactDao();
    await tester.pumpWidget(MyApp(contactDao: mockContactDao,));
    final dashboard = find.byType(Dashboard);
    expect(dashboard, findsOneWidget);

    when(mockContactDao.findAll()).thenAnswer((invocation) async {
      return [Contact(0, 'Lucas', 1000)];
    });

    await clickOnTheTransferFeatureItem(tester);
    await tester.pumpAndSettle();

    final contactsList = find.byType(ContactsList);
    expect(contactsList, findsOneWidget);

    final contactItem = find.byWidgetPredicate((widget) {
      if(widget is ContactItem) {
        return widget.contact.name == 'Lucas' && widget.contact.accountNumber == 1000;
      }
      return false;
    });
    expect(contactItem, findsOneWidget);
    await tester.tap(contactItem);
    await tester.pumpAndSettle();

    final transactionForm = find.byType(TransactionForm);
    expect(transactionForm, findsOneWidget);
  });
}
