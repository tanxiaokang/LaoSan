//
//  calenderCollectionViewCell.m
//  calenderDemo
//
//  Created by 三少 on 16/6/23.
//  Copyright © 2016年 Demo. All rights reserved.
//
#define defaultImageName @"defaultCalender"
#define ImageName @"Calender"

#import "calenderCollectionViewCell.h"



@interface calenderCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation calenderCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"calenderCollectionViewCell" owner:self options:nil];
        
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1) return nil;
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]])             return nil;
        // 加载nib
        self = [arrayOfViews firstObject];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];

}

-(void)setModel:(calenderModel *)model{
    _model = model;
    _imageView.image = [UIImage imageNamed:_model.show ? ImageName : defaultImageName];
    _dataLabel.text = model.dataString;
    
}

@end
