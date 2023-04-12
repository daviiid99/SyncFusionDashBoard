abstract class SyncFusionWidgetItemOptions {
  SyncFusionWidgetItemOptions({required this.uid, String? alias}) {
    this.alias = alias ?? uid;
  }

  final String uid;
  late String alias;

}