import 'Developer.dart';
import 'Maintainer.dart';
import 'SrcOptions.dart';

class Meta {
  Meta([
      this.attribution,
      this.blockgroup,
      this.createdDate,
      this.description,
      this.designer,
      this.devDate,
      this.devMilestone,
      this.developer,
      this.exampleQuery,
      this.id,
      this.isStackexchange,
      this.jsCallbackName,
      this.liveDate,
      this.maintainer,
      this.name,
      this.perlModule,
      this.producer,
      this.productionState,
      this.repo,
      this.signalFrom,
      this.srcDomain,
      this.srcId,
      this.srcName,
      this.srcOptions,
      this.srcUrl,
      this.status,
      this.tab,
      this.topic,
      this.unsafe]);

  Meta.fromJson(dynamic json) {
    attribution = json['attribution'];
    blockgroup = json['blockgroup'];
    createdDate = json['created_date'];
    description = json['description'];
    designer = json['designer'];
    devDate = json['dev_date'];
    devMilestone = json['dev_milestone'];
    developer = [];
    if (json['developer'] != null) {
      developer = [];
      json['developer'].forEach((v) {
        developer?.add(Developer.fromJson(v));
      });
    } else {
      developer = [];
    }
    exampleQuery = json['example_query'];
    id = json['id'];
    isStackexchange = json['is_stackexchange'];
    jsCallbackName = json['js_callback_name'];
    liveDate = json['live_date'];
    maintainer = (json['maintainer'] != null ? Maintainer.fromJson(json['maintainer']) : null)!;
    name = json['name'];
    perlModule = json['perl_module'];
    producer = json['producer'];
    productionState = json['production_state'];
    repo = json['repo'];
    signalFrom = json['signal_from'];
    srcDomain = json['src_domain'];
    srcId = json['src_id'];
    srcName = json['src_name'];
    srcOptions = (json['src_options'] != null ? SrcOptions.fromJson(json['src_options']) : SrcOptions());
    srcUrl = json['src_url'];
    status = json['status'];
    tab = json['tab'];
    topic = json['topic'] != null ? json['topic'].cast<String>() : [];
    unsafe = json['unsafe'];
  }
  dynamic attribution;
  dynamic blockgroup;
  dynamic createdDate;
  dynamic description;
  dynamic designer;
  dynamic devDate;
  dynamic devMilestone;
  late List<Developer>? developer = [];
  dynamic exampleQuery;
  dynamic id;
  dynamic isStackexchange;
  dynamic jsCallbackName;
  dynamic liveDate;
  late Maintainer? maintainer;
  dynamic name;
  dynamic perlModule;
  dynamic producer;
  dynamic productionState;
  dynamic repo;
  dynamic signalFrom;
  dynamic srcDomain;
  dynamic srcId;
  dynamic srcName;
  late SrcOptions? srcOptions;
  dynamic srcUrl;
  dynamic status;
  dynamic tab;
  late List<String>? topic;
  dynamic unsafe;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['attribution'] = attribution;
    map['blockgroup'] = blockgroup;
    map['created_date'] = createdDate;
    map['description'] = description;
    map['designer'] = designer;
    map['dev_date'] = devDate;
    map['dev_milestone'] = devMilestone;
    if (developer != null) {
      map['developer'] = developer?.map((v) => v.toJson()).toList();
    }
    map['example_query'] = exampleQuery;
    map['id'] = id;
    map['is_stackexchange'] = isStackexchange;
    map['js_callback_name'] = jsCallbackName;
    map['live_date'] = liveDate;
    if (maintainer != null) {
      map['maintainer'] = maintainer?.toJson();
    }
    map['name'] = name;
    map['perl_module'] = perlModule;
    map['producer'] = producer;
    map['production_state'] = productionState;
    map['repo'] = repo;
    map['signal_from'] = signalFrom;
    map['src_domain'] = srcDomain;
    map['src_id'] = srcId;
    map['src_name'] = srcName;
    if (srcOptions != null) {
      map['src_options'] = srcOptions?.toJson();
    }
    map['src_url'] = srcUrl;
    map['status'] = status;
    map['tab'] = tab;
    map['topic'] = topic;
    map['unsafe'] = unsafe;
    return map;
  }

}