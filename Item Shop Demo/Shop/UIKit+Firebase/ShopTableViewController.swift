//
//  ShopTableViewController.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 9/24/21.
//  Copyright © 2021 HinTech, LLC. All rights reserved.
//

import UIKit

class ShopTableViewController: UITableViewController {

    private let featuredItemsIndex = 0
    private let dailyItemsIndex = 1

    private var headerView: ItemShopHeaderView!

    private var shopRotation: ShopRotation?

    private var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupShopFirebaseListener()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.resizeHeaderView()
        tableView.resizeFooterView()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return shopRotation != nil ? 2 : 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == featuredItemsIndex {
            return shopRotation?.featuredItems.count ?? 0
        } else if section == dailyItemsIndex {
            return shopRotation?.dailyItems.count ?? 0
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let shopRotation = shopRotation else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemShopTableViewCell", for: indexPath) as! ItemShopTableViewCell
        if indexPath.section == featuredItemsIndex {
            cell.set(item: shopRotation.featuredItems[indexPath.row], isFeatured: true)
        } else {
            cell.set(item: shopRotation.dailyItems[indexPath.row], isFeatured: false)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let shopRotation = shopRotation else {
            return UIView()
        }
        
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ItemShopTableViewHeaderFooterView") as! ItemShopTableViewHeaderFooterView
        if section == featuredItemsIndex {
            cell.headerLabel.text = "Featured Items".localized
            cell.setExpiration(date: shopRotation.featuredEndDate)
        } else if section == dailyItemsIndex {
            cell.headerLabel.text = "Daily Items".localized
            cell.setExpiration(date: shopRotation.dailyEndDate)
        } else {
            cell.headerLabel.text = ""
        }
        return cell
    }
    
    func scrollToTop() {
        let desiredOffset = CGPoint(x: 0, y: -tableView.contentInset.top)
        tableView.setContentOffset(desiredOffset, animated: true)
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "ItemShopTableViewHeaderFooterView", bundle: nil), forHeaderFooterViewReuseIdentifier: "ItemShopTableViewHeaderFooterView")
        tableView.register(UINib(nibName: "ItemShopTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemShopTableViewCell")
        
        headerView = ItemShopHeaderView(frame: tableView.frame)
        headerView.creatorCodeContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openCreatorCodeDetailsWebPage)))
        tableView.tableHeaderView = headerView
        tableView.tableFooterView = UIView()
        
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
    
    private func setupShopFirebaseListener() {
        ItemShopService.shared.getShop(date: "2021-10-26") { [weak self] (shopRotation) in
            guard let self = self else { return }
            guard let shopRotation = shopRotation else {
                self.shopRotation = nil
                let footerView = ItemShopUnavailableFooterView(frame: self.tableView.frame)
                self.tableView.tableFooterView = footerView
                self.tableView.reloadData()
                self.view.setNeedsLayout()
                return
            }
            
            self.shopRotation = shopRotation
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            self.headerView.dateLabel.text = dateFormatter.string(from: shopRotation.dailyStartDate)
            
            self.headerView.messageTextView.isHidden = shopRotation.message?.isEmpty ?? true
            self.headerView.messageTextView.text = shopRotation.message ?? ""
            
            let footerView = ItemShopFooterView(frame: self.tableView.frame)
            self.tableView.tableFooterView = footerView
            self.tableView.reloadData()
            self.view.setNeedsLayout()
        }
    }
    
    @objc private func openCreatorCodeDetailsWebPage() {
        presentSafariViewController(url: "https://rltradingpost.app/support_a_creator")
    }
    
}
