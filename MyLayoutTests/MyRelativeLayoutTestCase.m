//
//  MyRelativeLayoutTestCase.m
//  MyLayout
//
//  Created by apple on 16/12/30.
//  Copyright © 2016年 YoungSoft. All rights reserved.
//

#import "MyLayoutTestCaseBase.h"
#import "RLTest1ViewController.h"


@interface MyRelativeLayoutTestCase : MyLayoutTestCaseBase

@property(nonatomic,strong) RLTest1ViewController *vc;

@end

@implementation MyRelativeLayoutTestCase

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.vc = [RLTest1ViewController new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.vc = nil;
    [super tearDown];
}

-(void)testRLTest1VC
{
    
    UIView *v = self.vc.view;
    [self startClock];
    [v layoutIfNeeded];
    [self endClock:@"RLTest1"];
    
    
}

- (void)testHidden {
    
    //测试子视图隐藏的布局变更
    
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    MyRelativeLayout *rootLayout = [MyRelativeLayout new];
    rootLayout.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    rootLayout.wrapContentHeight = YES;
    
    UILabel *shopNameLabel = [UILabel new];
    shopNameLabel.topPos.equalTo(rootLayout.topPos).offset(10);
    shopNameLabel.centerXPos.equalTo(@0);
    shopNameLabel.mySize = CGSizeMake(80, 20);
    [rootLayout addSubview:shopNameLabel];
    
    
    UILabel *userTimeLabel = [UILabel new];
    userTimeLabel.topPos.equalTo(shopNameLabel.bottomPos).offset(5);
    userTimeLabel.centerXPos.equalTo(@0);
    userTimeLabel.mySize = CGSizeMake(100, 30);
    [rootLayout addSubview:userTimeLabel];
    
    
    UILabel *moneyLable = [UILabel new];
      moneyLable.topPos.equalTo(userTimeLabel.bottomPos).offset(15);
    moneyLable.leftPos.equalTo(rootLayout.leftPos).offset(15);
    moneyLable.mySize = CGSizeMake(80, 80);
    [rootLayout addSubview:moneyLable];
    
    
    UILabel *numberLabel = [UILabel new];
    numberLabel.bottomPos.equalTo(rootLayout.bottomPos).offset(15);
    numberLabel.rightPos.equalTo(rootLayout.rightPos).offset(15);
    numberLabel.mySize = CGSizeMake(60, 30);
    [rootLayout addSubview:numberLabel];
    
    
    UILabel *descLabel = [UILabel new];
    descLabel.bottomPos.equalTo(rootLayout.bottomPos).offset(15);
    descLabel.rightPos.equalTo(numberLabel.leftPos).offset(15);
    descLabel.mySize = CGSizeMake(100, 20);
    [rootLayout addSubview:descLabel];
    
    
   CGSize size1 = [rootLayout sizeThatFits:CGSizeMake(320, 0)];
    XCTAssertTrue(CGSizeEqualToSize(size1, CGSizeMake(320, 180)), @"size1 is:%@", NSStringFromCGSize(size1));
    XCTAssertTrue(CGRectEqualToRect(descLabel.estimatedRect, CGRectMake(120,135,100, 20)), @"descLabel rect is:%@", NSStringFromCGRect(descLabel.estimatedRect));
    
    
    numberLabel.hidden = YES;
    
    CGSize size2 = [rootLayout sizeThatFits:CGSizeMake(320, 0)];
    
    XCTAssertTrue(CGSizeEqualToSize(size2, CGSizeMake(320, 180)), @"size2 is:%@", NSStringFromCGSize(size2));
    XCTAssertTrue(CGRectEqualToRect(descLabel.estimatedRect, CGRectMake(195,135,100, 20)), @"descLabel rect is:%@", NSStringFromCGRect(descLabel.estimatedRect));
    
}

