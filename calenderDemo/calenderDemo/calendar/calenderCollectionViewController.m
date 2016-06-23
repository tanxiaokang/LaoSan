//
//  calenderCollectionViewController.m
//  calenderDemo
//
//  Created by 三少 on 16/6/23.
//  Copyright © 2016年 Demo. All rights reserved.
//

#import "calenderCollectionViewController.h"

@interface calenderCollectionViewController ()
@property (nonatomic, strong) NSMutableArray *timeMArray;/*当前月份天数*/

@end

@implementation calenderCollectionViewController

static NSString * const reuseIdentifier = @"calenderCell";

- (instancetype)init
{
    // 创建一个流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    // 设置cell的尺寸
    layout.itemSize = CGSizeMake(60, 60);
    
    // 设置滚动的方向
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    // 行间距
    layout.minimumLineSpacing = 10;
    
    // 设置cell之间的间距
    layout.minimumInteritemSpacing = 10;
    //
    //    // 组间距
    //    layout.sectionInset = UIEdgeInsetsMake(100, 20, 0, 30);
    
    return [super initWithCollectionViewLayout:layout];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self config];
}
- (void)config{
    
    //BackgroundColor
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    
    // Uncomment the following line to preserve selection between presentations
//    [self setClearsSelectionOnViewWillAppear:NO];
    
    // Register cell classes
    [self.collectionView registerClass:[calenderCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    // Do any additional setup after loading the view.
    [self configData];
}

- (void)configData{
    _timeMArray = [NSMutableArray new];
    
    for (int i=1; i<32; i++) {
        calenderModel *model = [calenderModel new];
        model.show = NO;
    
        model.dataString = [NSString stringWithFormat:@"%d",i];
        [_timeMArray addObject:model];
    }
    [self.collectionView reloadData];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _timeMArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    calenderCollectionViewCell *cell = (calenderCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    calenderModel *model = _timeMArray[indexPath.row];
    cell.model = model;
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)show:(NSString *)title msg:(NSString *)msg{
    [[[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    calenderCollectionViewCell *cell = (calenderCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    

    
    switch (cell.model.show) {
        case 0:
        {
            //只能本天签到
            if ([cell.model.dataString isEqualToString:@"23"]) {
                calenderModel *model = _timeMArray[indexPath.row];
                model.show = YES;
                _timeMArray[indexPath.row] = model;
                [self.collectionView reloadData];
            }else{
                [self show:@"温馨提示" msg:@"只能签到本天"];
            }
            
        }
            break;
        case 1:
            [self show:@"温馨提示" msg:@"已签到"];
            break;
            
        default:
            break;
    }
//    [self dismissViewControllerAnimated:YES completion:nil];
}

// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}

-(void)dealloc{
    
}
@end
