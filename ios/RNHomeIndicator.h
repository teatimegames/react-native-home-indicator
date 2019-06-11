
#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

#import <UIKit/UIKit.h>


@interface HomeIndicatorViewController : UIViewController
@property UIRectEdge preferredScreenEdge;
@end

@interface RNHomeIndicator : NSObject <RCTBridgeModule>
@end

  