-(void)testWrapContentHeight1
{
    MyRelativeLayout *rootLayout = [MyRelativeLayout new];
    rootLayout.wrapContentHeight = YES;
    rootLayout.bottomPadding = 20;
    rootLayout.topPadding = 10;
    rootLayout.leadingPadding = 10;
    rootLayout.trailingPadding = 10;
    
    
    CGSize size0 = [rootLayout sizeThatFits:CGSizeMake(320, 0)];
    XCTAssertTrue(CGSizeEqualToSize(size0, CGSizeMake(320, 30)), @"size0 is:%@", NSStringFromCGSize(size0));


    UILabel *titleLabel = [UILabel new];
    titleLabel.text=@"你发我抢 > 未付款";
    titleLabel.mySize = CGSizeMake(90, 20);
    titleLabel.leftPos.equalTo(rootLayout.leftPos).offset(10);
    [rootLayout addSubview:titleLabel];
    
    
    UILabel *rightLabel = [UILabel new];
    rightLabel.text=@"配送中 > ";
    rightLabel.mySize = CGSizeMake(45, 20);
    rightLabel.rightPos.equalTo(rootLayout.rightPos).offset(1);
    [rootLayout addSubview:rightLabel];
    
    titleLabel.rightPos.equalTo(rightLabel.leftPos).offset(10);
    
    
    
    UILabel *allMoneyLabel = [UILabel new];
    allMoneyLabel.text=@"¥ 1000.00";
    allMoneyLabel.mySize = CGSizeMake(45, 20);
    allMoneyLabel.topPos.equalTo(rightLabel.bottomPos).offset(5);
    allMoneyLabel.rightPos.equalTo(rootLayout.rightPos).offset(5);
    [rootLayout addSubview:allMoneyLabel];
    
    
    
    UILabel *orderNumberLabel = [UILabel new];
    orderNumberLabel.text=@"订单号: 12121212122121";
    orderNumberLabel.mySize = CGSizeMake(100, 20);
    orderNumberLabel.topPos.equalTo(titleLabel.bottomPos).offset(5);
    orderNumberLabel.leftPos.equalTo(titleLabel.leftPos);
    orderNumberLabel.rightPos.equalTo(allMoneyLabel.leftPos).offset(0);
     [rootLayout addSubview:orderNumberLabel];
    
    
    UILabel *orderTimeLabel= [UILabel new];
    orderTimeLabel.text=@"下单时间: 2016-10-10";
    orderTimeLabel.mySize = CGSizeMake(90, 20);
    orderTimeLabel.topPos.equalTo(orderNumberLabel.bottomPos).offset(5);
    orderTimeLabel.leftPos.equalTo(titleLabel.leftPos);
    orderTimeLabel.rightPos.equalTo(allMoneyLabel.rightPos).offset(0);
    [rootLayout addSubview:orderTimeLabel];
    
    UILabel *orderLabel = [UILabel new];
    orderLabel.text=@"订单描述:";
    orderLabel.mySize = CGSizeMake(40, 20);
    orderLabel.topPos.equalTo(orderTimeLabel.bottomPos).offset(5);
    orderLabel.leftPos.equalTo(titleLabel.leftPos);
    [rootLayout addSubview:orderLabel];
    
    //125
    
    MyLinearLayout * lineLayout=[[MyLinearLayout alloc]initWithOrientation:MyOrientation_Vert];
    lineLayout.wrapContentHeight=YES;
    lineLayout.wrapContentWidth=NO;
    lineLayout.topPos.equalTo(orderLabel.bottomPos).offset(5);
    lineLayout.myLeft=lineLayout.myRight=10;
    [rootLayout addSubview:lineLayout];
    
  //130
    
    UILabel *timeLabel = [UILabel new];
    timeLabel.text=@"期望时间 10分钟:";
    timeLabel.tag = 1234;
    timeLabel.mySize = CGSizeMake(80, 20);
    timeLabel.topPos.equalTo(lineLayout.bottomPos).offset(10);
    timeLabel.leftPos.equalTo(titleLabel.leftPos);
    [rootLayout addSubview:timeLabel];
    
  
    CGSize size1 = [rootLayout sizeThatFits:CGSizeMake(320, 0)];
    XCTAssertTrue(CGSizeEqualToSize(size1, CGSizeMake(320, 160)), @"size1 is:%@", NSStringFromCGSize(size1));
    
    UILabel *noteLabel = [UILabel new];
    noteLabel.mySize = CGSizeMake(100, 30);
    [lineLayout addSubview:noteLabel];
    
    CGSize size2 = [rootLayout sizeThatFits:CGSizeMake(320, 0)];
    XCTAssertTrue(CGSizeEqualToSize(size2, CGSizeMake(320, 190)), @"size2 is:%@", NSStringFromCGSize(size2));
    
    
    [noteLabel removeFromSuperview];
    
    for (int i = 0; i < 3; i++)
    {
       MyLinearLayout  *horzLayout=[[MyLinearLayout alloc]initWithOrientation:MyOrientation_Horz];
        horzLayout.wrapContentHeight=YES;
        horzLayout.wrapContentWidth=NO;
        horzLayout.myLeft=horzLayout.myRight=0;
        
        UILabel *v1 = [UILabel new];
        v1.text = @"v1";
        v1.mySize = CGSizeMake(200, 20);
        [horzLayout addSubview:v1];
        
        UILabel *v2 = [UILabel new];
        v2.text = @"v2";
        v2.myLeft = 0.5;
        v2.myRight = 0.5;
        v2.mySize = CGSizeMake(40, 30);
        [horzLayout addSubview:v2];
        
        UILabel *v3 = [UILabel new];
        v3.text = @"v3";
        v3.weight=1;
        v3.mySize = CGSizeMake(60, 25);
        [horzLayout addSubview:v3];
        [lineLayout addSubview:horzLayout];
    }
    
    
    timeLabel.hidden = YES;
    
    CGSize size3 = [rootLayout sizeThatFits:CGSizeMake(320, 0)];
    XCTAssertTrue(CGSizeEqualToSize(size3, CGSizeMake(320, 220)), @"size3 is:%@", NSStringFromCGSize(size3));
    
    
    UIButton *orderbutton=[UIButton new];
    orderbutton.widthSize.equalTo(rootLayout.widthSize).add(-20);
    [orderbutton setTitle:@"确认收货" forState:UIControlStateNormal];
    orderbutton.topPos.equalTo(timeLabel.bottomPos).offset(10);
    orderbutton.leftPos.equalTo(titleLabel.leftPos);
    orderbutton.mySize = CGSizeMake(50, 30);
    
    [rootLayout addSubview:orderbutton];
    
    UIButton *canclebutton=[UIButton new];
    canclebutton.widthSize.equalTo(rootLayout.widthSize).add(-20);
    [canclebutton setTitle:@"取消" forState:UIControlStateNormal];
    canclebutton.topPos.equalTo(orderbutton.bottomPos).offset(10);
    canclebutton.leftPos.equalTo(titleLabel.leftPos);
    canclebutton.mySize = CGSizeMake(50, 20);
    [rootLayout  addSubview:canclebutton];
    
    
    CGSize size4 = [rootLayout sizeThatFits:CGSizeMake(320, 0)];
    XCTAssertTrue(CGSizeEqualToSize(size4, CGSizeMake(320, 290)), @"size4 is:%@", NSStringFromCGSize(size4));
    
    
    timeLabel.hidden = NO;
    CGSize size5 = [rootLayout sizeThatFits:CGSizeMake(320, 0)];
    XCTAssertTrue(CGSizeEqualToSize(size5, CGSizeMake(320, 320)), @"size5 is:%@", NSStringFromCGSize(size5));
    
    orderbutton.hidden = YES;
    CGSize size6 = [rootLayout sizeThatFits:CGSizeMake(320, 0)];
    XCTAssertTrue(CGSizeEqualToSize(size6, CGSizeMake(320, 280)), @"size6 is:%@", NSStringFromCGSize(size6));
    
    
    orderbutton.hidden = NO;
    for (UIView *sbv in lineLayout.subviews)
    {
        [sbv removeFromSuperview];
    }
    CGSize size7 = [rootLayout sizeThatFits:CGSizeMake(320, 0)];
    XCTAssertTrue(CGSizeEqualToSize(size7, CGSizeMake(320, 230)), @"size7 is:%@", NSStringFromCGSize(size7));
    
    
    timeLabel.hidden = YES;
    orderbutton.hidden = YES;
    CGSize size8 = [rootLayout sizeThatFits:CGSizeMake(320, 0)];
    XCTAssertTrue(CGSizeEqualToSize(size8, CGSizeMake(320, 160)), @"size8 is:%@", NSStringFromCGSize(size8));

    

}

