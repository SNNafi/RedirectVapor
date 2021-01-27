import Vapor
import Fluent
import FluentMySQLDriver

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    app.http.server.configuration.port = 8081
    app.databases.use(.mysql(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        username: Environment.get("DATABASE_USERNAME") ?? "redirect",
        password: Environment.get("DATABASE_PASSWORD")  ?? "redirect",
        database: Environment.get("DATABASE_NAME") ?? "redirect",
        tlsConfiguration: .forClient(certificateVerification: .none)
      ), as: .mysql)


    app.migrations.add(CreateRedirect())
    app.logger.logLevel = .debug
    try app.autoMigrate().wait()

    // register routes
    try routes(app)
}
