//
//  InitialSetuping.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 18/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import UIKit

protocol InitialSetuping {
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    func initialSetup(_ model: ControllerInputModel)
}
