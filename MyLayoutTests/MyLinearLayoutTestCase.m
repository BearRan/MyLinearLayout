//
//  MyLinearLayoutTestCase.m
//  MyLayout
//
//  Created by apple on 17/4/25.
//  Copyright © 2017年 YoungSoft. All rights reserved.
//

#import "MyLayoutTestCaseBase.h"
#import "TLTest3ViewController.h"

@interface MyLinearLayoutTestCase : MyLayoutTestCaseBase

@end

@implementation MyLinearLayoutTestCase

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

-(void)testWrapContentHeight
{
    
    
}

- (void)testTable1 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    TLTest3ViewController *vc = [TLTest3ViewController new];
    
    [self startClock];
    
    UIView *view = vc.view;
    
    [self endClock:@"vc loadview"];   //>=20ms
    
    [self startClock];
    
    [view layoutIfNeeded];
    
    [self endClock:@"view layout"];
    
}

-(void)testSubviewSizeDependent
{//测试子视图尺寸依赖
    
    //垂直线性布局
    {
        MyLinearLayout *rootLayout1 = [[MyLinearLayout alloc] initWithFrame:CGRectMake(0, 0, 375, 667) orientation:MyOrientation_Vert];
        rootLayout1.wrapContentHeight = NO;
        //1. 子视图宽度等于自身高度
        UILabel *label1 = [UILabel new];
        label1.myHeight = 100;
        label1.widthSize.equalTo(label1.heightSize);
        [rootLayout1 addSubview:label1];
        
        
        //2. 子视图高度等于自身宽度
        UILabel *label2 = [UILabel new];
        label2.wrapContentWidth = YES;
        label2.heightSize.equalTo(label2.widthSize);
        label2.text = @"hello World";
        [rootLayout1 addSubview:label2];
        
        //3. 子视图高度等于兄弟视图高度, 子视图宽度等于兄弟视图宽度
        UILabel *label3 = [UILabel new];
        label3.heightSize.equalTo(label1.heightSize);
        label3.widthSize.equalTo(label1.widthSize);
        [rootLayout1 addSubview:label3];
        
        //4. 子视图高度等于兄弟视图宽度, 子视图宽度等于兄弟视图高度
        UILabel *label4 = [UILabel new];
        label4.widthSize.equalTo(label2.heightSize).add(20);
        label4.heightSize.equalTo(label2.widthSize).add(10).multiply(0.5);
        [rootLayout1 addSubview:label4];
        
        //5. 子视图宽度等于父视图宽度，高度等于宽度
        UILabel *label5 = [UILabel new];
        label5.widthSize.equalTo(rootLayout1.widthSize).add(-20);
        label5.heightSize.equalTo(label5.widthSize);
        [rootLayout1 addSubview:label5];
        
        //6. 子视图高度等于父视图高度，宽度等于高度
        UILabel *label6 = [UILabel new];
        label6.heightSize.equalTo(rootLayout1.heightSize).multiply(0.5);
        label6.widthSize.equalTo(label6.heightSize);
        [rootLayout1 addSubview:label6];
        
        [rootLayout1 layoutIfNeeded];
        
        XCTAssertTrue(label1.frame.size.width == label1.frame.size.height, @"label1.frame = %@",NSStringFromCGRect(label1.frame));
        XCTAssertTrue(label2.frame.size.width == label2.frame.size.height, @"label1.frame = %@",NSStringFromCGRect(label2.frame));
        XCTAssertTrue(label3.frame.size.width == label1.frame.size.width &&
                      label3.frame.size.height == label1.frame.size.height, @"label3.frame = %@",NSStringFromCGRect(label3.frame));
        XCTAssertTrue(label4.frame.size.width == (label2.frame.size.height + 20) &&
                      label4.frame.size.height == (label2.frame.size.width * 0.5 + 10), @"label4.frame = %@",NSStringFromCGRect(label4.frame));
        
        XCTAssertTrue(label5.frame.size.width == (rootLayout1.frame.size.width - 20) &&
                      label5.frame.size.height == label5.frame.size.width, @"label5.frame = %@",NSStringFromCGRect(label5.frame));
        
        XCTAssertTrue(label6.frame.size.width == label6.frame.size.height &&
                      label6.frame.size.height == rootLayout1.frame.size.height * 0.5, @"label6.frame = %@",NSStringFromCGRect(label6.frame));
    }

    
    //水平线性布局
    {
        MyLinearLayout *rootLayout1 = [[MyLinearLayout alloc] initWithFrame:CGRectMake(0, 0, 375, 667) orientation:MyOrientation_Horz];
        rootLayout1.wrapContentWidth = NO;
        //1. 子视图宽度等于自身高度
        UILabel *label1 = [UILabel new];
        label1.myHeight = 100;
        label1.widthSize.equalTo(label1.heightSize);
        [rootLayout1 addSubview:label1];
        
        
        //2. 子视图高度等于自身宽度
        UILabel *label2 = [UILabel new];
        label2.wrapContentWidth = YES;
        label2.heightSize.equalTo(label2.widthSize);
        label2.text = @"hello World";
        [rootLayout1 addSubview:label2];
        
        //3. 子视图高度等于兄弟视图高度, 子视图宽度等于兄弟视图宽度
        UILabel *label3 = [UILabel new];
        label3.heightSize.equalTo(label1.heightSize);
        label3.widthSize.equalTo(label1.widthSize);
        [rootLayout1 addSubview:label3];
        
        //4. 子视图高度等于兄弟视图宽度, 子视图宽度等于兄弟视图高度
        UILabel *label4 = [UILabel new];
        label4.widthSize.equalTo(label2.heightSize).add(20);
        label4.heightSize.equalTo(label2.widthSize).add(10).multiply(0.5);
        [rootLayout1 addSubview:label4];
        
        //5. 子视图宽度等于父视图宽度，高度等于宽度
        UILabel *label5 = [UILabel new];
        label5.widthSize.equalTo(rootLayout1.widthSize).add(-20);
        label5.heightSize.equalTo(label5.widthSize);
        [rootLayout1 addSubview:label5];
        
        //6. 子视图高度等于父视图高度，宽度等于高度
        UILabel *label6 = [UILabel new];
        label6.heightSize.equalTo(rootLayout1.heightSize).multiply(0.5);
        label6.widthSize.equalTo(label6.heightSize);
        [rootLayout1 addSubview:label6];

        
        [rootLayout1 layoutIfNeeded];
        
        XCTAssertTrue(label1.frame.size.width == label1.frame.size.height, @"label1.frame = %@",NSStringFromCGRect(label1.frame));
        XCTAssertTrue(label2.frame.size.width == label2.frame.size.height, @"label1.frame = %@",NSStringFromCGRect(label2.frame));
        XCTAssertTrue(label3.frame.size.width == label1.frame.size.width &&
                      label3.frame.size.height == label1.frame.size.height, @"label3.frame = %@",NSStringFromCGRect(label3.frame));
        XCTAssertTrue(label4.frame.size.width == (label2.frame.size.height + 20) &&
                      label4.frame.size.height == (label2.frame.size.width * 0.5 + 10), @"label4.frame = %@",NSStringFromCGRect(label4.frame));
        
        XCTAssertTrue(label5.frame.size.width == (rootLayout1.frame.size.width - 20) &&
                      label5.frame.size.height == label5.frame.size.width, @"label5.frame = %@",NSStringFromCGRect(label5.frame));
        
        XCTAssertTrue(label6.frame.size.width == label6.frame.size.height &&
                      label6.frame.size.height == rootLayout1.frame.size.height * 0.5, @"label6.frame = %@",NSStringFromCGRect(label6.frame));

    }
    
}