-(void)testWrapContentHeight2
{
    MyRelativeLayout *rootRelativeView = [MyRelativeLayout new];
    rootRelativeView.wrapContentHeight = YES;
    
    UIView *verticalLine = [UIView new];
    verticalLine.leftPos.equalTo(rootRelativeView.leftPos).offset(16);
    verticalLine.widthSize.equalTo(@1);
    verticalLine.heightSize.equalTo(rootRelativeView.heightSize);
    verticalLine.bottomPos.equalTo(rootRelativeView.bottomPos);
    [rootRelativeView addSubview:verticalLine];
    
    UIView *roundImageView = [[UIView alloc] init];
    roundImageView.topPos.equalTo(rootRelativeView.topPos).offset(8);
    roundImageView.centerXPos.equalTo(verticalLine.centerXPos);
    roundImageView.mySize = CGSizeMake(4, 4) ;
    [rootRelativeView addSubview:roundImageView];
    
    UILabel *dateLabel = [UILabel new];
    dateLabel.topPos.equalTo(roundImageView.topPos);
    dateLabel.leftPos.equalTo(rootRelativeView.leftPos).offset(38);
    dateLabel.rightPos.equalTo(rootRelativeView.rightPos).offset(16);
    dateLabel.myHeight = 20;
    [rootRelativeView addSubview:dateLabel];
    
    UILabel *newsTitleLabel = [UILabel new];
    newsTitleLabel.wrapContentHeight = YES;
    newsTitleLabel.topPos.equalTo(dateLabel.bottomPos).offset(5);
    newsTitleLabel.leftPos.equalTo(dateLabel.leftPos);
    newsTitleLabel.rightPos.equalTo(dateLabel.rightPos);
    newsTitleLabel.bottomPos.equalTo(rootRelativeView.bottomPos).offset(8);
    [rootRelativeView addSubview:newsTitleLabel];
    
    CGSize size1 = [rootRelativeView sizeThatFits:CGSizeMake(320, 0)];
    XCTAssertTrue(CGSizeEqualToSize(size1, CGSizeMake(320, 41)), @"size1 is:%@", NSStringFromCGSize(size1));
    
    
    newsTitleLabel.text = @"aaaaaaaaaaaa";
    
    
    CGSize size2 = [rootRelativeView sizeThatFits:CGSizeMake(320, 0)];
    XCTAssertTrue(CGSizeEqualToSize(size2, CGSizeMake(320, 41 + [newsTitleLabel sizeThatFits:CGSizeMake(266, 0)].height)), @"size2 is:%@", NSStringFromCGSize(size2));
    
    
    newsTitleLabel.text = @"ajkhkahflkahfklahdflkajhdfalkjsdhflkajhdsflajsdhflaksdfhasdlhfjkashdfaasdfasdfasfd";
    
    
    CGSize size3 = [rootRelativeView sizeThatFits:CGSizeMake(320, 0)];
    XCTAssertTrue(CGSizeEqualToSize(size3, CGSizeMake(320, 41+[newsTitleLabel sizeThatFits:CGSizeMake(266, 0)].height)), @"size3 is:%@", NSStringFromCGSize(size3));

}

