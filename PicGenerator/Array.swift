//
//  Array.swift
//  PicGenerator
//
//  Created by Venkata Maniteja on 2017-06-09.
//  Copyright © 2017 VenkataNandamuri. All rights reserved.
//

import Foundation

extension Array{
    func randomItem() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}
