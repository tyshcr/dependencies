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
    NSMutableArray *foundDependencies = [[NSMutableArray alloc] init];
    
    for (id dependency in (NSArray*)[_masterDictionary objectForKey:value]) {
        [foundDependencies addObject:dependency];
        [foundDependencies addObjectsFromArray:[self dependenciesFor:dependency]];
    }
    
    NSArray *cleaned = [[NSOrderedSet orderedSetWithArray:foundDependencies] array];
    
    return [cleaned sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}

@end
