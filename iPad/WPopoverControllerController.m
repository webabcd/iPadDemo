//
// 演示 UIPopoverController 的应用
//
// 弹出的内容参见：WPopoverContentController.m
//

#import "WPopoverControllerController.h"
#import "WPopoverContentController.h"

@interface WPopoverControllerController ()

// 弹出的内容
@property (nonatomic, strong) WPopoverContentController *popoverContent;

// UIPopoverController
@property (nonatomic, strong) UIPopoverController *myPopoverController;

@end

@implementation WPopoverControllerController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)btnPopoverPressed:(id)sender
{
    // 检测是否支持 UIPopoverController（iPad 支持，iPhone 不支持）
    Class popoverClass = NSClassFromString(@"UIPopoverController");
    if (popoverClass != nil)
    {
        // 实例化弹出的内容
        self.popoverContent = [[WPopoverContentController alloc] init];
        
        // 实例化 UIPopoverController，并指定其需要弹出的内容
        self.myPopoverController = [[UIPopoverController alloc] initWithContentViewController:self.popoverContent];
        
        // 让弹出内容知道是哪个 UIPopoverController 弹出它的
        self.popoverContent.myPopoverController = self.myPopoverController;
        
        // 在指定的 barButtonItem 上弹出内容
        // self.popoverController presentPopoverFromBarButtonItem:<#(UIBarButtonItem *)#> permittedArrowDirections:<#(UIPopoverArrowDirection)#> animated:<#(BOOL)#>
        
        // 在指定的位置弹出内容
        //     第一个参数：弹出框小箭头的位置
        //     第二个单数：在哪个 view 中弹出内容
        //     第三个参数：弹出框小箭头的方向
        //         UIPopoverArrowDirectionUp, UIPopoverArrowDirectionDown, UIPopoverArrowDirectionLeft, UIPopoverArrowDirectionRight
        //         UIPopoverArrowDirectionAny - 由系统自己决定
        //         0 - 不显示小箭头（此时第一个参数代表弹出框中心点的位置）
        [self.myPopoverController presentPopoverFromRect:CGRectMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2, 0, 0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
}

@end
