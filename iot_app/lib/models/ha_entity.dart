class HAEntity {
  final String entityId;
  final String state;
  final Map<String, dynamic> attributes;

  HAEntity({
    required this.entityId,
    required this.state,
    required this.attributes,
  });

  factory HAEntity.fromJson(Map<String, dynamic> json) {
    return HAEntity(
      entityId: json['entity_id'] as String,
      state: json['state'] as String,
      attributes: json['attributes'] as Map<String, dynamic>? ?? {},
    );
  }

  String get friendlyName => attributes['friendly_name'] ?? entityId;
}
