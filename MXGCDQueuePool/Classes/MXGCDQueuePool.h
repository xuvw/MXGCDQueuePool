//
//  MXGCDQueuePool.h
//  MXGCDQueuePool
//
//  Created by heke on 2018/10/8.
//  Copyright © 2019 MX. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MXGCDQueuePool : NSObject

+ (void)dispatchAsync:(dispatch_block_t)job;
+ (dispatch_queue_t)activeQueue;
@end

NS_ASSUME_NONNULL_END
