
class BottomNavigationBarEntity {
  final String activeImage, inActiveImage;

  BottomNavigationBarEntity(
      {required this.activeImage,
      required this.inActiveImage,
    });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
      BottomNavigationBarEntity(
          activeImage: "active_home.svg",
          inActiveImage: "home.svg",
         ),
      BottomNavigationBarEntity(
          activeImage: "active_categories.svg",
          inActiveImage: "categories.svg",
         ),
      BottomNavigationBarEntity(
          activeImage: "active_cart.svg",
          inActiveImage: "cart.svg",
         ),
      BottomNavigationBarEntity(
          activeImage: "active_profile.svg",
          inActiveImage: "profile.svg",
         ),
    ];
