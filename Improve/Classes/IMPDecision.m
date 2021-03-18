//
//  IMPDecision.m
//
//  Created by Justin Chapweske on 3/17/21.
//  Copyright © 2021 Mind Blown Apps, LLC. All rights reserved.
//

#import "IMPDecision.h"

// "Package private" methods
@interface IMPDecisionTracker ()

- (BOOL)shouldTrackRunnersUp:(NSUInteger) variantsCount;

- (void)track:(id)variant variants:(NSArray *)variants given:(NSDictionary *)givens modelName:(NSString *)modelName variantsRankedAndTrackRunnersUp:(BOOL) variantsRankedAndTrackRunnersUp;

@end

// private vars
@interface IMPDecision ()

@property(nonatomic, readonly, nullable) id best;
@property(nonatomic, readonly) BOOL chosen;

@end

@implementation IMPDecision

- (instancetype)initWithModel:(IMPDecisionModel *)model
{
    self = [super init];
    if (!self) return nil;

    _model = model;

    return self;
}

- (instancetype)chooseFrom:(NSArray *)variants
{
    _variants = variants;
    
    return self;
}

- (instancetype)given:(NSDictionary <NSString *, id>*)givens
{
    _givens = givens;
    
    return self;
}

- (nullable id)get
{
    
    if (_chosen) {
        // if get() was previously called
        return _best;
    }

    NSArray *scores = [_model score:_variants given:_givens];

    if (_variants && _variants.count) {
        if (_model.tracker) {
            if ([_model.tracker shouldTrackRunnersUp:_variants.count]) {
                // the more variants there are, the less frequently this is called
                NSArray *rankedVariants = [IMPDecisionModel rank:_variants withScores:scores];
                _best = rankedVariants.firstObject;
                [_model.tracker track:_best variants:rankedVariants given:_givens modelName:_model.modelName variantsRankedAndTrackRunnersUp:TRUE];
            } else {
                // faster and more common path, avoids array sort
                _best = [IMPDecisionModel topScoringVariant:_variants withScores:scores];
                [_model.tracker track:_best variants:_variants given:_givens modelName:_model.modelName variantsRankedAndTrackRunnersUp:FALSE];
            }
        } else {
            _best = [IMPDecisionModel topScoringVariant:_variants withScores:scores];
        }
    }

    _chosen = TRUE;

    return _best;
}



@end
