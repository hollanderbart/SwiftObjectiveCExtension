//
//  EmojiRandomGenerator.swift
//  SwiftObjectiveCExtension
//
//  Created by Bart den Hollander on 09/05/2019.
//  Copyright © 2019 BdH. All rights reserved.
//

import Foundation

@objc
class EmojiRandomGenerator: NSObject {
    
    let dependency: DependencyInjection
    
    // Annotating this initializer with `@objc` would result in a error message
    // `Method cannot be marked @objc because the type of the parameter 1 cannot be represented in Objective-C`
    init(dependency: DependencyInjection, config: EmojiRandomGeneratorConfiguration) {
        self.dependency = dependency
    }
    
    func generateCharacter() -> Character {
        let beginEmojiRange: UInt32 = 0x1F600
        let endEmojiRange: UInt32 = 0x1F64F
        let hexEmoji = beginEmojiRange...endEmojiRange
        let emoji = hexEmoji
            .compactMap(UnicodeScalar.init)
            .randomElement()
        return Character(emoji ?? "😎")
    }
}

// The concept is to have as much of Objective-C wrapper boilerplate in extensions.
// These extensions can be easily removed when you transitioned to Swift completely.
// I see this creates some boilerplate but that is also a way / reason to actual remove all Objective-C code.
// I beleive to only go this route when you create new code in Swift, else go the route of changing the Swift types to be compatible with Objective-C (Int, NSString etc.).
extension EmojiRandomGenerator {
    
    // DependencyInjection is just a convenience struct to wrap dependencies but isn't needed.
    // The same holds for the EmojiRandomGeneratorConfiguration, which isn't really needed to be transitioned to Objective-C.
    // In Objective-C you now have to give every dependency with the initializer, which is fine.
    @objc
    convenience init(errorHandler: ErrorHandler, emojiEmotion: ObjCEmojiEmotion) {
        let errorHandler = errorHandler
        
        let emoji: EmojiEmotion
        switch emojiEmotion {
        case .happy:
            emoji = .happy
        case .sad:
            emoji = .sad
        }
        
        let config = EmojiRandomGeneratorConfiguration(emotion: emoji)
        self.init(dependency: DependencyInjection(errorHandler: errorHandler), config: config)
    }
    
    // This is a Objectice-C wrapping function to the Swift function
    @objc
    func generateString() -> String {
        let character = self.generateCharacter()
        return "\(character)"
    }
}
