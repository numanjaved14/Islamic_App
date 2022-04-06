class HadithModel {
  int? iId;
  String? arDua;
  Null? arReference;
  String? enReference;
  String? enTranslation;
  int? fav;
  int? groupId;
  String? translit;

  HadithModel(
      {this.iId,
      this.arDua,
      this.arReference,
      this.enReference,
      this.enTranslation,
      this.fav,
      this.groupId,
      this.translit});

  HadithModel.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    arDua = json['ar_dua'];
    arReference = json['ar_reference'];
    enReference = json['en_reference'];
    enTranslation = json['en_translation'];
    fav = json['fav'];
    groupId = json['group_id'];
    translit = json['translit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.iId;
    data['ar_dua'] = this.arDua;
    data['ar_reference'] = this.arReference;
    data['en_reference'] = this.enReference;
    data['en_translation'] = this.enTranslation;
    data['fav'] = this.fav;
    data['group_id'] = this.groupId;
    data['translit'] = this.translit;
    return data;
  }
}
