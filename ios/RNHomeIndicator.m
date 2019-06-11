
#import "RNHomeIndicator.h"
#import "HomeIndicatorViewController.h"

@implementation RNHomeIndicator

- (id) init {
    [self setPreferredScreenEdge:UIRectEdgeNone];
    return [super init];
}

- (void) setPreferredScreenEdge: (UIRectEdge) newValue {
    HomeIndicatorViewController *rootViewController = [self getHomeIndicatorViewController];
    if (rootViewController == nil) {
        NSLog(@"ERROR - RNHomeIndicator.m: rootViewController is not of type HomeIndicatorViewController as expected.");
    }

    rootViewController.preferredScreenEdge = newValue;
    [rootViewController setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
}

- (HomeIndicatorViewController*) getHomeIndicatorViewController {
    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    if (![rootViewController isKindOfClass:[HomeIndicatorViewController class]]) {
        return nil;
    }
    return (HomeIndicatorViewController*) rootViewController;
}

- (dispatch_queue_t)methodQueue {
    return dispatch_get_main_queue();
}

+ (BOOL)requiresMainQueueSetup {
    return YES;
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(alwaysVisible) {
    [self setPreferredScreenEdge:UIRectEdgeNone];
}

RCT_EXPORT_METHOD(autoEdgeProtection) {
    [self setPreferredScreenEdge:UIRectEdgeAll];
}

@end


  
