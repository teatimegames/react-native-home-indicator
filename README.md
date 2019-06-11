#### Changes in BaseAppdelegate.m

```objective-c
// add to your imports
#import <HomeIndicatorViewController.h>
```

```objective-c
// find this line
UIViewController *rootViewController = [UIViewController new];
```

```objective-c
// and replace with
UIViewController *rootViewController = [HomeIndicatorViewController new];
```

## Simple Usage

Render `<ReactNativeHomeIndicator />` to signal your preference for using edge protection.

```jsx
...
let make = () => {
    ...component,
    render: _self =>
        <View>
            <ReactNativeHomeIndicator autoEdgeProtection=true />
            ...
        </View>,
};
```
