//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Ryan Cohen on 6/10/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence ()

@property (readwrite) NSString *sentence;

- (void)assembleSentence;

- (BOOL)validWord:(NSString *)word;
- (BOOL)validPunctuation:(NSString *)punctuation;
- (BOOL)validIndex:(NSUInteger)index;

@end

@implementation FISSentence

#pragma mark - Init

- (instancetype)initWithWords:(NSArray *)words withPunctuation:(NSString *)punctuation {
    if (self = [super init]) {
        self.words = [NSMutableArray arrayWithArray:words];
        self.punctuation = punctuation;
    }
    
    return self;
}

#pragma mark - FISSentence Helpers

- (void)assembleSentence {
    NSString *wordsString = nil;
    
    wordsString = [self.words componentsJoinedByString:@" "];
    wordsString = [wordsString stringByAppendingString:self.punctuation];
    
    self.sentence = wordsString;
}

- (BOOL)validWord:(NSString *)word {
    BOOL isValid = YES;
    
    if ((word == nil) || [word isEqualToString:@""] || [word isEqualToString:@" "]) {
        isValid = NO;
    }
    
    return isValid;
}

- (BOOL)validPunctuation:(NSString *)punctuation {
    BOOL isValid = NO;
    NSArray *punctuations = @[ @".", @"?", @"!", @",", @";", @":", @"—" ];
    
    for (NSString *character in punctuations) {
        if ([punctuation isEqualToString:character]) {
            isValid = YES;
            break;
        }
    }
    
    return isValid;
}

- (BOOL)validIndex:(NSUInteger)index {
    BOOL isValid = YES;
    
    if (index > self.words.count - 1) {
        isValid = NO;
    }
    
    return isValid;
}

#pragma mark - FISSentence Public

- (void)addWord:(NSString *)word {
    if ([self validWord:word]) {
        [self.words addObject:word];
    }
    
    [self assembleSentence];
}

- (void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation {
    if (words == nil || words.count < 1) {
        return;
    } else if (![self validPunctuation:punctuation]) {
        return;
    }
    
    NSMutableArray *validWords = [NSMutableArray array];
    
    for (NSString *word in [words copy]) {
        if ([self validWord:word]) {
            [validWords addObject:word];
        }
    }
    
    self.punctuation = punctuation;
    [self.words addObjectsFromArray:validWords];
    
    [self assembleSentence];
}

- (void)removeWordAtIndex:(NSUInteger)index {
    if ([self validIndex:index]) {
        [self.words removeObjectAtIndex:index];
    }
    
    [self assembleSentence];
}

- (void)insertWord:(NSString *)word atIndex:(NSUInteger)index {
    if ([self validWord:word] && [self validIndex:index]) {
        [self.words insertObject:word atIndex:index];
    }
    
    [self assembleSentence];
}

- (void)replacePunctuationWithPunctuation:(NSString *)punctuation {
    if ([self validPunctuation:punctuation]) {
        self.punctuation = punctuation;
    }
    
    [self assembleSentence];
}

- (void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word {
    if ([self validWord:word] && [self validIndex:index]) {
        [self.words replaceObjectAtIndex:index withObject:word];
    }
    
    [self assembleSentence];
}

@end
