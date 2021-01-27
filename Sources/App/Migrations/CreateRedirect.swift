//
//  CreateRedirect.swift
//
//
//  Created by Shahriar Nasim Nafi on 27/1/21.
//

import Fluent

struct CreateRedirect: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("redirects")
            .id()
            .field("short", .string, .required)
            .field("link", .string, .required)
            .create()
    }
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("redirects").delete()
    }
}
