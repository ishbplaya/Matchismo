//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Ishang Bhan on 12/27/2013.
//  Copyright (c) 2013 Ishang Bhan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject
//designated initializer
-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

@property (readonly,nonatomic) NSInteger score;
@end
