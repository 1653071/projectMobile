class VideoModel{
  String id;

  String name;
  double hour;
  String sectionId;
  VideoModel({this.id,this.name,this.hour,this.sectionId});
  factory VideoModel.fromJson(Map<String,dynamic>json){
    return VideoModel(
      id : json["id"],
      name: json["name"],
      hour: json["hours"].toDouble(),
      sectionId: json["sectionId"]
    );
  }
}
class VideoUrl{
  String videoUrl;
  double currentTime;
  VideoUrl({this.videoUrl,this.currentTime});
  factory VideoUrl.fromJson(Map<String,dynamic>json){
    return VideoUrl(
        videoUrl : json["videoUrl"].toString(),
      currentTime: json["currentTime"].toDouble()
    );
  }
}