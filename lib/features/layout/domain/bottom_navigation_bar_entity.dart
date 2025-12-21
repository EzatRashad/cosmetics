import '../../../../core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String activeImage, inActiveImage;

  BottomNavigationBarEntity(
      {required this.activeImage,
      required this.inActiveImage,
    });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
      BottomNavigationBarEntity(
          activeImage: Assets.assetsIconsActiveHome,
          inActiveImage: Assets.assetsIconsHome,
         ),
      BottomNavigationBarEntity(
          activeImage: Assets.assetsIconsActiveCategories,
          inActiveImage: Assets.assetsIconsCategories,
         ),
      BottomNavigationBarEntity(
          activeImage: Assets.assetsIconsActiveCart,
          inActiveImage: Assets.assetsIconsCart,
         ),
      BottomNavigationBarEntity(
          activeImage: Assets.assetsIconsActiveProfile,
          inActiveImage: Assets.assetsIconsProfile,
         ),
    ];