-(void)testWrapContentHeight3
{
    MyRelativeLayout * midView = [MyRelativeLayout new];
    midView.wrapContentSize = YES;
    
    UILabel * cartypeLabel = [UILabel new];
    cartypeLabel.mySize = CGSizeMake(90, 30);
    cartypeLabel.centerXPos.equalTo(@0);
    cartypeLabel.topPos.equalTo(@0);
    [midView addSubview:cartypeLabel];  //90 30;
    
    UILabel * line = [UILabel new];
    line.heightSize.equalTo(@2);
    line.topPos.equalTo(cartypeLabel.bottomPos).offset(5);
    line.widthSize.equalTo(cartypeLabel.widthSize).add(20); //110, 37
    [midView addSubview:line];
    
    UIView * leftView = [[UIView alloc]init];
    leftView.heightSize.equalTo(@8);
    leftView.widthSize.equalTo(@8);
    leftView.leftPos.equalTo(@0);
    leftView.centerYPos.equalTo(line.centerYPos);  //118,37
    [midView addSubview:leftView];
    
    line.leftPos.equalTo(leftView.rightPos);
    
    
    UIView * rightView = [[UIView alloc]init];
    rightView.heightSize.equalTo(@8);
    rightView.widthSize.equalTo(@8);
    rightView.leftPos.equalTo(line.rightPos);
    rightView.centerYPos.equalTo(line.centerYPos);
    [midView addSubview:rightView];    //126, 37
    
    UILabel * numLabel = [UILabel new];
    numLabel.mySize = CGSizeMake(40, 20);
    numLabel.topPos.equalTo(line.bottomPos).offset(5); //126,62
    numLabel.centerXPos.equalTo(@0);
    [midView addSubview:numLabel];
    
   CGSize sz =  [midView sizeThatFits:CGSizeZero];
    
    NSLog(@"%@",NSStringFromCGSize(sz));
    
}

-(void)testWrapContentWidth1
{
    MyRelativeLayout *rootLayout = [MyRelativeLayout new];
    rootLayout.wrapContentHeight = YES;
    rootLayout.wrapContentWidth = YES;
    rootLayout.bottomPadding = 20;
    rootLayout.topPadding = 10;
    rootLayout.leadingPadding = 10;
    rootLayout.trailingPadding = 10;
    
    
    XCTAssertTrue(CGSizeEqualToSize([rootLayout sizeThatFits:CGSizeMake(0, 0)], CGSizeMake(20, 30)), @"size is:%@", NSStringFromCGSize([rootLayout sizeThatFits:CGSizeMake(0, 0)]));
    
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text=@"你发我抢 > 未付款";
    titleLabel.mySize = CGSizeMake(90, 20);
    titleLabel.leftPos.equalTo(rootLayout.leftPos).offset(10);
    [rootLayout addSubview:titleLabel];
    
    
    UILabel *rightLabel = [UILabel new];
    rightLabel.text=@"配送中 > ";
    rightLabel.mySize = CGSizeMake(45, 20);
    rightLabel.rightPos.equalTo(rootLayout.rightPos).offset(1);
    [rootLayout addSubview:rightLabel];
    
    titleLabel.rightPos.equalTo(rightLabel.leftPos).offset(10);
    
    
    XCTAssertTrue(CGSizeEqualToSize([rootLayout sizeThatFits:CGSizeMake(0, 0)], CGSizeMake(86, 50)), @"size is:%@", NSStringFromCGSize([rootLayout sizeThatFits:CGSizeMake(0, 0)]));
    
    
    UILabel *allMoneyLabel = [UILabel new];
    allMoneyLabel.text=@"¥ 1000.00";
    allMoneyLabel.mySize = CGSizeMake(45, 20);
    allMoneyLabel.topPos.equalTo(rightLabel.bottomPos).offset(5);
    allMoneyLabel.rightPos.equalTo(rootLayout.rightPos).offset(5);
    [rootLayout addSubview:allMoneyLabel];
    
    
    
    UILabel *orderNumberLabel = [UILabel new];
    orderNumberLabel.text=@"订单号: 12121212122121";
    orderNumberLabel.mySize = CGSizeMake(100, 20);
    orderNumberLabel.topPos.equalTo(titleLabel.bottomPos).offset(5);
    orderNumberLabel.leftPos.equalTo(titleLabel.leftPos);
    orderNumberLabel.rightPos.equalTo(allMoneyLabel.leftPos).offset(0);
    [rootLayout addSubview:orderNumberLabel];
    
    
    UILabel *orderTimeLabel= [UILabel new];
    orderTimeLabel.text=@"下单时间: 2016-10-10";
    orderTimeLabel.mySize = CGSizeMake(90, 20);
    orderTimeLabel.topPos.equalTo(orderNumberLabel.bottomPos).offset(5);
    orderTimeLabel.leftPos.equalTo(titleLabel.leftPos);
    orderTimeLabel.rightPos.equalTo(allMoneyLabel.rightPos).offset(0);
    [rootLayout addSubview:orderTimeLabel];
    
    UILabel *orderLabel = [UILabel new];
    orderLabel.text=@"订单描述:";
    orderLabel.mySize = CGSizeMake(40, 20);
    orderLabel.topPos.equalTo(orderTimeLabel.bottomPos).offset(5);
    orderLabel.leftPos.equalTo(titleLabel.leftPos);
    [rootLayout addSubview:orderLabel];
    
    
    XCTAssertTrue(CGSizeEqualToSize([rootLayout sizeThatFits:CGSizeMake(0, 0)], CGSizeMake(86, 125)), @"size is:%@", NSStringFromCGSize([rootLayout sizeThatFits:CGSizeMake(0, 0)]));
    
}

