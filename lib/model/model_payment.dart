class PaymentFree{
  bool isUserOwnCourse;
  PaymentFree({this.isUserOwnCourse});
  factory PaymentFree.fromJson(Map<String, dynamic> json){
    return PaymentFree(
      isUserOwnCourse: json["isUserOwnCourse"]
    );
  }
}