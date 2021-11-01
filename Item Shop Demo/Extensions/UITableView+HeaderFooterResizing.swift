//
//  UITableView+HeaderFooterResizing.swift
//  RL Trading Post
//
//  Created by Michael Hinton on 3/27/21.
//  Copyright © 2021 HinTech, LLC. All rights reserved.
//

import UIKit

extension UITableView {

    func resizeHeaderView() {
        guard let headerView = self.tableHeaderView else { return }
        
        let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        var headerFrame = headerView.frame
        
        if height != headerFrame.size.height {
            headerFrame.size.height = height
            headerView.frame = headerFrame
            self.tableHeaderView = headerView
        }
    }
    
    func resizeFooterView() {
        guard let footerView = self.tableFooterView else { return }
        
        let height = footerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        var footerFrame = footerView.frame
        
        if height != footerFrame.size.height {
            footerFrame.size.height = height
            footerView.frame = footerFrame
            self.tableFooterView = footerView
        }
    }

}
