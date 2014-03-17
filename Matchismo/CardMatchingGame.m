//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Ishang Bhan on 12/27/2013.
//  Copyright (c) 2013 Ishang Bhan. All rights reserved.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame()
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; //of Cards
@end

@implementation CardMatchingGame

-(NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init]; //super's designated initializer
    if(self)
    {
        for (int i = 0; i < count; i++)
        {
            Card *card = [deck drawRandomCard];
            if(card)
            {
                [self.cards addObject:card];
            }
            else
            {
                self = nil;
                break;
            }
        }
    }
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE_CARD = 1;

-(void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if(!card.isMatched) //card is matched
    {
        if(card.isChosen)
        {
            card.chosen = NO;
        }
        else //match against other cards
        {
            for (Card *otherCard in self.cards)
            {
                if(otherCard.isChosen && !otherCard.isMatched)
                {
                    int matchscore = [card match:@[otherCard]];
                    if(matchscore)
                    {
                        self.score += matchscore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    }
                    else
                    {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break; //can only allow two cards to be chosen
                }
            }
            self.score -= COST_TO_CHOOSE_CARD;
            card.chosen = YES;
        }
    }
}

@end
