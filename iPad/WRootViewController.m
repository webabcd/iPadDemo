//
// UISplitViewController 的 rootView（左侧 view）
//

#import "WRootViewController.h"
#import "WDetailViewController.h"

@interface WRootViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *array;

@end

@implementation WRootViewController

// 从 stroyboard 加载的会通过 initWithCoder 初始化
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        // 构造数据源
        self.array = @[@"webabcd 01", @"webabcd 02", @"webabcd 03", @"webabcd 04", @"webabcd 05", @"webabcd 06", @"webabcd 07", @"webabcd 08", @"webabcd 09", @"webabcd 10", @"webabcd 11", @"webabcd 12", @"webabcd 13", @"webabcd 14", @"webabcd 15", @"webabcd 16", @"webabcd 17", @"webabcd 18", @"webabcd 19", @"webabcd 20", @"webabcd 21", @"webabcd 22", @"webabcd 23", @"webabcd 24", @"webabcd 25", @"webabcd 26", @"webabcd 27", @"webabcd 28", @"webabcd 29", @"webabcd 30"];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
}


#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reusableCellQueueId = @"WTableView5Controller_reusableCellQueueId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusableCellQueueId];
    
    if (cell == nil)
    {
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusableCellQueueId];
    }
    
    cell.textLabel.text = [self.array objectAtIndex:[indexPath row]];
    cell.detailTextLabel.text = @"detailText";
    
    return cell;
}


#pragma mark -
#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 获取 detailView
    WDetailViewController *detailViewController = (WDetailViewController *)[self.splitViewController.viewControllers objectAtIndex:1];

    // 向 detailView 发送消息
    detailViewController.label.text = [NSString stringWithFormat:@"selected: %d",indexPath.row];
}

@end
