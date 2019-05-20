//
//  MachineResultWithRank.h
//  TestRanking
//
//  Created by Sunny on 14/05/2019.
//  Copyright © 2019 Spriralworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MachineResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface MachineResultWithRank : NSObject

@property (nonatomic,strong) MachineResult *machineResult;
@property (nonatomic,assign) NSInteger ranking;


@end

NS_ASSUME_NONNULL_END
