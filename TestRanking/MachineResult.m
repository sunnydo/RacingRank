//
//  MachineResult.m
//  TestRanking
//
//  Created by Sunny on 07/05/2019.
//  Copyright © 2019 Spriralworks. All rights reserved.
//

#import "MachineResult.h"

@implementation MachineResult

-(instancetype) initWithMachineId:(NSInteger) machineId startBalance:(double) startBalance endBalance:(double) endBalance {
    self.startBalance = startBalance;
    self.endBalance = endBalance;
    self.machineId = machineId;
    self.gapStartEnd = endBalance - startBalance;
    return self;
}

@end
