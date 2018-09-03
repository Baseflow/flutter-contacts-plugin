#import "ContactsPlugin.h"
#import <contacts_plugin/contacts_plugin-Swift.h>

@implementation ContactsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftContactsPlugin registerWithRegistrar:registrar];
}
@end
