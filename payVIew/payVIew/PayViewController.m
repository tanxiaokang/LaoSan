//
//  PayViewController.m
//  payVIew
//
//  Created by 檀小康 on 16/5/17.
//  Copyright © 2016年 Demo. All rights reserved.
//

#define WIDTH  [[UIScreen mainScreen] bounds].size.width
#define HEIGHT [[UIScreen mainScreen] bounds].size.height
#define LINEGROUNDCOLOR [UIColor colorWithRed:219/255.0f green:219/255.0f blue:219/255.0f alpha:1] //线的颜色


#import "PayViewController.h"

#pragma mark - custemBtn
@interface custemBtn : UIButton

+ (custemBtn *)initWithFrame:(CGRect)frame ImageName:(NSString *)imageName Title:(NSString *)title;
@end

@implementation custemBtn

+ (custemBtn *)initWithFrame:(CGRect)frame ImageName:(NSString *)imageName Title:(NSString *)title{
   
    custemBtn *btn = [[custemBtn alloc] initWithFrame:frame];
    
    //topLine
    CGFloat line_x;
    if (frame.origin.x == WIDTH/2) line_x = 0;
    else line_x = 10;
    UIImageView *topLine = [[UIImageView alloc] initWithFrame:CGRectMake(line_x, 1, frame.size.width-10, 1)];
    topLine.backgroundColor = LINEGROUNDCOLOR;
    [btn addSubview:topLine];
    
    //lowLine
    if (line_x != 0) {
        UIImageView *lowLine = [[UIImageView alloc] initWithFrame:CGRectMake(line_x, frame.size.height+1, (frame.size.width-10)*2, 1)];
        lowLine.backgroundColor = LINEGROUNDCOLOR;
        [btn addSubview:lowLine];
    }
    
    //leftLine
    UIImageView *leftLine = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width, 1, 1, frame.size.height)];
    leftLine.backgroundColor = LINEGROUNDCOLOR;
    [btn addSubview:leftLine];
    
    //leftImg
    UIImageView *leftImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 40, frame.size.height)];
    leftImg.image = [UIImage imageNamed:imageName];
    leftImg.userInteractionEnabled = YES;
    leftImg.contentMode = UIViewContentModeScaleAspectFit;
    [btn addSubview:leftImg];
    
    //rightTitle
    UILabel *rightLb = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(leftImg.frame)+10, 0, frame.size.width-CGRectGetWidth(leftImg.frame), frame.size.height)];
    rightLb.text = title;
    [btn addSubview:rightLb];
    return btn;
}


@end

#pragma mark - PayViewController
@interface PayViewController ()

@property (nonatomic, strong) NSArray *dataArr;/*<#objec#>*/
@property (nonatomic, strong) UIScrollView *scrollView;/*<#objec#>*/

@end

@implementation PayViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createData];
    
    [self createUI];
}
- (void)createData{
    
    //1.
    NSArray *arr  = @[@"联通短信",@"电信短信",@"移动短信",@"手机短信",@"财付通",@"支付宝",@"微信"];
    NSArray *arr2 = @[@"网上银行",@"支付宝",@"神州行卡",@"游戏点卡",@"联通充值卡",@"财付通",@"电信充值卡",@"固定电话",@"短信快速",@"电话V币",@"固定手机语音"];
    
    _dataArr = @[arr,arr2];
    
}

- (void)createUI{
    
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 44, WIDTH, HEIGHT)];
    [self.view addSubview:_scrollView];
    
    //APP直冲
    UIView *view1 = [self createViewModelTitle:@"APP直接充值" Info:_dataArr[0] origin_y:44 Tag:100];
    [_scrollView addSubview:view1];
    //网页充值
    
    UIView *view2 = [self createViewModelTitle:@"网页充值" Info:_dataArr[1] origin_y:CGRectGetMaxY(view1.frame)+50 Tag:200];
    [_scrollView addSubview:view2];

    _scrollView.contentSize = CGSizeMake(WIDTH, CGRectGetMaxY(view2.frame)+44);
}

#pragma mark - CLicked
- (void)btnClicked:(UIButton *)btn{
    
    NSInteger count = btn.tag/100 - 1;
    NSInteger count2 = (btn.tag >= 200) ? (btn.tag-200) :(btn.tag -100);
    
    NSLog(@"%@",_dataArr[count][count2]);
}
#pragma mark - 辅助UI
- (UIView *)createViewModelTitle:(NSString *)str Info:(NSArray *)arr origin_y:(CGFloat)y Tag:(NSInteger)tag{
    
    UIView *view = [[UIView alloc] init];
    //leftImg
    
    UIImageView *headerLeftImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 5, 30)];
    headerLeftImg.backgroundColor = [UIColor greenColor];
    [view addSubview:headerLeftImg];
    
    //title
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(headerLeftImg.frame)+5, 10, WIDTH-30, 30)];
    title.text = str;
    [view addSubview:title];
    
    //btn
    CGFloat top_Y = CGRectGetMaxY(title.frame)+20;
    
    for ( int i=0; i<arr.count; i++) {
        CGFloat y = i/2;CGFloat x = i%2;
        
        custemBtn *btn = [custemBtn initWithFrame:CGRectMake(x*(WIDTH/2), top_Y+y*50, WIDTH/2, 50) ImageName:arr[i] Title:arr[i]];
        btn.tag = tag+i;
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
        
    }
    CGFloat count = (arr.count%2==1) ? (count = arr.count/2 + 1) : (count = arr.count/2);
    
    view.frame = CGRectMake(0, y, WIDTH, top_Y+(50*count));
    
    return view;
}


#pragma mark - other
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
