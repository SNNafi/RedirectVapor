//
//  Redirect.swift
//  
//
//  Created by Shahriar Nasim Nafi on 27/1/21.
//

import Vapor
import Fluent

final class Redirect: Model {
    
    static let schema = "redirects"
    
    @ID
    var id: UUID?
    
    @Field(key: "short")
    var short: String
    
    @Field(key: "link")
    var link: String
    
    init() { }
    
    init(id: UUID? = nil, short: String, link: String) {
        self.id = id
        self.short = short
        self.link = link
    }
}

extension Redirect: Content { }
