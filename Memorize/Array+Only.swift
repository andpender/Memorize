//
//  Array+Only.swift
//  Memorize
//
//  Created by Andrew Pender on 26/5/20.
//  Copyright © 2020 Andrew Pender. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
