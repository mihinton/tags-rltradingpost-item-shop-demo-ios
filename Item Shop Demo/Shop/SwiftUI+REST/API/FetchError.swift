//
//  FetchError.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 2/3/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import Foundation

enum FetchError: Error {
    case parsing(description: String)
    case network(description: String)
}
