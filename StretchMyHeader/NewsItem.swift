//
//  NewsItem.swift
//  StretchMyHeader
//
//  Created by Kevin Cleathero on 2017-07-04.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

import Foundation


struct NewsItem{
    let category: String
    let headline: String
    
    init(category: String, headline: String) {
        self.category = category
        self.headline = headline
    }
}