-(void)testWrapContentWidth2
{
    //A的宽度等于B的宽度。
    
    //A的左边等于B的左边
    //A的左边等于B的中间
    //A的左边等于B的右边
    
    //A的中间等于B的左边
    //A的中间等于B的中间
    //A的中间等于B的右边
    
    //A的右边等于B的左边
    //A的右边等于B的中间
    //A的右边等于B的右边。
    
    //A的两边等于B的两边。
    
    //这里里面B可以是父视图也可以是兄弟视图。
    
    //A的位置有9种。A的宽度有2种(固定宽度，以及依赖于另外一个视图的宽度)，这里就是18个视图。外加A的2的两边等于B的两边就是19个视图。
    
    
    MyRelativeLayout *rootLayout = [MyRelativeLayout new];
    rootLayout.wrapContentWidth = YES;
    

    //随机生成N个数字保存到数组里面。
    CGFloat max = 0;
    NSMutableArray *numbers = [NSMutableArray arrayWithCapacity:40];
    for (int i = 0; i < 2; i++)
    {
        CGFloat num = (CGFloat)arc4random_uniform(100);
        if (num > max)
            max = num;
        
        [numbers addObject:@(num)];
    }
    
    //依赖父视图的约束。
    
    NSMutableArray *widths = [NSMutableArray new];
    [widths addObject:rootLayout.widthSize];
    [widths addObjectsFromArray:numbers];
    
    NSMutableArray *poss = [NSMutableArray new];
    [poss addObjectsFromArray:@[rootLayout.leftPos, rootLayout.centerXPos, rootLayout.rightPos]];
    [poss addObjectsFromArray:numbers];
    
    NSMutableArray *poss2 = [NSMutableArray new];
    NSMutableArray *widths2 = [NSMutableArray new];
    
    for (id pos in poss)
    {
        for (id width in widths)
        {
          /*  UIView *A1 = [UIView new];
            A1.leftPos.equalTo(pos);
            A1.widthSize.equalTo(width);
            [rootLayout addSubview:A1];
            
            [poss2 addObject:A1.leftPos];
            [poss2 addObject:A1.centerXPos];
            [poss2 addObject:A1.rightPos];
            [widths2 addObject:A1.widthSize];
            */
            
            UIView *A2 = [UIView new];
            A2.centerXPos.equalTo(pos);
            A2.widthSize.equalTo(width);
            [rootLayout addSubview:A2];

            [poss2 addObject:A2.leftPos];
            [poss2 addObject:A2.centerXPos];
            [poss2 addObject:A2.rightPos];
            [widths2 addObject:A2.widthSize];
            
            UIView *A3 = [UIView new];
            A3.rightPos.equalTo(pos);
            A3.widthSize.equalTo(width);
            [rootLayout addSubview:A3];
            
            [poss2 addObject:A3.leftPos];
            [poss2 addObject:A3.centerXPos];
            [poss2 addObject:A3.rightPos];
            [widths2 addObject:A3.widthSize];
        }
    }
    
    XCTAssertTrue(CGSizeEqualToSize([rootLayout sizeThatFits:CGSizeMake(0, 0)], CGSizeMake(max*2, 0)), @"size is:%@", NSStringFromCGSize([rootLayout sizeThatFits:CGSizeMake(0, 0)]));
    

    
    for (id pos1 in poss)
    {
        for (id pos2 in poss)
        {
            UIView *A4 = [UIView new];
            A4.leftPos.equalTo(pos1);
            A4.rightPos.equalTo(pos2);
            [rootLayout addSubview:A4];
            
          //  [poss2 addObject:A4.leftPos];
          //  [poss2 addObject:A4.centerXPos];
          //  [poss2 addObject:A4.rightPos];
          //  [widths2 addObject:A4.widthSize];
        }
    }
    
    XCTAssertTrue(CGSizeEqualToSize([rootLayout sizeThatFits:CGSizeMake(0, 0)], CGSizeMake(max*2, 0)), @"size is:%@", NSStringFromCGSize([rootLayout sizeThatFits:CGSizeMake(0, 0)]));

    
    //一次依赖其他子视图。
    
    [poss2 addObjectsFromArray:numbers];
    [widths2 addObjectsFromArray:numbers];
    
    
    NSMutableArray *poss3 = [NSMutableArray new];
    NSMutableArray *widths3 = [NSMutableArray new];
    
    for (id pos in poss2)
    {
        for (id width in widths2)
        {
            /*UIView *A1 = [UIView new];
            A1.leftPos.equalTo(pos);
            A1.widthSize.equalTo(width);
            [rootLayout addSubview:A1];
            
            [poss3 addObject:A1.leftPos];
            [poss3 addObject:A1.centerXPos];
            [poss3 addObject:A1.rightPos];
            [widths3 addObject:A1.widthSize];
            */
            
            UIView *A2 = [UIView new];
            A2.centerXPos.equalTo(pos);
            A2.widthSize.equalTo(width);
            [rootLayout addSubview:A2];
            
            [poss3 addObject:A2.leftPos];
          //  [poss3 addObject:A2.centerXPos];
          //  [poss3 addObject:A2.rightPos];
          //  [widths3 addObject:A2.widthSize];
            
            UIView *A3 = [UIView new];
            A3.rightPos.equalTo(pos);
            A3.widthSize.equalTo(width);
            [rootLayout addSubview:A3];
            
           // [poss3 addObject:A3.leftPos];
           // [poss3 addObject:A3.centerXPos];
            [poss3 addObject:A3.rightPos];
           // [widths3 addObject:A3.widthSize];
      }
    }
    
    XCTAssertTrue(CGSizeEqualToSize([rootLayout sizeThatFits:CGSizeMake(0, 0)], CGSizeMake(max*3, 0)), @"size is:%@", NSStringFromCGSize([rootLayout sizeThatFits:CGSizeMake(0, 0)]));

    

    for (id pos1 in poss2)
    {
        for (id pos2 in poss2)
        {
            UIView *A4 = [UIView new];
            A4.leftPos.equalTo(pos1);
            A4.rightPos.equalTo(pos2);
            [rootLayout addSubview:A4];
        }
    }
   
    
    XCTAssertTrue(CGSizeEqualToSize([rootLayout sizeThatFits:CGSizeMake(0, 0)], CGSizeMake(max*3, 0)), @"size is:%@", NSStringFromCGSize([rootLayout sizeThatFits:CGSizeMake(0, 0)]));
    
    
    
    //2次依赖其他子视图
    
    [poss3 addObjectsFromArray:numbers];
    [widths3 addObjectsFromArray:numbers];
    
    for (id pos in poss3)
    {
        for (id width in widths3)
        {
          /*  UIView *A1 = [UIView new];
            A1.leftPos.equalTo(pos);
            A1.widthSize.equalTo(width);
            [rootLayout addSubview:A1];
            */
            
            UIView *A2 = [UIView new];
            A2.centerXPos.equalTo(pos);
            A2.widthSize.equalTo(width);
            [rootLayout addSubview:A2];
            
            UIView *A3 = [UIView new];
            A3.rightPos.equalTo(pos);
            A3.widthSize.equalTo(width);
            [rootLayout addSubview:A3];
        }
    }


  //  XCTAssertTrue(CGSizeEqualToSize([rootLayout sizeThatFits:CGSizeMake(0, 0)], CGSizeMake(max*3, 0)), @"size is:%@", NSStringFromCGSize([rootLayout sizeThatFits:CGSizeMake(0, 0)]));

    
}

