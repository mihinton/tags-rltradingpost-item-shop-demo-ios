//
//  ItemShopTableViewCell.swift
//  RL Trading Post
//
//  Created by Michael Hinton on 2/27/21.
//  Copyright © 2021 HinTech, LLC. All rights reserved.
//

import UIKit

class ItemShopTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var categoryImageView: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rarityCategoryLabel: UILabel!

    @IBOutlet weak var certificationContainerView: UIView!
    @IBOutlet weak var certificationLabel: UILabel!

    @IBOutlet weak var colorContainerView: UIView!
    @IBOutlet weak var colorLabel: UILabel!

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var notTradableView: UIView!

    private var item: RocketLeagueItem!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.layer.shadowColor = UIColor.black.cgColor
        nameLabel.layer.shadowOffset = .zero
        nameLabel.layer.shadowRadius = 4.0
        nameLabel.layer.shadowOpacity = 1.0
        nameLabel.layer.masksToBounds = false
        nameLabel.layer.shouldRasterize = true
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        addGradientBackground()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addGradientBackground()
    }
    
    func set(item: RocketLeagueItem, isFeatured: Bool) {
        self.item = item
        
        itemImageView.image = nil
        itemImageView.imageFromUrl(item.iconUrl)
        
        nameLabel.text = item.name
        rarityCategoryLabel.text = "rarity_category".localized(item.rarity.localized, item.category.localized)
        
        certificationContainerView.alpha = item.certification != "None" ? 1.0 : 0
        certificationLabel.text = item.certification.localized
        
        colorContainerView.isHidden = item.paint == "None"
        colorContainerView.backgroundColor = item.paintUiColor
        colorLabel.text = item.paint.localized
        colorLabel.textColor = getTextColor(color: item.paint)
        
        priceLabel.text = item.price > 0 ? String(item.price) : "FREE".localized
        notTradableView.isHidden = item.isTradable
        
        categoryImageView.image = UIImage(named: item.category.lowercased().replacingOccurrences(of: " ", with: "-"))
        categoryImageView.isHidden = !isFeatured
    }
    
    private func addGradientBackground() {
        if item == nil { return }
        
        containerView.layer.sublayers?.forEach {
            if $0 is CAGradientLayer { $0.removeFromSuperlayer() }
        }
        
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.black.cgColor, item.rarityUiColor.cgColor]
        gradient.locations = [0.35, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: containerView.frame.size.width, height: containerView.frame.size.height)
        containerView.layer.insertSublayer(gradient, at: 0)
    }
    
    private func getTextColor(color: String) -> UIColor {
        let lightColors = ["Lime", "Orange", "Saffron", "Titanium White"]
        if lightColors.contains(color) {
            return .black
        }
        return .white
    }

}
