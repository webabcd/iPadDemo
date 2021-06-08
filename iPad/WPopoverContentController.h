//
// 由 UIPopoverController 弹出的内容
//

#import <UIKit/UIKit.h>

@interface WPopoverContentController : UIViewController

// 为了让此弹出内容知道是哪个 UIPopoverController 弹出它的
// 注意：这里要声明为 weak (因为它在 UIPopoverController 中是 strong 的)
@property (nonatomic, weak) UIPopoverController *myPopoverController;

@end
