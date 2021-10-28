#import "FlutterPromotionPlugin.h"
#if __has_include(<flutter_promotion/flutter_promotion-Swift.h>)
#import <flutter_promotion/flutter_promotion-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_promotion-Swift.h"
#endif

@implementation FlutterPromotionPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterPromotionPlugin registerWithRegistrar:registrar];
}
@end
