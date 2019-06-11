
#import "RNHomeIndicator.h"

@implementation HomeIndicatorViewController

- (UIRectEdge)preferredScreenEdgesDeferringSystemGestures {
    return self.preferredScreenEdge;
}

@end


@implementation RNHomeIndicator

- (id) init {
    [self setPreferredScreenEdge:UIRectEdgeNone];
    return [super init];
}

- (void) setPreferredScreenEdge: (UIRectEdge) newValue {
    HomeIndicatorViewController *rootViewController = [self getHomeIndicatorViewController];

    rootViewController.preferredScreenEdge = newValue;
    if (@available(iOS 11.0, *)) {
        [rootViewController setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
    }
}

- (HomeIndicatorViewController*) getHomeIndicatorViewController {
    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    NSAssert(
        [rootViewController isKindOfClass:[HomeIndicatorViewController class]],
        @"rootViewController is not of type HomeIndicatorViewController as expected."
    );
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
    [self setPreferredScreenEdge:UIRectEdgeBottom];
}

@end


  
