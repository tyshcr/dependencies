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

- (void)addDirect:(NSString*)parent withDependencies:(NSArray*)dependencies {
    [_masterDictionary setObject:dependencies forKey:parent];
}

- (NSArray*)dependenciesFor:(NSString*)parent {
    NSMutableArray *visited = [[NSMutableArray alloc] initWithArray:@[parent]];
    return [self dependenciesFor:parent visited:visited];
}

- (NSArray*)dependenciesFor:(NSString*)parent visited:(NSMutableArray*)visted {
    NSMutableArray *foundDependencies = [[NSMutableArray alloc] init];
    
    for (id dependency in (NSArray*)[_masterDictionary objectForKey:parent]) {
        if (![visted containsObject:dependency]) {
            [visted addObject:dependency];
            [foundDependencies addObject:dependency];
            [foundDependencies addObjectsFromArray:[self dependenciesFor:dependency visited:visted]];
        }
    }
    
    NSArray *cleaned = [[NSOrderedSet orderedSetWithArray:foundDependencies] array];
    return [cleaned sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}

@end
