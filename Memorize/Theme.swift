//
//  Theme.swift
//  Memorize
//
//  Created by Andrew Pender on 26/5/20.
//  Copyright © 2020 Andrew Pender. All rights reserved.
//

import Foundation
import SwiftUI

struct Theme {
    var name: String
    var emojiSet: Array<String>
    var numberOfCardsToShow: Int {
        Int.random(in: 1...emojiSet.count)
    }
    var color: Color
}
