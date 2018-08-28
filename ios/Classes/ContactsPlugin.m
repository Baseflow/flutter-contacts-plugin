#import "ContactsPlugin.h"
#import <contacts/contacts-Swift.h>

@implementation ContactsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftContactsPlugin registerWithRegistrar:registrar];
}
@end