-(void)testDemo1
{
    MyRelativeLayout *_layoutRoot = nil;
    
    MyRelativeLayout* relative = [MyRelativeLayout new];
  //  relative.widthSize.equalTo(self.contentView.widthSize);
    relative.wrapContentHeight = YES;
    _layoutRoot = relative;
    
    
    // 头像区域
    MyLinearLayout* linear = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    linear.wrapContentSize = YES;
    linear.padding = UIEdgeInsetsMake(12, 15, 12, 15);
    linear.myLeading = 0.0f;
    [_layoutRoot addSubview:linear];
    MyLinearLayout *_layoutPortrait = linear;
    
    // 头像
    CGFloat pWidth = 40.0f;
    UIImageView* imgv = [UIImageView new];
    [imgv setClipsToBounds:YES];
    [imgv setContentMode:UIViewContentModeScaleAspectFit];
    imgv.myWidth = pWidth;
    imgv.myHeight = pWidth;
    imgv.layer.masksToBounds = YES;
    imgv.layer.cornerRadius = pWidth/2.0f;
    [_layoutPortrait addSubview:imgv];
    
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    // 最右侧的附加区域
    linear = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    linear.heightSize.equalTo(_layoutRoot.heightSize);
    linear.widthSize.equalTo(@(screenWidth)).multiply(0.24).min(90.0f);
    linear.myTrailing = 0.0f;
    linear.trailingPadding = 15.0f;
    linear.subviewVSpace = 8.0f;
    linear.gravity = MyGravity_Horz_Right|MyGravity_Vert_Center;
    [_layoutRoot addSubview:linear];
    MyLinearLayout * _layoutAccessory = linear;
    
    // 时间
    UILabel* lbl = [UILabel new];
    lbl.text = @"2019-11-11";
    [lbl setTextAlignment:NSTextAlignmentRight];
    lbl.font = [UIFont systemFontOfSize:12];
    [lbl setMinimumScaleFactor:10.0f];
    [lbl setTextColor:[UIColor greenColor]];
    lbl.wrapContentSize = YES;
    lbl.widthSize.equalTo(lbl.widthSize).uBound(_layoutAccessory.widthSize,-2,1);
    [lbl setNumberOfLines:1];
    [_layoutAccessory addSubview:lbl];
    
    // 附加区域底部
    linear = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    linear.gravity = MyGravity_Vert_Center|MyGravity_Horz_Right;
    linear.wrapContentHeight = NO;
    linear.widthSize.equalTo(_layoutAccessory.widthSize);
    linear.myHeight = 20.0f;
    linear.subviewHSpace = 4.0f;
    [_layoutAccessory addSubview:linear];
    MyLinearLayout *_layoutAccessoryBottom = linear;
    
    // 勿扰图标
    UIImage* image = [UIImage imageNamed:@"edit"];
    imgv = [[UIImageView alloc] initWithImage:image];
    [imgv sizeToFit];
    [imgv setHidden:YES];
    [_layoutAccessoryBottom addSubview:imgv];
    
    // 勿扰状态下，有新消息时的小红点提示
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 6.0f, 6.0f)];
    [view setBackgroundColor:[UIColor greenColor]];
    [view setHidden:YES];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 3.0f;
    [_layoutAccessoryBottom addSubview:view];
    
    // 非勿扰状态下未读消息数
    lbl = [UILabel new];
    lbl.text = @"1";
    [lbl setTextAlignment:NSTextAlignmentCenter];
    [lbl setFont:[UIFont systemFontOfSize:10]];
    [lbl setTextColor:[UIColor whiteColor]];
    [lbl setBackgroundColor:[UIColor redColor]];
    [_layoutAccessoryBottom addSubview:lbl];
    [lbl setNumberOfLines:1];
    lbl.heightSize.equalTo(lbl.heightSize).add(4.0f).lBound(@16,0,1);
    lbl.widthSize.equalTo(lbl.widthSize).add(8.0f).lBound(@16,0,1).uBound(_layoutAccessory.widthSize,0,1);
    lbl.layer.masksToBounds = YES;
    lbl.layer.cornerRadius = 8.0f;
    // [lbl setHidden:YES];
    
    // 中间区域
    linear = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    linear.wrapContentWidth = NO;
    linear.wrapContentHeight = YES;
    linear.myVertMargin = 0.0f;
    linear.heightSize.min(67.0f);
    linear.leadingPos.equalTo(_layoutPortrait.trailingPos);
    linear.trailingPos.equalTo(_layoutAccessory.leadingPos);
    linear.gravity = MyGravity_Vert_Center;
    linear.subviewVSpace = 8.0f;
    [_layoutRoot addSubview:linear];
    MyLinearLayout * _layoutContent = linear;
    
    // 标题区域
    relative = [MyRelativeLayout new];
    relative.widthSize.equalTo(_layoutContent.widthSize);
    relative.wrapContentHeight = YES;
    [_layoutContent addSubview:relative];
    MyRelativeLayout * _layoutTitle = relative;
    
    // 会话名称
    lbl = [UILabel new];
    lbl.text = @"asdfklajdf爱的色放就爱";
    lbl.myLeading = 0.0f;
    lbl.wrapContentSize = YES;
    [lbl setFont:[UIFont systemFontOfSize:17]];
    [lbl setTextColor:[UIColor greenColor]];
    lbl.numberOfLines = 1;
    [_layoutTitle addSubview:lbl];
    UILabel *_lblTitle = lbl;
    
    // 名称右侧的标记（例如，选题、部门等，作用是标记会话的类型）
    lbl = [UILabel new];
    lbl.text = @"选题";
    [lbl setTextAlignment:NSTextAlignmentCenter];
    [lbl setFont:[UIFont systemFontOfSize:10]];
    lbl.widthSize.equalTo(lbl.widthSize);
    lbl.heightSize.equalTo(lbl.heightSize).add(4.0f);
    lbl.myTrailing = 4.0f;
    lbl.centerYPos.equalTo(_lblTitle.centerYPos);
    lbl.leadingPos.equalTo(_lblTitle.trailingPos).offset(4.0f);
    [lbl setNumberOfLines:1];
    [_layoutTitle addSubview:lbl];
    UILabel *_lblMark = lbl;
    
    _lblTitle.trailingPos.uBound(_layoutTitle.rightPos,4.0+_lblMark.frame.size.width);
    
    // 摘要
    linear = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    linear.widthSize.equalTo(_layoutContent.widthSize);
    linear.wrapContentHeight = YES;
    linear.subviewHSpace = 2.0f;
    [_layoutContent addSubview:linear];
    MyLinearLayout *_layoutSummary = linear;
    
    // 发送状态（例如：发送中，发送失败）
    imgv = [UIImageView new];
    [imgv setContentMode:UIViewContentModeScaleAspectFit];
    imgv.wrapContentSize = YES;
    [imgv setHidden:YES];
    [_layoutSummary addSubview:imgv];
    
    // 勿扰状态下，在摘要显示的消息数
    lbl = [UILabel new];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    [lbl setFont:[UIFont systemFontOfSize:12]];
    lbl.wrapContentSize = YES;
    [lbl setNumberOfLines:1];
    [lbl setHidden:YES];
    [_layoutSummary addSubview:lbl];
    
    // 状态（包括：未读，已读，草稿，有人@）
    lbl = [UILabel new];
    [lbl setFont:[UIFont systemFontOfSize:12]];
    lbl.wrapContentSize = YES;
    [lbl setNumberOfLines:1];
    [lbl setHidden:YES];
    [_layoutSummary addSubview:lbl];
    
    // 摘要内容
    lbl = [UILabel new];
    [lbl setFont:[UIFont systemFontOfSize:12]];
    lbl.weight = 1.0f;
    lbl.wrapContentSize = YES;
    [lbl setNumberOfLines:1];
    [_layoutSummary addSubview:lbl];

}

