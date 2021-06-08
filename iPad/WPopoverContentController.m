//
// 由 UIPopoverController 弹出的内容
//

#import "WPopoverContentController.h"

@interface WPopoverContentController ()

@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;

@end

@implementation WPopoverContentController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    // 弹出内容的大小
    self.preferredContentSize = CGSizeMake(600, 300);
    
    
    // 添加 2 个按钮
    CGRect buttonRect = CGRectMake(0, 0, 560, 50);
    self.button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.button1 setTitle:@"按钮1" forState:UIControlStateNormal];
    self.button1.frame = buttonRect;
    [self.button1 addTarget:self action:@selector(button1Pressed:) forControlEvents:UIControlEventTouchUpInside];
    
    buttonRect.origin.y += 80;
    self.button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.button2 setTitle:@"按钮1" forState:UIControlStateNormal];
    self.button2.frame = buttonRect;
    [self.button2 addTarget:self action:@selector(button2Pressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.button1];
    [self.view addSubview:self.button2];
}

- (void)button1Pressed:(id)sender
{
    NSLog(@"按钮1被单击了");
    
    // 隐藏 UIPopoverController
    [self.myPopoverController dismissPopoverAnimated:YES];
}

- (void)button2Pressed:(id)sender
{
    NSLog(@"按钮2被单击了");
    
    // 隐藏 UIPopoverController
    [self.myPopoverController dismissPopoverAnimated:YES];
}

@end
