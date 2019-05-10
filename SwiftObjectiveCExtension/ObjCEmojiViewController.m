//
//  ObjCEmojiViewController.m
//  SwiftObjectiveCExtension
//
//  Created by Bart den Hollander on 10/05/2019.
//  Copyright © 2019 BdH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjCEmojiViewController.h"
#import "SwiftObjectiveCExtension-Swift.h"

@interface ObjCEmojiViewController()
@end

// This ViewController is just a dummy to check the syntax to EmojiRandomGenerator
@implementation ObjCEmojiViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    
    EmojiRandomGenerator *generator = [[EmojiRandomGenerator alloc] initWithErrorHandler:[ErrorHandler new] emojiEmotion:ObjCEmojiEmotionHappy];
    NSLog(@"%@", [generator generateString]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

