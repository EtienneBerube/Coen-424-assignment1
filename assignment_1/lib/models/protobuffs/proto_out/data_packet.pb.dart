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

