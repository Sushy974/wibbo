import 'package:dart_firebase_admin/messaging.dart';
import 'package:dart_firebase_notification/src/models/statut_envoi.dart';
import 'package:dart_firebase_notification/src/repositories/notif_repository.dart';
import 'package:dart_firebase_notification/src/repositories/template_repository.dart';
import 'package:dart_firebase_notification/src/services/creer_notif.dart';
import 'package:firedart/firedart.dart';

class EnvoiNotificationUsecase {
  const EnvoiNotificationUsecase({
    required FirebaseAuth firebaseAuth,
    required String email,
    required String password,
    required NotifRepository notifRepository,
    required TemplateRepository templateRepository,
    required Messaging messaging,
    String? icon,
  })  : _firebaseAuth = firebaseAuth,
        _email = email,
        _notifRepository = notifRepository,
        _messaging = messaging,
        _templateRepository = templateRepository,
        _icon = icon,
        _password = password;

  final FirebaseAuth _firebaseAuth;
  final String _email;
  final String _password;
  final NotifRepository _notifRepository;
  final TemplateRepository _templateRepository;
  final Messaging _messaging;
  final String? _icon;

  Future<void> execute({
    required EnvoiNotificationCommand command,
  }) async {
    try {
   
      await _firebaseAuth.signIn(_email, _password);
 

      final notif = await _notifRepository.recupereNotifParUid(
        uidNotif: command.uidNotif,
      );
  
      final template = await _templateRepository.recupereTemplateParUid(
        uidTemplate: notif.notifTemplate.nom,
      );
 
      final titre = creerTitre(template.titre, notif.notifTemplate.data ?? {});
      final contenu =
          creerContenu(template.contenu, notif.notifTemplate.data ?? {});
   
      await _notifRepository.demarreEnvoiNotif(uidNotif: command.uidNotif);
 
      final messages = <Message>[];
      var listeInfo = <Info>[];
  

      for (final fcmToken in notif.envoyerPour) {
        messages.add(
          TokenMessage(
            token: fcmToken,
            data: notif.data,
            notification: Notification(
              title: titre,
              body: contenu,
              imageUrl: notif.urlImage ?? template.urlImage,
            ),
          ),
        );

        if (messages.length >= 500) {
          listeInfo = await envoiListeMessages(messages);
          messages.clear();
        }
      }

      listeInfo = await envoiListeMessages(messages);

      await _notifRepository.termineEnvoiNotif(
        uidNotif: command.uidNotif,
        listeInfo: listeInfo,
      );
    } catch (e) {
      await _notifRepository.erreurEnvoiNotif(
        uidNotif: command.uidNotif,
        messageErreur: e.toString(),
      );
    }
  }

  Future<List<Info>> envoiListeMessages(List<Message> messages) async {
    final listeInfo = await _messaging.sendEach(messages).then(
      (batchResponse) {
        final infos = <Info>[];
        for (final element in batchResponse.responses) {
          infos.add(
            Info(
              body:
                  element.success ? element.messageId! : element.error!.message,
              status: element.success ? 'SUCCESS' : 'ERROR',
            ),
          );
        }

        return infos;
      },
    );

    return listeInfo;
  }
}

class EnvoiNotificationCommand {
  const EnvoiNotificationCommand({
    required this.uidNotif,
  });

  final String uidNotif;
}
