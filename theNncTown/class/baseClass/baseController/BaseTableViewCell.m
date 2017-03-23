

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

+ (instancetype)setCellWithTableView:(UITableView *)tableview{
    
    NSString *cellIdentifier = @"cell";
    
    BaseTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[BaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self configeSubViews];
    }
    
    return self;
}
- (void)configeSubViews{}
- (void)layoutSubviews{
    [super layoutSubviews];
}
- (void)setBaseModel:(BaseModel *)baseModel{}
- (void)retureClickCellIndex:(ClickCellIndex)block{
    self.clickCellIndex = block;
}
@end
