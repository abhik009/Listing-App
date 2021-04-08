// To parse this JSON data, do
// final memberModel = memberModelFromJson(jsonString);

import 'dart:convert';

List<MemberModel> memberModelFromJson(String str) => List<MemberModel>.from(json.decode(str).map((x) => MemberModel.fromJson(x)));

String memberModelToJson(List<MemberModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MemberModel {

  MemberModel({
    this.dob,
    this.id,
    this.shgId,
    this.tags,
    this.uuid,
    this.notes,
    this.edited,
    this.status,
    this.category,
    this.memberId,
    this.version,
    this.duration,
    this.xformId,
    this.memberName,
    this.attachments,
    this.geolocation,
    this.lastEdited,
    this.mediaCount,
    this.totalMedia,
    this.formhubUuid,
    this.submittedBy,
    this.dateModified,
    this.metaInstanceId,
    this.submissionTime,
    this.xformIdString,
    this.metaDeprecatedId,
    this.bambooDatasetId,
    this.mediaAllReceived,
  });

  DateTime dob;
  int id;
  int shgId;
  List<dynamic> tags;
  String uuid;
  List<dynamic> notes;
  bool edited;
  Status status;
  Category category;
  int memberId;
  String version;
  String duration;
  int xformId;
  String memberName;
  List<dynamic> attachments;
  List<dynamic> geolocation;
  DateTime lastEdited;
  int mediaCount;
  int totalMedia;
  FormhubUuid formhubUuid;
  dynamic submittedBy;
  DateTime dateModified;
  String metaInstanceId;
  DateTime submissionTime;
  XformIdString xformIdString;
  String metaDeprecatedId;
  String bambooDatasetId;
  bool mediaAllReceived;

  factory MemberModel.fromJson(Map<String, dynamic> json) => MemberModel(
    dob: DateTime.parse(json["DOB"]),
    id: json["_id"],
    shgId: json["ShgId"],
    tags: List<dynamic>.from(json["_tags"].map((x) => x)),
    uuid: json["_uuid"],
    notes: List<dynamic>.from(json["_notes"].map((x) => x)),
    edited: json["_edited"],
    status: statusValues.map[json["_status"]],
    category: categoryValues.map[json["Category"]],
    memberId: json["MemberId"],
    version: json["_version"],
    duration: json["_duration"],
    xformId: json["_xform_id"],
    memberName: json["MemberName"],
    attachments: List<dynamic>.from(json["_attachments"].map((x) => x)),
    geolocation: List<dynamic>.from(json["_geolocation"].map((x) => x)),
    lastEdited: DateTime.parse(json["_last_edited"]),
    mediaCount: json["_media_count"],
    totalMedia: json["_total_media"],
    formhubUuid: formhubUuidValues.map[json["formhub/uuid"]],
    submittedBy: json["_submitted_by"],
    dateModified: DateTime.parse(json["_date_modified"]),
    metaInstanceId: json["meta/instanceID"],
    submissionTime: DateTime.parse(json["_submission_time"]),
    xformIdString: xformIdStringValues.map[json["_xform_id_string"]],
    metaDeprecatedId: json["meta/deprecatedID"],
    bambooDatasetId: json["_bamboo_dataset_id"],
    mediaAllReceived: json["_media_all_received"],
  );

  Map<String, dynamic> toJson() => {
    "DOB": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "_id": id,
    "ShgId": shgId,
    "_tags": List<dynamic>.from(tags.map((x) => x)),
    "_uuid": uuid,
    "_notes": List<dynamic>.from(notes.map((x) => x)),
    "_edited": edited,
    "_status": statusValues.reverse[status],
    "Category": categoryValues.reverse[category],
    "MemberId": memberId,
    "_version": version,
    "_duration": duration,
    "_xform_id": xformId,
    "MemberName": memberName,
    "_attachments": List<dynamic>.from(attachments.map((x) => x)),
    "_geolocation": List<dynamic>.from(geolocation.map((x) => x)),
    "_last_edited": lastEdited.toIso8601String(),
    "_media_count": mediaCount,
    "_total_media": totalMedia,
    "formhub/uuid": formhubUuidValues.reverse[formhubUuid],
    "_submitted_by": submittedBy,
    "_date_modified": dateModified.toIso8601String(),
    "meta/instanceID": metaInstanceId,
    "_submission_time": submissionTime.toIso8601String(),
    "_xform_id_string": xformIdStringValues.reverse[xformIdString],
    "meta/deprecatedID": metaDeprecatedId,
    "_bamboo_dataset_id": bambooDatasetId,
    "_media_all_received": mediaAllReceived,
  };
}

enum Category { EBC, BC, SC }

final categoryValues = EnumValues({
  "BC": Category.BC,
  "EBC": Category.EBC,
  "SC": Category.SC
});

enum FormhubUuid { THE_57_B97151_AA0_D4_E90_AAD0471_E65_DB2_BD3 }

final formhubUuidValues = EnumValues({
  "57b97151aa0d4e90aad0471e65db2bd3": FormhubUuid.THE_57_B97151_AA0_D4_E90_AAD0471_E65_DB2_BD3
});

enum Status { SUBMITTED_VIA_WEB }

final statusValues = EnumValues({
  "submitted_via_web": Status.SUBMITTED_VIA_WEB
});

enum XformIdString { MEMBERDB }

final xformIdStringValues = EnumValues({
  "memberdb": XformIdString.MEMBERDB
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
