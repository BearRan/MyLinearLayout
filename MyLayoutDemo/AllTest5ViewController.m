//
//  AllTest5ViewController.m
//  MyLayout
//
//  Created by fzy on 16/1/24.
//  Copyright © 2016年 YoungSoft. All rights reserved.
//

#import "AllTest5ViewController.h"
#import "MyLayout.h"
#import "CFTool.h"

@interface AllTest5ViewController ()

@end

@implementation AllTest5ViewController

-(void)loadView
{
    /*
        这个例子用来介绍MyLayout对sizeClasses的支持的能力
     */
    
    self.edgesForExtendedLayout = UIRectEdgeNone;  //设置视图控制器中的视图尺寸不延伸到导航条或者工具条下面。您可以注释这句代码看看效果。

    
    //默认设置为垂直布局
    MyLinearLayout *rootLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    rootLayout.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    rootLayout.wrapContentHeight = NO;
    rootLayout.gravity = MyGravity_Horz_Fill;
    rootLayout.subviewSpace = 10;
    rootLayout.backgroundColor = [UIColor whiteColor];
    self.view = rootLayout;

    
    UILabel *v1 = [UILabel new];
    v1.backgroundColor = [CFTool color:5];
    v1.numberOfLines = 0;
    v1.text = NSLocalizedString(@"The red、green、blue subwiews is arranged vertically when run in portrait screen on all the iPhone devices,but horizontal arranged when in landscape screen, the blue subview is not showed on any phone devices except on iPhone6plus.", @"");
    v1.textColor = [CFTool color:4];
    v1.font = [CFTool font:15];
    v1.weight = 1;
    [rootLayout addSubview:v1];
    
    
    UILabel *v2 = [UILabel new];
    v2.backgroundColor = [CFTool color:6];
    v2.weight = 1;
    [rootLayout addSubview:v2];

    
    UILabel *v3 = [UILabel new];
    v3.backgroundColor = [CFTool color:7];
    v3.weight = 1;
    [rootLayout addSubview:v3];
        
    //v3视图在其他任何iPhone设备横屏都不参与布局
    [v3 fetchLayoutSizeClass:MySizeClass_wAny | MySizeClass_hCompact].visibility = MyVisibility_Gone;
    //只有iphone6Plus的横屏才参与布局
    [v3 fetchLayoutSizeClass:MySizeClass_wRegular | MySizeClass_hCompact copyFrom:MySizeClass_wAny | MySizeClass_hAny].visibility = MyVisibility_Visible;
    
    //针对iPhone设备的所有横屏的高度都是Compact的，而宽度则是任意，因此下面的设置横屏情况下布局变为水平布局。
    //虽然fetchLayoutSizeClass方法真实返回的是MyLayoutSize或者其派生类，但是仍然可以用视图以及布局来设置其中的属性
    //但是调用lsc.backgroundColor = xx 则会崩溃，因为fetchLayoutSizeClass返回的并不是真的视图对象。
    MyLinearLayout *lsc = [rootLayout fetchLayoutSizeClass:MySizeClass_wAny | MySizeClass_hCompact copyFrom:MySizeClass_wAny | MySizeClass_hAny];
    lsc.orientation = MyOrientation_Horz;
    lsc.wrapContentWidth = NO;
    lsc.gravity = MyGravity_Vert_Fill;
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
