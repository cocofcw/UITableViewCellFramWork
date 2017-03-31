//
//  BaseCell.m

//

#import "BaseCell.h"

@implementation BaseCell



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // Initialization code
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/*------------------------------------------------------------
 *类方法,子类应该重写该方法,用以返回cell单元对应于数据模型的单元高度
 *------------------------------------------------------------*/
+ (CGFloat)cellHeightForModel:(BaseModel *)dataForCell
{
    return 0.0f;
}

@end
