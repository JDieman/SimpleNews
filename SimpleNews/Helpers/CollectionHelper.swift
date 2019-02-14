//
//  CollectionHelper.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 15/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

extension Collection {
    
    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript(safe index: Index?) -> Iterator.Element? {
        guard let index = index else { return nil }
        return index >= startIndex && index < endIndex ? self[index] : nil
    }
    
}
