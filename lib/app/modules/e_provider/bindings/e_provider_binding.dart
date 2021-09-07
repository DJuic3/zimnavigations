import 'package:get/get.dart';
import 'package:zimnavigation/app/modules/messages/controller/messages_controller.dart';

import '../controllers/e_provider_controller.dart';
import '../controllers/e_services_controller.dart';

class EProviderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EProviderController>(
      () => EProviderController(),
    );
    Get.lazyPut<EServicesController>(
      () => EServicesController(),
    );
    Get.lazyPut<MessagesController>(
      () => MessagesController(),
    );
  }
}
