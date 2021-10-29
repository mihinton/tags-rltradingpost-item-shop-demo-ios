//
//  ItemShopFooterView.swift
//  RL Trading Post
//
//  Created by Michael Hinton on 3/3/21.
//  Copyright © 2021 HinTech, LLC. All rights reserved.
//

import UIKit

class ItemShopFooterView: UIView {

    @IBOutlet var contentView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("ItemShopFooterView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}
