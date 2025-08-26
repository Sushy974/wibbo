// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:text_theme/text_theme.dart';
import 'package:wibbo_web/l10n/l10n.dart';
import 'package:wibbo_web/pages/inscription/bloc/inscription_bloc.dart';

class InscriptionView extends StatelessWidget {
  const InscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return BlocConsumer<InscriptionBloc, InscriptionState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) async {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 3),
              backgroundColor: theme.colorScheme.error,
              content: BodyText(
                'l10n.erreurInscription',
                style: theme.textTheme
                    .body(context)
                    ?.copyWith(
                      color: theme.colorScheme.onError,
                    ),
              ),
            ),
          );
          return;
        }
      },
      builder: (context, state) {
        final bloc = context.watch<InscriptionBloc>();
        final theme = Theme.of(context);
        return PopScope(
          canPop: false,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: theme.colorScheme.secondary,
              appBar: AppBar(
                backgroundColor: theme.colorScheme.secondary,
                leading: const SizedBox.shrink(),
                centerTitle: false,
                leadingWidth: 20,
                toolbarHeight: 80,
                title: SvgPicture.asset(
                  'assets/images/logo_vertical_blanc.svg',
                ),
              ),
              body: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 80,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondary,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onSecondary,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                        border: Border(
                          bottom: BorderSide(
                            color: theme.colorScheme.onSecondary,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'l10n.sInscrire',
                                    style: theme.textTheme
                                        .title(context)
                                        ?.copyWith(
                                          color: theme.colorScheme.primary,
                                        ),
                                  ),
                                  TextSpan(
                                    text: '',
                                    style: theme.textTheme
                                        .title(context)
                                        ?.copyWith(),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'l10n.votreEmail',
                                fillColor: state.status.isNotInProgress
                                    ? null
                                    : Colors.grey,
                                errorText: state.email.isNotPureEtNotValid
                                    ? 'l10n.emailNonValide'
                                    : null,
                              ),
                              enabled: state.status.isNotInProgress,
                              keyboardType: TextInputType.emailAddress,
                              autofillHints: const [
                                AutofillHints.email,
                                AutofillHints.newUsername,
                              ],
                              textInputAction: TextInputAction.next,
                              onChanged: (value) => bloc.add(
                                InscriptionEmailChanged(
                                  value.trim(),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              obscureText: !state.motDePasseVisible,
                              decoration: InputDecoration(
                                fillColor: state.status.isNotInProgress
                                    ? null
                                    : Colors.grey,
                                hintText: 'l10n.motDePasse',
                                errorText: state.motDePasse.isNotPureEtNotValid
                                    ? state.motDePasse.error?.text()
                                    : null,
                                errorMaxLines: 2,
                                suffixIcon: IconButton(
                                  onPressed: () => bloc.add(
                                    const InscriptionShowMotDePasseChanged(),
                                  ),
                                  icon: Icon(
                                    state.motDePasseVisible
                                        ? Icons.visibility_off
                                        : Icons.remove_red_eye,
                                  ),
                                ),
                              ),
                              enabled: state.status.isNotInProgress,
                              textInputAction: TextInputAction.next,
                              autofillHints: const [AutofillHints.newPassword],
                              onChanged: (value) => bloc.add(
                                InscriptionMotDePasseChanged(value),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              obscureText: !state.confirmationMotDePasseVisible,
                              decoration: InputDecoration(
                                fillColor: state.status.isNotInProgress
                                    ? null
                                    : Colors.grey,
                                hintText: 'l10n.confirmerMotDePasse',
                                errorText:
                                    state
                                        .confirmationMotDePasse
                                        .isNotPureEtNotValid
                                    ? state.confirmationMotDePasse.error?.text()
                                    : null,
                                errorMaxLines: 2,
                                suffixIcon: IconButton(
                                  onPressed: () => bloc.add(
                                    const InscriptionShowConfirmationMotDePasseChanged(),
                                  ),
                                  icon: Icon(
                                    state.confirmationMotDePasseVisible
                                        ? Icons.visibility_off
                                        : Icons.remove_red_eye,
                                  ),
                                ),
                              ),
                              enabled: state.status.isNotInProgress,
                              textInputAction: TextInputAction.done,
                              autofillHints: const [AutofillHints.newPassword],
                              onSubmitted: (_) => bloc.add(
                                const InscriptionSubmitted(),
                              ),
                              onChanged: (value) => bloc.add(
                                InscriptionConfirmationMotDePasseChanged(value),
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed:
                                    state.status.isNotInProgress && bloc.isValid
                                    ? () => bloc.add(
                                        const InscriptionSubmitted(),
                                      )
                                    : null,
                                style: theme.elevatedButtonTheme.style
                                    ?.copyWith(
                                      padding: const WidgetStatePropertyAll(
                                        EdgeInsets.symmetric(
                                          vertical: 20,
                                        ),
                                      ),
                                    ),
                                child: Visibility(
                                  visible: state.status.isNotInProgress,
                                  replacement: SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: CircularProgressIndicator.adaptive(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        theme.colorScheme.onPrimary,
                                      ),
                                    ),
                                  ),
                                  child: LabelText(
                                    'l10n.inscription',
                                    style: theme.textTheme
                                        .label(context)
                                        ?.copyWith(
                                          color: theme.colorScheme.onPrimary,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BodyText(
                                  'l10n.dejaUnCompte',
                                  style: theme.textTheme
                                      .body(context)
                                      ?.copyWith(),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: BodyText(
                                    'l10n.seConnecter',
                                    style: theme.textTheme
                                        .body(context)
                                        ?.copyWith(
                                          color: theme.colorScheme.primary,
                                          decoration: TextDecoration.underline,
                                          decorationColor:
                                              theme.colorScheme.primary,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
