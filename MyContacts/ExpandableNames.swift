//
//  ExpandableNames.swift
//  Contacts
//
//  Created by Thiago Garcia on 11/04/18.
//  Copyright © 2018 iGarcia. All rights reserved.
//

import Foundation
import Contacts

struct ExpandableNames {
    var isExpanded: Bool
    var names: [FavoritableContact]
}

struct FavoritableContact {
    let contact: CNContact
    var hasFavorited: Bool
}
