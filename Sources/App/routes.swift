import Vapor
import Fluent

func routes(_ app: Application) throws {
    app.get { req in
        return "Shahriar Nasim Nafi"
    }
    
    app.get("snnafi") { req -> Response in
        req.redirect(to: "https://snnafi.com")
        
    }
    
    app.get("portfolio") { req -> Response in
        req.redirect(to: "https://app.snnafi.com")
        
    }

    app.get("hello") { req -> Response in
        req.redirect(to: "https://snnafi.com")
    }
    
    app.post("api", "redirects") { req -> EventLoopFuture<Redirect> in
        let acronym = try req.content.decode(Redirect.self)
        return acronym.save(on: req.db).map {
            acronym
        }
    }
    
    app.get("api", "redirects") { req -> EventLoopFuture<[Redirect]> in
        Redirect.query(on: req.db).all()
    }
    
    app.get(":short") {
      req -> EventLoopFuture<Response> in
   
      guard let searchTerm =
                req.parameters.get("short") else {
        throw Abort(.badRequest)
      }
      return Redirect.query(on: req.db)
        .filter(\.$short == searchTerm)
        .all()
        .map { links in
            req.redirect(to: links[0].link)

        }
    }
}


