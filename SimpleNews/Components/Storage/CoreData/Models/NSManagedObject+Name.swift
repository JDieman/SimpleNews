//
//  NSManagedObject+Name.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 07/03/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import CoreData

extension NSManagedObject {
    class var name: String {
        return String(describing: self)
    }
}
