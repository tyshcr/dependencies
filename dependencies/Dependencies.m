//
//  Dependencies.m
//  Dependencies
//
//  Created by Christopher Tysh on 7/26/16.
//  Copyright © 2016 Christopher Tysh. All rights reserved.
//

#import "Dependencies.h"

@implementation Dependencies

- (void)addDirect:(NSString*)master withArray:(NSArray*)array {
    [_masterDictionary setObject:array forKey:master];
}

- (void)dependenciesFor:(NSString*)value {
    
}

@end
