
import 'package:zikrabyte_ui/application/presentation/utils/temp.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class Mail{

static mail(String emailId) async {

  String username = email;
  String password = passwd;

  final smtpServer = gmail(username, password);

  final message = Message()
    ..from = Address(username, 'Your name')
    ..recipients.add('destination@example.com')
    ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
    ..bccRecipients.add(const Address('bccAddress@example.com'))
    ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
    ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";
  // try {
  //   final sendReport = await send(message, smtpServer);
  // } on MailerException catch (e) {
  //   for (var p in e.problems) {
  //     log('Problem: ${p.code}: ${p.msg}');
  //   }
  // }

  final equivalentMessage = Message()
    ..from = Address(username, 'Zikrabyte')
    ..recipients.add(Address(emailId))
    ..ccRecipients.addAll([const Address('destCc1@example.com'), 'destCc2@example.com'])
    ..bccRecipients.add('bccAddress@example.com')
    ..subject = 'Your Order has been placed to Zikrabye:: ${DateTime.now()}'
    ..text = 'This is the plain text.\nThis is line 2 of the text part.'
  ;

  //final sendReport2 = await send(equivalentMessage, smtpServer);
  var connection = PersistentConnection(smtpServer);
  await connection.send(message);
  await connection.send(equivalentMessage);
  await connection.close();
}
}