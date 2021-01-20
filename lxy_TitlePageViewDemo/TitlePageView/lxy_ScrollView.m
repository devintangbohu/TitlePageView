//
//  lxy_ScrollView.m
//  lxy_TitlePageViewDemo
//
//  Created by Devin on 2021/1/18.
//

#import "lxy_ScrollView.h"

@implementation lxy_ScrollView


#pragma mark - UIGestureRecognizerDelegate


-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if([self panBack:gestureRecognizer]) {

        return NO;

    }
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {

    if([self panBack:gestureRecognizer]) {

        return YES;

    }

    return NO;

}


- (BOOL)panBack:(UIGestureRecognizer *)gestureRecognizer {

    if( gestureRecognizer == self.panGestureRecognizer) {
        
        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
        
        CGPoint point = [pan translationInView:self];
        
        UIGestureRecognizerState state = gestureRecognizer.state;
        
        if(UIGestureRecognizerStateBegan == state || UIGestureRecognizerStatePossible == state) {
            
            CGPoint location = [gestureRecognizer locationInView:self];
            
            if(point.x>0&& location.x<90&&self.contentOffset.x<=0) {
                
                return YES;
                
            }
            
        }
    }

    return NO;

}

@end
