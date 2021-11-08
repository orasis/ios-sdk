//
//  Copyright © 2021 Mind Blown Apps, LLC. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(DecisionTracker)
@interface IMPDecisionTracker : NSObject

@property(atomic, strong) NSURL *trackURL;

/**
 Hyperparameter that affects training speed and model performance. Values from 10-100 are probably reasonable.  0 disables runners up tracking
 */
@property(atomic) NSUInteger maxRunnersUp;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithTrackURL:(NSURL *)trackURL NS_SWIFT_NAME(init(_:));

- (void)addReward:(double)reward forModel:(NSString *)modelName;

- (void)addReward:(double)reward forModel:(NSString *)modelName decision:(NSString *)decisionId;

@end

NS_ASSUME_NONNULL_END
