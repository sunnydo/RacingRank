//
//  ViewController.m
//  TestRanking
//
//  Created by Sunny on 07/05/2019.
//  Copyright © 2019 Spriralworks. All rights reserved.
//

#import "ViewController.h"
#import "MachineResult.h"

@interface ViewController ()

@property (nonatomic,strong) NSArray<MachineResult*>* results;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _results = @[
                [[MachineResult alloc] initWithMachineId:1 startBalance:1 endBalance:10],
                [[MachineResult alloc] initWithMachineId:2 startBalance:1 endBalance:2],
                [[MachineResult alloc] initWithMachineId:3 startBalance:1 endBalance:2],
                [[MachineResult alloc] initWithMachineId:4 startBalance:1 endBalance:2],
                [[MachineResult alloc] initWithMachineId:5 startBalance:1 endBalance:2],
                [[MachineResult alloc] initWithMachineId:6 startBalance:1 endBalance:1],
                [[MachineResult alloc] initWithMachineId:7 startBalance:1 endBalance:7],
                [[MachineResult alloc] initWithMachineId:8 startBalance:1 endBalance:8],
                [[MachineResult alloc] initWithMachineId:9 startBalance:1 endBalance:9],
                [[MachineResult alloc] initWithMachineId:10 startBalance:1 endBalance:10]
                ];
    NSArray<MachineResult*>* rankedResults = [self rankMachineResultWithRank:_results];
    //print out
    for (MachineResult * r in rankedResults) {
        NSLog(@"Machine(%li,%.0f,%.0f) has ranked %li", r.machineId, r.startBalance, r.endBalance, r.ranking);
    }
}

- (NSArray<MachineResult*>*) rankMachineResultWithRank: (NSArray<MachineResult*>*) results {
    NSMutableArray<MachineResult*> *copyResults = [results mutableCopy];

    for( int i = 0; i < copyResults.count; i++) {
        double gap = copyResults[i].gapStartEnd;
        MachineResult *temp = copyResults[i];
        int j = i -  1;
        for(; (j >= 0 && copyResults[j].gapStartEnd <= gap); j--) {
            copyResults[j + 1] = copyResults[j];
            //ranking re-allocate
            if (gap > copyResults[j + 1].gapStartEnd ) {//different rank
                copyResults[j + 1].ranking++;
            }
        }
        copyResults[j + 1] = temp;
        if(j < 0) {//first item
            temp.ranking = 1;
        } else {
            temp.ranking = (j + 1) + 1;
        }
    }
    return copyResults;
}

@end
