//
//  TransactionCell.h
//  SplitCheck
//
//  Created by Huang on 7/2/18.
//  Copyright © 2018 Frozt. All rights reserved.
//

#ifndef TransactionCell_h
#define TransactionCell_h

#import <Foundation/Foundation.h>

#endif /* TransactionCell_h */

@interface Transaction : NSObject

@property (nonatomic, assign) float beforeTax;
@property (nonatomic, assign) float afterTax;
@property (nonatomic, strong) NSString *notes;

@end

@interface TransactionCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UITextField *beforeTaxField;
@property (nonatomic, weak) IBOutlet UITextField *afterTaxField;
@property (nonatomic, weak) IBOutlet UITextField *descriptionField;
@property (nonatomic, weak) IBOutlet UIButton *toVenmoBtn;

@end