-(void)testSubviewSizeDependent2
{
    //测试隐藏、比重、尺寸依赖。
    
    MyLinearLayout *layout2 = [[MyLinearLayout alloc] initWithFrame:CGRectMake(0, 0, 375, 200) orientation:MyOrientation_Horz];
    layout2.wrapContentWidth = NO;
    
    
    UIButton *zoneBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    zoneBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    zoneBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    UILabel *nameLab = [[UILabel alloc] initWithFrame:CGRectZero];
    nameLab.numberOfLines = 1.0;
    nameLab.font = [UIFont systemFontOfSize:18];
    nameLab.textAlignment = NSTextAlignmentCenter;
    
    UIButton *placeholderBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    zoneBtn.myLeft = 20;
    zoneBtn.myCenterY = 0;
    zoneBtn.widthSize.equalTo(zoneBtn.widthSize).add(20);
    zoneBtn.heightSize.equalTo(zoneBtn.heightSize).add(3);
    
    nameLab.myCenterY = 0;
    nameLab.weight = 1.0;
    nameLab.heightSize.equalTo(nameLab.heightSize);
    
    placeholderBtn.myCenterY = 0;
    placeholderBtn.myRight = 20;
    placeholderBtn.widthSize.equalTo(zoneBtn.widthSize);
    placeholderBtn.heightSize.equalTo(zoneBtn.heightSize);
    
    [layout2 addSubview:zoneBtn];
    [layout2 addSubview:nameLab];
    [layout2 addSubview:placeholderBtn];
    
    zoneBtn.visibility = MyVisibility_Gone;
    placeholderBtn.visibility = MyVisibility_Gone;
    
    [layout2 layoutIfNeeded];
    
    XCTAssertTrue(nameLab.frame.size.width == layout2.frame.size.width &&
                  nameLab.center.y == layout2.frame.size.height * 0.5, @"nameLab.frame = %@",NSStringFromCGRect(nameLab.frame));
    
}

