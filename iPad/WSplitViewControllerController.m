//
// 演示 UISplitViewController 的应用
//

#import "WSplitViewControllerController.h"
#import "WRootViewController.h"
#import "WDetailViewController.h"

@interface WSplitViewControllerController ()

// UISplitViewController
@property (nonatomic, strong) UISplitViewController *mySplitViewController;

// SplitView 左侧 view 称之为 RootView（参见 WRootViewController.m），左侧 view 也可以称之为 masterView
@property (nonatomic, strong) WRootViewController *rootViewController;
// SplitView 右侧 view 称之为 DetailView（参见 WDetailViewController）
@property (nonatomic, strong) WDetailViewController *detailViewController;

@end

@implementation WSplitViewControllerController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // 实例化一个 UISplitViewController
    self.mySplitViewController = [[UISplitViewController alloc] init];
    
    // 实例化 RootView 和 DetailView
    UIStoryboard *s = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.rootViewController = [s instantiateViewControllerWithIdentifier:@"RootView"];
    self.detailViewController = [s instantiateViewControllerWithIdentifier:@"DetailView"];
 
    // 设置 UISplitViewController 所需的两个 viewController
    // 第一个是 rootView（左侧view），第二个是 detailView（右侧view）
    self.mySplitViewController.viewControllers = @[self.rootViewController, self.detailViewController];
    
    // 将 UISplitViewController 添加进当前的 view
    [self.view addSubview:self.mySplitViewController.view];

    
    // 让 detailView 处理 UISplitViewController 的 delegate
    self.mySplitViewController.delegate = self.detailViewController;
}

@end
