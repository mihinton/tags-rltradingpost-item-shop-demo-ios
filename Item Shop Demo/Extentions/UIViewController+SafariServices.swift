//
//  UIViewController+SafariServices.swift
//  RL Trading Post
//
//  Created by Michael Hinton on 12/27/19.
//  Copyright © 2019 HinTech, LLC. All rights reserved.
//

import SafariServices
import UIKit

extension UIViewController {

    func presentSafariViewController(url urlString: String, completion: (() -> Void)? = nil) {
        let url = URL(string: urlString)!
        let vc = SFSafariViewController(url: url)
        vc.preferredBarTintColor = .accent
        vc.preferredControlTintColor = .white
        present(vc, animated: true, completion: completion)
    }

}