-(void)testWeight
{//测试均分
    
    MyLinearLayout* rootLayout1 = [[MyLinearLayout alloc] initWithFrame:CGRectMake(0, 0, 375, 667) orientation:MyOrientation_Horz];
   // rootLayout1.myMargin = 0;
    rootLayout1.backgroundColor = [UIColor redColor];
    rootLayout1.wrapContentWidth = NO;
    
    for (int i = 0; i < 4; i++)
    {
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.weight = 1;
        if (i % 2 == 0)
        {
            button.backgroundColor = [UIColor yellowColor];
        }
        else
        {
            button.backgroundColor = [UIColor greenColor];
        }
        [button setTitle:[NSString stringWithFormat:@"%i",i] forState:UIControlStateNormal];
        button.heightSize.equalTo(rootLayout1.heightSize);
        [rootLayout1 addSubview:button];
    }
    
    [rootLayout1 layoutIfNeeded];
    
    XCTAssertTrue(CGRectEqualToRect(rootLayout1.subviews[0].frame, CGRectMake(0,0,94,667)), @"the button0.frame = %@",NSStringFromCGRect(rootLayout1.subviews[0].frame));
    XCTAssertTrue(CGRectEqualToRect(rootLayout1.subviews[1].frame, CGRectMake(94,0,93.5,667)), @"the button0.frame = %@",NSStringFromCGRect(rootLayout1.subviews[1].frame));
    XCTAssertTrue(CGRectEqualToRect(rootLayout1.subviews[2].frame, CGRectMake(187.5,0,94,667)), @"the button0.frame = %@",NSStringFromCGRect(rootLayout1.subviews[2].frame));
    XCTAssertTrue(CGRectEqualToRect(rootLayout1.subviews[3].frame, CGRectMake(281.5,0,93.5,667)), @"the button0.frame = %@",NSStringFromCGRect(rootLayout1.subviews[3].frame));

    

}

-(void)testWrapContentHeight2
{
    MyLinearLayout *layout = [[MyLinearLayout alloc] initWithFrame:CGRectMake(0, 0, 375, 0) orientation:MyOrientation_Vert];
    layout.backgroundColor = [UIColor redColor];
    layout.gravity = MyGravity_Horz_Center;
    layout.padding = UIEdgeInsetsMake(15, 0, 0, 0);
    layout.subviewVSpace = 12;
    
    
    UILabel *timeLabel = UILabel.new;
    timeLabel.myHorzMargin = 0;
    timeLabel.wrapContentHeight = YES;
    timeLabel.textAlignment = NSTextAlignmentCenter;
    timeLabel.text = @"剩余时间为";
    [layout addSubview:timeLabel];
    
    // 汇率
    MyLinearLayout *convertLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    convertLayout.backgroundColor = [UIColor greenColor];
    convertLayout.wrapContentHeight = YES;
    convertLayout.gravity = MyGravity_Vert_Center;
    convertLayout.subviewHSpace = 7;
    [layout addSubview:convertLayout];
    
    NSArray *items = @[@"$454", @"^sdsf"];
    for (int i=0; i<items.count; i++) {
        UILabel *label = UILabel.new;
        label.wrapContentSize = YES;
        label.text = items[i];
        label.font = [UIFont systemFontOfSize:28];
        [convertLayout addSubview:label];
        
        if (i==0) {
            
            UILabel *btn = [UILabel new];
            btn.wrapContentSize = YES;
            btn.text = @"->";
            [convertLayout addSubview:btn];
        }
    }
    
    [layout layoutIfNeeded];
    
    XCTAssertTrue(CGRectEqualToRect(layout.frame, CGRectMake(0,0,375,81)), @"the layout.frame = %@",NSStringFromCGRect(layout.frame));
    XCTAssertTrue(CGRectEqualToRect(convertLayout.frame, CGRectMake(105,47.5,165,33.5)), @"the convertLayout.frame = %@",NSStringFromCGRect(convertLayout.frame));
    
    XCTAssertTrue(CGRectEqualToRect(timeLabel.frame, CGRectMake(0,15,375,20.5)), @"the timeLabel.frame = %@",NSStringFromCGRect(timeLabel.frame));
    XCTAssertTrue(CGRectEqualToRect(convertLayout.subviews[1].frame, CGRectMake(76,6.5,18.5,20.5)), @"the convertLayout.subviews[1].frame = %@",NSStringFromCGRect(convertLayout.subviews[1].frame));

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    
    
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//
//    }];
//
   
}

@end
