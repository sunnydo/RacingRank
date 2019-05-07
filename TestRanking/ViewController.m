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
                [[MachineResult alloc] initWithMachineId:1 startBalance:1 endBalance:30],
                [[MachineResult alloc] initWithMachineId:2 startBalance:1 endBalance:30],
                [[MachineResult alloc] initWithMachineId:3 startBalance:1 endBalance:30],
                [[MachineResult alloc] initWithMachineId:4 startBalance:1 endBalance:13],
                [[MachineResult alloc] initWithMachineId:5 startBalance:1 endBalance:3],
                [[MachineResult alloc] initWithMachineId:6 startBalance:1 endBalance:13],
                [[MachineResult alloc] initWithMachineId:7 startBalance:1 endBalance:13],
                [[MachineResult alloc] initWithMachineId:8 startBalance:1 endBalance:13],
                [[MachineResult alloc] initWithMachineId:9 startBalance:1 endBalance:13],
                [[MachineResult alloc] initWithMachineId:10 startBalance:1 endBalance:3]
                ];
    NSArray<MachineResult*>* rankedResults = [self rankMachineResultWithRank:_results];
}

- (NSArray<MachineResult*>*) rankMachineResultWithRank:
(NSArray<MachineResult*>*) results {
    
    NSMutableArray<MachineResult*> *copyResults = [results mutableCopy];
    
    //sort
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
        if((i > 1) && (temp.gapStartEnd > copyResults[i-1].gapStartEnd)) {
            temp.ranking = copyResults[i-1].ranking +1;
        } else if((i > 0) && (temp.gapStartEnd == copyResults[i-1].gapStartEnd)) {
            temp.ranking  = copyResults[i-1].ranking;
        } else {
            temp.ranking = i+1;
        }
        
        copyResults[j + 1] = temp;//i
    }
    return copyResults;
}

@end
