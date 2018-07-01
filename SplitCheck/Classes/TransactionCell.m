//
//  TransactionCell.m
//  SplitCheck
//
//  Created by Huang on 7/2/18.
//  Copyright © 2018 Frozt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TransactionCell.h"

//@interface TransactionCell : UITableViewCell
//
//@end

@implementation Transaction

@end

@implementation TransactionCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