-(void)testhideandubound
{
    //测试视图隐藏以及
    {
        UIButton *zoneBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        zoneBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        zoneBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        UILabel *nameLab = [[UILabel alloc] initWithFrame:CGRectZero];
        nameLab.numberOfLines = 1.0;
        nameLab.font = [UIFont systemFontOfSize:18];
        nameLab.textAlignment = NSTextAlignmentCenter;
        
        UIButton *placeholderBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        MyRelativeLayout *layout2 = [[MyRelativeLayout alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
        
        zoneBtn.myLeft = 20;
        zoneBtn.myCenterY = 0;
        zoneBtn.widthSize.equalTo(zoneBtn.widthSize).add(20);
        zoneBtn.heightSize.equalTo(zoneBtn.heightSize).add(3);
        
        nameLab.myCenterY = 0;
        nameLab.leftPos.equalTo(zoneBtn.rightPos).offset(15);
        nameLab.rightPos.equalTo(placeholderBtn.leftPos).offset(15);
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
        
        XCTAssertTrue(nameLab.frame.size.width == layout2.frame.size.width - 40 &&
                      nameLab.center.y == layout2.frame.size.height * 0.5, @"nameLab.frame = %@",NSStringFromCGRect(nameLab.frame));
    }
    
    {
        UIButton *zoneBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        zoneBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        zoneBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        UILabel *nameLab = [[UILabel alloc] initWithFrame:CGRectZero];
        nameLab.numberOfLines = 1.0;
        nameLab.font = [UIFont systemFontOfSize:18];
        nameLab.textAlignment = NSTextAlignmentCenter;
        
        UIButton *placeholderBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        MyRelativeLayout *layout2 = [[MyRelativeLayout alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
        
        zoneBtn.myLeft = 20;
        zoneBtn.myCenterY = 0;
        zoneBtn.widthSize.equalTo(zoneBtn.widthSize).add(20);
        zoneBtn.heightSize.equalTo(zoneBtn.heightSize).add(3);
        
        nameLab.myCenterY = 0;
        nameLab.wrapContentSize = YES;
        nameLab.leftPos.lBound(zoneBtn.rightPos, 15);
        nameLab.rightPos.uBound(placeholderBtn.leftPos, 15);
        nameLab.heightSize.equalTo(nameLab.heightSize);
        nameLab.text = @"这是阿斯蒂芬阿道夫阿斯蒂芬安防安防阿斯蒂芬安防大师傅阿斯蒂芬阿斯蒂芬安防";
        
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
        
        XCTAssertTrue(nameLab.frame.size.width == layout2.frame.size.width - 40 &&
                      nameLab.center.y == layout2.frame.size.height * 0.5, @"nameLab.frame = %@",NSStringFromCGRect(nameLab.frame));
        
    }
    
}

-(void)testBaseline
{
    MyRelativeLayout *relaLayout = [MyRelativeLayout new];
 //   self.view = relaLayout;
    
    UIButton *lb1 = [UIButton new];
    //lb1.text = @"ajbdg";
    [lb1 setTitle:@"ajbdg" forState:UIControlStateNormal];
    lb1.titleLabel.font = [UIFont systemFontOfSize:70];
    // lb1.adjustsFontSizeToFitWidth = YES;
    lb1.mySize = CGSizeMake(180, 100);
    // lb1.font = [UIFont systemFontOfSize:70];
    // [lb1 sizeToFit];
    
    UIFont *font1 = lb1.font;
    
    
    
    
    lb1.backgroundColor = [UIColor greenColor];
    lb1.baselinePos.equalTo(@200);
    lb1.myLeft = 30;
    [relaLayout addSubview:lb1];
    
    UILabel *lb2 = [UILabel new];
    lb2.text = @"jjgiii";
    lb2.mySize = CGSizeMake(200, 100);
    lb2.leftPos.equalTo(lb1.rightPos);
    lb2.baselinePos.equalTo(lb1.baselinePos);
    lb2.backgroundColor =[UIColor redColor];
    [relaLayout addSubview:lb2];

}

-(void)testMaxHeightAndWidth
{
    MyRelativeLayout *rellayout = [MyRelativeLayout new];
    
    UIView *vv = [UIView new];
    [rellayout addSubview:vv];
    
    UILabel *label = [UILabel new];
    [rellayout addSubview:label];
    
    label.myLeft = 10;
    label.wrapContentWidth = YES;
    label.widthSize.max(100);
    label.wrapContentHeight = YES;
    
    
    vv.topPos.equalTo(label.topPos);
    vv.bottomPos.equalTo(label.bottomPos);
    vv.leftPos.equalTo(label.leftPos);
    vv.rightPos.equalTo(label.rightPos);
    
    
    label.text = @"测试12345660392034323";
    vv.backgroundColor = [UIColor redColor];
    
    [rellayout sizeThatFits:CGSizeZero];
    
    XCTAssertTrue(CGSizeEqualToSize(label.estimatedRect.size, CGSizeMake(90, 61)));
    XCTAssertTrue(CGSizeEqualToSize(vv.estimatedRect.size, CGSizeMake(90, 61)));
    XCTAssertTrue(CGSizeEqualToSize(vv.estimatedRect.size, label.estimatedRect.size));

    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
