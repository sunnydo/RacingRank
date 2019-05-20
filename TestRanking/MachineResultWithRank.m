//
//  MachineResultWithRank.m
//  TestRanking
//
//  Created by Sunny on 14/05/2019.
//  Copyright © 2019 Spriralworks. All rights reserved.
//

#import "MachineResultWithRank.h"
#import "MachineResult.h"

@implementation MachineResultWithRank

-(instancetype) initWithMachine:(MachineResult*) machine ranking:(NSInteger) ranking {
    self.machineResult = machine;
    self.ranking = ranking;
    return self;
}

@end
