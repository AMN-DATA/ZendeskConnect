#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif
#import <UserNotifications/UserNotifications.h>

@interface RNZendeskConnect : NSObject <RCTBridgeModule, UNUserNotificationCenterDelegate>

@end
