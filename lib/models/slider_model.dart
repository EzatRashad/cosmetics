class SliderModel {
  int? id;
  String? couponCode;
  int? discountPercent;
  String? descriptionTitle1;
  String? descriptionTitle2;
  String? imageUrl;

  SliderModel({
    this.id,
    this.couponCode,
    this.discountPercent,
    this.descriptionTitle1,
    this.descriptionTitle2,
    this.imageUrl,
  });

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    couponCode = json['couponCode'];
    discountPercent = json['discountPercent'];
    descriptionTitle1 = json['descriptionTitle1'];
    descriptionTitle2 = json['descriptionTitle2'];
    imageUrl = json['imageUrl'];
  }
}

SliderModel dummySlideer = SliderModel(
  couponCode: "xxxxx",
  descriptionTitle1: "descriptionTitle1",
  descriptionTitle2: "descriptionTitle2",
  imageUrl:
      "https://images.pexels.com/photos/2866796/pexels-photo-2866796.jpeg",
  id: 5555,
  discountPercent: 50,
);
