//
//  IMPUtils.h
//  ImproveUnitTests
//
//  Created by PanHongxi on 3/23/21.
//  Copyright © 2021 Mind Blown Apps, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IMPUtils : NSObject

+ (double)gaussianNumber;

+ (NSString *)getPlatformString;

+ (void)dumpScores:(NSArray<NSNumber *> *)scores andVariants:(NSArray *)variants;

@end

NS_ASSUME_NONNULL_END
