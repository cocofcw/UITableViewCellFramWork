//
//  BaseTableViewController.m
//  test12
//
//  Created by fuchaowen on 14-1-14.
//  Copyright (c) 2014年 付超汶. All rights reserved.
//

#import "BaseTableViewController.h"
#import "MyCell.h"
#import "CellFactory.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

/*---------------------------------
 *对象在被释放前,释放它所拥有的所有对象
 *--------------------------------*/


/*-------------------------------------------------------------------------------
 *指派初始化方法,在此方法中初始化和视图显示无关的只加载一次的数据
 *------------------------------------------------------------------------------*/
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        //数据源初始化
        _dataSource = [self hardCode];
    }
    return self;
}


/*-------------------------------------------------------------------------------
 *子类需要重写此方法,来实现不同数据对象的封装(即用此方法封装MVC中的Model)
 *------------------------------------------------------------------------------*/
- (NSMutableArray *)hardCode
{
    return nil;
}

/*-------------------------------------------------------------------------------
 *self.view加载完成时调用此方法,可见的视图和能重现的数据在此方法中进行设置
 *------------------------------------------------------------------------------*/
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //1.初始化tableView
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    //设置控制器为数据源代理
    [_tableView setDataSource:self];
    //设置控制器为tableView行为代理
    [_tableView setDelegate:self];
    //追加tableView到self.view
    [self.view addSubview:_tableView];
    
    /*------------------------------------------------------------------------
     *为项目中会使用到得cell类进行注册,可重用标识符为相应cell的类名,当向tableView发送
     *[tableView dequeueReusableCellWithIdentifier:cellIdentifier]消息时,
     *如果没有可以重用的cell单元,tableView就会用我们注册的类给我们创建一个对应的cell对象
     *------------------------------------------------------------------------*/
    [_tableView registerClass:[MyCell class]  forCellReuseIdentifier:NSStringFromClass([MyCell class])];
    
}

#pragma mark - dataSource method
/*-----------------------------
 *返回每段中表格单元的个数
 *----------------------------*/
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSource count];
}

/*---------------------------------------------------------------------------------------------------
 *返回指定位置的cell,该方法实现了代码的通用性.首先数据模型是用基类的指针指向子类的对象,然后获得该数据模型对应自定义cell的
 *具体类型,接着用该自定义cell类型获得cell实例,其中cell工厂起到了拆分数据模型和cell强耦合的关系,使得该代码可以完成不同数据
 *模型找到相对应的不同cell的功能,代码的通用性很强,这是面向对象编程的强大之处.
 *--------------------------------------------------------------------------------------------------*/
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.取出对应行的数据对象
    BaseModel *modelForCell = [_dataSource objectAtIndex:indexPath.row];
    
    //2.获得该数据模型对应cell的类型
    Class cellClass = [CellFactory cellClassForModel:modelForCell];
    
    //3.以cell对应的类名获取对应的可重用cell单元,如果没有找到可重用cell单元就创建新的cell对象(注意:把获得的对象赋给基类的指针)
    BaseCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([cellClass class])];
    
    //4.为获得cell设置对应的数据
    [cell setDataForCell:modelForCell];
    
    return cell;
}

#pragma mark - tableView delegate method
/*---------------------------------------------------------------------
 *>>返回指定位置的cell高度<<i
 *不同类型的cell可能有不同的高度,即使相同类型的cell也可能因为文本内容不同等造成
 *拥有不同的单元高度,我们需要在此方法中找到指定单元所属的cell类型,然后访问cell的
 *返回cell高度的类方法(之所以是类方法,是因为此时cell对象还没有实例化),获取指定cell
 *单元的高度,然后返回给tableView.项目中用到得所有自定义cell子类都需要实现该类方法!
 *---------------------------------------------------------------------*/
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.获得指定单元所对应的数据对象
    BaseModel *model = [_dataSource objectAtIndex:indexPath.row];
    
    //2.获得该数据对象所对应的cell类型
    Class cellClass = [CellFactory cellClassForModel:model];
    
    //3.获得对应的cell类型在显示该数据对象时的高度
    CGFloat height = [cellClass cellHeightForModel:model];
    
    return height;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
