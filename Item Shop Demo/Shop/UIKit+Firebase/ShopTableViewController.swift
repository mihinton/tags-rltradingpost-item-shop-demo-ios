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

    private var itemShop: ItemShop?

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
        return itemShop != nil ? 2 : 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == featuredItemsIndex {
            return itemShop?.featuredItems.count ?? 0
        } else if section == dailyItemsIndex {
            return itemShop?.dailyItems.count ?? 0
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let itemShop = itemShop else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemShopTableViewCell", for: indexPath) as! ItemShopTableViewCell
        if indexPath.section == featuredItemsIndex {
            cell.set(item: itemShop.featuredItems[indexPath.row], isFeatured: true)
        } else {
            cell.set(item: itemShop.dailyItems[indexPath.row], isFeatured: false)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let itemShop = itemShop else {
            return UIView()
        }
        
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ItemShopTableViewHeaderFooterView") as! ItemShopTableViewHeaderFooterView
        if section == featuredItemsIndex {
            cell.headerLabel.text = "featured_items_section_header".localized
            cell.setExpiration(date: itemShop.featuredEndDate)
        } else if section == dailyItemsIndex {
            cell.headerLabel.text = "daily_items_section_header".localized
            cell.setExpiration(date: itemShop.dailyEndDate)
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
        ItemShopFirebaseService.shared.getShop(date: "2021-10-26") { [weak self] (itemShop) in
            guard let self = self else { return }
            guard let itemShop = itemShop else {
                self.itemShop = nil
                let footerView = ItemShopUnavailableFooterView(frame: self.tableView.frame)
                self.tableView.tableFooterView = footerView
                self.tableView.reloadData()
                self.view.setNeedsLayout()
                return
            }
            
            self.itemShop = itemShop
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            self.headerView.dateLabel.text = dateFormatter.string(from: itemShop.dailyStartDate)
            
            self.headerView.messageTextView.isHidden = itemShop.message?.isEmpty ?? true
            self.headerView.messageTextView.text = itemShop.message ?? ""
            
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
