#import "ContactsPlugin.h"
#import <BFContacts/BFContacts-Swift.h>

@implementation ContactsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftContactsPlugin registerWithRegistrar:registrar];
}
@end
