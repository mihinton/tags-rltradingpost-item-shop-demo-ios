//
//  ItemShopFirebaseService.swift
//  RL Trading Post
//
//  Created by Michael Hinton on 2/27/21.
//  Copyright © 2021 HinTech, LLC. All rights reserved.
//

import FirebaseFirestore
import Foundation

class ItemShopFirebaseService: NSObject {

    let itemShopCollectionPath = "itemShop"

    static let shared = ItemShopFirebaseService()

    private var shopListenerRegistration: ListenerRegistration?

    private override init() {}

    func getShop(date: String, completion: @escaping (ShopRotation?) -> ()) {
        shopListenerRegistration?.remove()
        
        shopListenerRegistration = Firestore.firestore()
            .collection(itemShopCollectionPath)
            .document(date)
            .addSnapshotListener { snapshot, _ in
                guard let snapshot = snapshot else {
                    completion(nil)
                    return
                }
                
                do {
                    let shopRotation = try snapshot.data(as: ShopRotation.self)
                    completion(shopRotation)
                } catch {
                    print(error)
                    completion(nil)
                }
            }
    }

}
