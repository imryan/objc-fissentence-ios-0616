//
//  FISSentence.h
//  objc-fissentence
//
//  Created by Ryan Cohen on 6/10/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISSentence : NSObject

@property (readonly) NSString *sentence;

// Would remove these due to the init but tests require them to be public
@property (nonatomic, copy) NSString *punctuation;
@property (nonatomic, strong) NSMutableArray *words;

- (instancetype)initWithWords:(NSArray *)words withPunctuation:(NSString *)punctuation;

- (void)addWord:(NSString *)word;
- (void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation;

- (void)removeWordAtIndex:(NSUInteger)index;
- (void)insertWord:(NSString *)word atIndex:(NSUInteger)index;

- (void)replacePunctuationWithPunctuation:(NSString *)punctuation;
- (void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word;

@end
