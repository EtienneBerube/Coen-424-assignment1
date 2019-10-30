///
//  Generated code. Do not modify.
//  source: data_packet.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ReturnPacket extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ReturnPacket', createEmptyInstance: create)
    ..aOS(1, 'rfwId', protoName: 'rfwId')
    ..a<$core.int>(2, 'lastBatchId', $pb.PbFieldType.O3, protoName: 'lastBatchId')
    ..p<$core.double>(3, 'results', $pb.PbFieldType.PD)
    ..hasRequiredFields = false
  ;

  ReturnPacket._() : super();
  factory ReturnPacket() => create();
  factory ReturnPacket.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReturnPacket.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ReturnPacket clone() => ReturnPacket()..mergeFromMessage(this);
  ReturnPacket copyWith(void Function(ReturnPacket) updates) => super.copyWith((message) => updates(message as ReturnPacket));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReturnPacket create() => ReturnPacket._();
  ReturnPacket createEmptyInstance() => create();
  static $pb.PbList<ReturnPacket> createRepeated() => $pb.PbList<ReturnPacket>();
  @$core.pragma('dart2js:noInline')
  static ReturnPacket getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReturnPacket>(create);
  static ReturnPacket _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get rfwId => $_getSZ(0);
  @$pb.TagNumber(1)
  set rfwId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRfwId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRfwId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get lastBatchId => $_getIZ(1);
  @$pb.TagNumber(2)
  set lastBatchId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastBatchId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastBatchId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.double> get results => $_getList(2);
}

class IncomingPacket extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('IncomingPacket', createEmptyInstance: create)
    ..aOS(1, 'rfwId', protoName: 'rfwId')
    ..aOS(2, 'metric')
    ..a<$core.int>(3, 'batchUnit', $pb.PbFieldType.O3, protoName: 'batchUnit')
    ..a<$core.int>(4, 'batchId', $pb.PbFieldType.O3, protoName: 'batchId')
    ..a<$core.int>(5, 'batchSize', $pb.PbFieldType.O3, protoName: 'batchSize')
    ..hasRequiredFields = false
  ;

  IncomingPacket._() : super();
  factory IncomingPacket() => create();
  factory IncomingPacket.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IncomingPacket.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  IncomingPacket clone() => IncomingPacket()..mergeFromMessage(this);
  IncomingPacket copyWith(void Function(IncomingPacket) updates) => super.copyWith((message) => updates(message as IncomingPacket));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IncomingPacket create() => IncomingPacket._();
  IncomingPacket createEmptyInstance() => create();
  static $pb.PbList<IncomingPacket> createRepeated() => $pb.PbList<IncomingPacket>();
  @$core.pragma('dart2js:noInline')
  static IncomingPacket getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IncomingPacket>(create);
  static IncomingPacket _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get rfwId => $_getSZ(0);
  @$pb.TagNumber(1)
  set rfwId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRfwId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRfwId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get metric => $_getSZ(1);
  @$pb.TagNumber(2)
  set metric($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMetric() => $_has(1);
  @$pb.TagNumber(2)
  void clearMetric() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get batchUnit => $_getIZ(2);
  @$pb.TagNumber(3)
  set batchUnit($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBatchUnit() => $_has(2);
  @$pb.TagNumber(3)
  void clearBatchUnit() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get batchId => $_getIZ(3);
  @$pb.TagNumber(4)
  set batchId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBatchId() => $_has(3);
  @$pb.TagNumber(4)
  void clearBatchId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get batchSize => $_getIZ(4);
  @$pb.TagNumber(5)
  set batchSize($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBatchSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearBatchSize() => clearField(5);
}

