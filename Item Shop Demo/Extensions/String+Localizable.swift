//
//  String+Localizable.swift
//  RL Trading Post
//
//  Created by Michael Hinton on 4/5/19.
//  Copyright © 2019 HinTech, LLC. All rights reserved.
//

import Foundation

extension String {

    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localized(_ arguments: CVarArg...) -> String {
        return String(format: self.localized, arguments: arguments)
    }
    
    func localizedPluralable(_ num: Int) -> String {
        return String.localizedStringWithFormat(NSLocalizedString(self, comment: ""), num)
    }

}
