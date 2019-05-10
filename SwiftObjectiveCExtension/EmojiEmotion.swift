//
//  EmojiEmotion.swift
//  SwiftObjectiveCExtension
//
//  Created by Bart den Hollander on 10/05/2019.
//  Copyright © 2019 BdH. All rights reserved.
//

import Foundation

enum EmojiEmotion {
    case happy
    case sad
}

// The idea is that the following Objective-C enum can be removed when we've transitioned to Swift completely
@objc
enum ObjCEmojiEmotion: Int {
    case happy = 0
    case sad = 1
}
