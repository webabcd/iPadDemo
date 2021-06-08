//
// 演示 UIActivityViewController 的应用
//
// UIActivityViewController - 用于弹出分享框（注：iPhone 与 iPad 的弹出方式不同）
// iphone 弹出模式对话框；ipad 用 popover 弹出
//
// 关于 UIActivityViewController 的更详细的说明参见 iPhone Demo
//

#import "WActivityViewControllerController.h"

@interface WActivityViewControllerController ()

@property (nonatomic, strong) UIActivityViewController *activityViewController;
@property (nonatomic, strong) UIPopoverController *myPopoverController;

@end

@implementation WActivityViewControllerController

- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (IBAction)btnSharePressed:(id)sender
{
    // 实力化 UIActivityViewController，并指定需要分享的数据
    self.activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[@"文字信息"] applicationActivities:nil];
    
    // 通过 UIPopoverController 弹出分享框
    self.myPopoverController = [[UIPopoverController alloc] initWithContentViewController:self.activityViewController];
    [self.myPopoverController presentPopoverFromRect:CGRectMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2, 0, 0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
}

@end
