//
//  ExpandableNames.swift
//  Contacts
//
//  Created by Thiago Garcia on 11/04/18.
//  Copyright © 2018 iGarcia. All rights reserved.
//

import Foundation

struct ExpandableNames {
    var isExpanded: Bool
    var names: [Contact]
}

struct Contact {
    let name: String
    var hasFavorited: Bool
}
