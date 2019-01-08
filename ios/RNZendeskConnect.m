
#import "RNZendeskConnect.h"
#import <Outbound/Outbound.h>

@implementation RNZendeskConnect

- (void)initialise {
    // If we're on iOS 10 then we need to set this as a delegate for the UNUserNotificationCenter
    if (@available(iOS 10.0, *)) {
        [UNUserNotificationCenter currentNotificationCenter].delegate = self;
    }
}


- (void)didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
  // The user gave push notification permissions, store the APNS
  // token with the Outbound servers.
  [Outbound registerDeviceToken:deviceToken];
}

- (void)didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    if ([Outbound isOutboundNotification:userInfo]) {
        [Outbound handleNotificationWithUserInfo:userInfo completion:^(BOOL success) {
            completionHandler(success ? UIBackgroundFetchResultNewData : UIBackgroundFetchResultFailed);
        }];
    } else {
        // Handle non-Connect notifications here
        completionHandler(UIBackgroundFetchResultNoData);
    }
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    // Optionally allow showing notifications while the app is in the foreground.
    completionHandler(UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionSound | UNNotificationPresentationOptionBadge);
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
    [Outbound handleNotificationResponse:response];
    completionHandler();
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(initialize:(NSString *)privateKey callback:(RCTResponseSenderBlock)callback)
{
  [Outbound initWithPrivateKey:privateKey];
  callback(@[[NSNull null]]);
}

RCT_EXPORT_METHOD(registerForPush:(NSString *)customerId callback:(RCTResponseSenderBlock)callback)
{
  NSMutableDictionary* attributes = @{}.mutableCopy;
  [Outbound identifyUserWithId:customerId attributes:attributes];
  callback(@[[NSNull null]]);
}

RCT_EXPORT_METHOD(logout:(RCTResponseSenderBlock)callback)
{
  [Outbound logout];
  callback(@[[NSNull null]]);
}


@end
  