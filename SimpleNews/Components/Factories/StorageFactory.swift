//
//  StorageFactory.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 07/03/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

struct StorageFactory {
    
    private init() {}
    
    static var storage: Storage {
        return CoreDataStorage()
    }
}
