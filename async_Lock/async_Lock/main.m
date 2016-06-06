//
//  main.m
//  async_Lock
//
//  Created by Cyzing on 16/6/6.
//  Copyright © 2016年 Cyzing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int data = 3;
        __block int mainData = 0;
        __block dispatch_semaphore_t sem = dispatch_semaphore_create(0);
        
        dispatch_queue_t queue = dispatch_queue_create("StudyBlocks", NULL);
        
        dispatch_async(queue, ^(void) {
            int sum = 0;
            for(int i = 0; i < 5; i++)
            {
                sum += data;
                
                NSLog(@" >> Sum: %d", sum);
            }
            
            dispatch_semaphore_signal(sem);
        });
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
        for(int j=0;j<5;j++)
        {
            mainData++;
            NSLog(@">> Main Data: %d",mainData);
        }
    }
    return 0;
}
