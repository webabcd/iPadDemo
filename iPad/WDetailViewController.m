//
// UISplitViewController 的 detailView（右侧 view）
//

#import "WDetailViewController.h"

@interface WDetailViewController ()
{
    // detailView 的工具栏，用于放置一个显示 rootView 的按钮
    UIToolbar *toolBar;
}

@end

@implementation WDetailViewController

// 从 stroyboard 加载的会通过 initWithCoder 初始化
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 实例化一个 UIToolbar，并添加进来
    toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 768, 44)];
    [self.view addSubview:toolBar];
    
    // 实例化一个 UILabel，用于接收 rootView 传递过来的消息
    self.label = [[UILabel alloc] initWithFrame:self.view.frame];
    self.label.textColor = [UIColor blueColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.text = @"label";
    [self.view addSubview:self.label];
}



#pragma mark -
#pragma mark UISplitViewControllerDelegate
// rootView 弹出来了（在 UISplitViewController 中，rootView 是通过 UIPopoverController 弹出来的）
- (void)splitViewController:(UISplitViewController *)svc popoverController:(UIPopoverController *)pc willPresentViewController:(UIViewController *)aViewController
{
    self.label.text = @"rootView 被 UIPopoverController 弹出来了";
}

// 某个设备方向上是否要隐藏 rootView
- (BOOL)splitViewController:(UISplitViewController *)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation
{
    if (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight)
    {
        return NO;
    }
    else
    {
        // 是否支持手势滑出 rootView（比如当前没有显示 rootView，则左侧边缘 swipe 一下可以滑出 rootView）
        self.splitViewController.presentsWithGesture = YES;
        
        return YES;
    }
}

// rootView 将要被隐藏
- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    // 显示一个用于弹出 rootView 的 UIBarButtonItem
    barButtonItem.title = @"显示 rootView";
    [toolBar setItems:@[barButtonItem] animated:YES];
}

// rootView 将要被显示
- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // 将用于弹出 rootView 的 UIBarButtonItem 隐藏掉
    [toolBar setItems:@[] animated:YES];
}

@end
