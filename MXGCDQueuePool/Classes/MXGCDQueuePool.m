//
//  MXGCDQueuePool.m
//  MXGCDQueuePool
//
//  Created by heke on 2018/10/8.
//  Copyright © 2019 MX. All rights reserved.
//

#import "MXGCDQueuePool.h"

@interface MXGCDQueuePool ()
{
    NSMutableArray *queuePool;
    NSInteger queueCount;
    NSInteger queueIndex;
}

@end

@implementation MXGCDQueuePool

+ (instancetype)sharedInstance {
    static MXGCDQueuePool *queuePool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queuePool = [[MXGCDQueuePool alloc] init];
    });
    return queuePool;
}

+ (void)dispatchAsync:(dispatch_block_t)job {
    dispatch_async([[MXGCDQueuePool sharedInstance] _activeQueue], job);
}

+ (dispatch_queue_t)activeQueue {
    return [[MXGCDQueuePool sharedInstance] _activeQueue];
}

- (dispatch_queue_t)_activeQueue {
    return queuePool[(++queueIndex)%queueCount];
}

#pragma mark - private
- (instancetype)init {
    
    if (self = [super init]) {
        [self setup];
    }
    
    return self;
}

- (void)setup {
    
    NSInteger cpuCoreCount = NSProcessInfo.processInfo.activeProcessorCount;
    if (cpuCoreCount < 1) {
        cpuCoreCount = 1;
    }
    
    if (cpuCoreCount < 2) {
        queueCount = 2;
    }else {
        queueCount = cpuCoreCount;
    }
    
    queueIndex = 0;
    queuePool = @[].mutableCopy;
    
    dispatch_queue_attr_t queue_attr = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_SERIAL, QOS_CLASS_DEFAULT, -1);
    
    for (NSInteger i = 0; i < queueCount; ++i) {
        
        NSString *queueName = [NSString stringWithFormat:@"com.mx.queue.%li",i];
        [queuePool addObject:dispatch_queue_create([queueName cStringUsingEncoding:NSUTF8StringEncoding], queue_attr)];
    }
}

@end
