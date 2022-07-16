import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'image_record.g.dart';

abstract class ImageRecord implements Built<ImageRecord, ImageRecordBuilder> {
  static Serializer<ImageRecord> get serializer => _$imageRecordSerializer;

  @nullable
  String get path;

  @nullable
  @BuiltValueField(wireName: 'Path2')
  String get path2;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ImageRecordBuilder builder) => builder
    ..path = ''
    ..path2 = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('image');

  static Stream<ImageRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ImageRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ImageRecord._();
  factory ImageRecord([void Function(ImageRecordBuilder) updates]) =
      _$ImageRecord;

  static ImageRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createImageRecordData({
  String path,
  String path2,
}) =>
    serializers.toFirestore(
        ImageRecord.serializer,
        ImageRecord((i) => i
          ..path = path
          ..path2 = path2));
