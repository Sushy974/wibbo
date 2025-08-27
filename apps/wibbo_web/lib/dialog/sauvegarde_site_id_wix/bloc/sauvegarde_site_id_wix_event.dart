part of 'sauvegarde_site_id_wix_bloc.dart';

sealed class SauvegardeSiteIdWixEvent extends Equatable {
  const SauvegardeSiteIdWixEvent();

  @override
  List<Object?> get props => [];
}

final class SauvegardeSiteIdWixSiteIdChanged extends SauvegardeSiteIdWixEvent {
  const SauvegardeSiteIdWixSiteIdChanged(this.siteId);

  final String siteId;

  @override
  List<Object?> get props => [siteId];
}

final class SauvegardeSiteIdWixSubmitted extends SauvegardeSiteIdWixEvent {
  const SauvegardeSiteIdWixSubmitted();
}
