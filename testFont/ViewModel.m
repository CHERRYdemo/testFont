//
//  ViewModel.m
//  testFont
//
//  Created by Meng on 8/17/23.
//

#import "ViewModel.h"
#import <UIKit/UIKit.h>

@implementation ViewModel

- (instancetype)init {
    if (self = [super init]) {
        [self configDataSource];
    }
    return self;
}

- (void)configDataSource {
    NSMutableArray *tmpArr = [NSMutableArray array];
    self.sectionArray = [UIFont familyNames];
    NSLog(@"-------- test -----------:%@", self.sectionArray);
    for (NSString *familyName in self.sectionArray) {
        NSLog(@"--------:%@", [UIFont fontNamesForFamilyName:familyName]);
        [tmpArr addObject:[UIFont fontNamesForFamilyName:familyName]];
    }
    self.dataArray = [tmpArr copy];
}

@end
