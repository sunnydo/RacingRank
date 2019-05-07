//
//  MachineResult.h
//  TestRanking
//
//  Created by Sunny on 07/05/2019.
//  Copyright © 2019 Spriralworks. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MachineResult : NSObject

@property (nonatomic,assign) double startBalance;
@property (nonatomic,assign) double endBalance;
@property (nonatomic,assign) double gapStartEnd;
@property (nonatomic,assign) NSInteger machineId;
@property (nonatomic,assign) NSInteger ranking;

-(instancetype) initWithMachineId:(NSInteger) machineId startBalance:(double) startBalance endBalance:(double) endBalance;

@end

NS_ASSUME_NONNULL_END
