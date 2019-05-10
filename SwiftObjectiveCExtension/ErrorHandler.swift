//
//  ErrorHandler.swift
//  SwiftObjectiveCExtension
//
//  Created by Bart den Hollander on 10/05/2019.
//  Copyright © 2019 BdH. All rights reserved.
//

import Foundation
import UIKit

@objc
class ErrorHandler: NSObject {
    
    func handleError(sender: UIViewController, error: Error) {
        print(error.localizedDescription)
    }
}
