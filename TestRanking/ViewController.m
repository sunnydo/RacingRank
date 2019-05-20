//
//  ViewController.m
//  TestRanking
//
//  Created by Sunny on 07/05/2019.
//  Copyright © 2019 Spriralworks. All rights reserved.
//

#import "ViewController.h"
#import "MachineResult.h"
#import "MachineResultWithRank.h"

@interface ViewController ()

@property (nonatomic,strong) NSArray<MachineResult*>* results;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self rankMachineResultWithRank:@[
                                      [[MachineResult alloc] initWithMachineId:1 startBalance:1 endBalance:30],
                                      [[MachineResult alloc] initWithMachineId:2 startBalance:1 endBalance:30],
                                      [[MachineResult alloc] initWithMachineId:3 startBalance:1 endBalance:30],
                                      [[MachineResult alloc] initWithMachineId:4 startBalance:1 endBalance:13],
                                      [[MachineResult alloc] initWithMachineId:5 startBalance:1 endBalance:13],
                                      [[MachineResult alloc] initWithMachineId:6 startBalance:1 endBalance:13],
                                      [[MachineResult alloc] initWithMachineId:7 startBalance:1 endBalance:13],
                                      [[MachineResult alloc] initWithMachineId:8 startBalance:1 endBalance:13],
                                      [[MachineResult alloc] initWithMachineId:9 startBalance:1 endBalance:3],
                                      [[MachineResult alloc] initWithMachineId:10 startBalance:1 endBalance:3]
                                      ]];
}

- (void) rankMachineResultWithRank: (NSArray<MachineResult*>*) results {
    //sort
    results = [results sortedArrayUsingComparator:^NSComparisonResult(MachineResult* a, MachineResult* b) {
        return a.endBalance < b.endBalance;
    }];
    //index
    results[0].ranking = 1;
    
    [results enumerateObjectsUsingBlock:^(MachineResult* object, NSUInteger idx, BOOL *stop) {
        // do something with object
        if(idx > 0) {
            if (results[idx].endBalance == results[idx-1].endBalance) {
                results[idx].ranking = results[idx-1].ranking;
            } else {
                results[idx].ranking = idx + 1;
            }
        }
    }];
    NSLog(@"RANKED MACHINES: %@", results);
}

@end
