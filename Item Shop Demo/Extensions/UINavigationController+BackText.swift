//
//  UINavigationController+BackText.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 2/13/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import UIKit

extension UINavigationController {

    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

}
