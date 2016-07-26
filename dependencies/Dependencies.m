//
//  Dependencies.m
//  Dependencies
//
//  Created by Christopher Tysh on 7/26/16.
//  Copyright © 2016 Christopher Tysh. All rights reserved.
//

#import "Dependencies.h"

@implementation Dependencies

- (id)init {
    _masterDictionary = [[NSMutableDictionary alloc] init];
    return self;
}

- (void)addDirect:(NSString*)master withArray:(NSArray*)array {
    [_masterDictionary setObject:array forKey:master];
}

- (NSArray*)dependenciesFor:(NSString*)value {
    return [_masterDictionary objectForKey:value];
}

@end
