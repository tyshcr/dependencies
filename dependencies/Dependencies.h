//
//  Dependencies.h
//  Dependencies
//
//  Created by Christopher Tysh on 7/26/16.
//  Copyright © 2016 Christopher Tysh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dependencies : NSObject

@property (nonatomic,strong) NSMutableDictionary *masterDictionary;

- (void)addDirect:(NSString*)parent withDependencies:(NSArray*)dependencies;
- (NSArray*)dependenciesFor:(NSString*)parent;

@end
