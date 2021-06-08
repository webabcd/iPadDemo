//
// UISplitViewController 的 detailView（右侧 view）
//

#import <UIKit/UIKit.h>

@interface WDetailViewController : UIViewController<UISplitViewControllerDelegate>

@property (nonatomic, strong) UILabel *label;

@end
