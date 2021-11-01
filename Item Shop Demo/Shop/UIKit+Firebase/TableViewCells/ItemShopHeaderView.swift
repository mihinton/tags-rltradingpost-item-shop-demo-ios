//
//  ItemShopHeaderView.swift
//  RL Trading Post
//
//  Created by Michael Hinton on 2/28/21.
//  Copyright © 2021 HinTech, LLC. All rights reserved.
//

import UIKit

class ItemShopHeaderView: UIView {

    @IBOutlet var contentView: UIView!

    @IBOutlet weak var creatorCodeContainerView: TouchAnimatedView!

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var messageTextView: UITextView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("ItemShopHeaderView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        messageTextView.linkTextAttributes = [.underlineStyle: 1]
        messageTextView.textContainer.lineFragmentPadding = CGFloat(0.0)
        messageTextView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        messageTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

}
