//
//  ViewController.swift
//  SwiftObjectiveCExtension
//
//  Created by Bart den Hollander on 09/05/2019.
//  Copyright © 2019 BdH. All rights reserved.
//

import UIKit

class EmojiViewController: UIViewController {
    
    // MARK: Outlet
    
    @IBOutlet weak var emojiLabel: UILabel!
    
    // MARK: Private
    
    private let errorHandler = ErrorHandler()
    private let emojiRandomizer: EmojiRandomGenerator
    
    // We make use of interface builder to init the view
    required init?(coder aDecoder: NSCoder) {
        let dependency = DependencyInjection(errorHandler: errorHandler)
        let config = EmojiRandomGeneratorConfiguration(emotion: EmojiEmotion.happy)
        self.emojiRandomizer = EmojiRandomGenerator(dependency: dependency, config: config)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emojiLabel.text = "\(emojiRandomizer.generateCharacter())"
    }
}
