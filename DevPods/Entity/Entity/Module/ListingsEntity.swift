//
//  ListingsEntity.swift
//  Assignment
//
//  Created by M.Shariq Hasnain on 31/05/2024.
//

import RealmSwift

public class ListingsModel: Object {
    
    @Persisted(primaryKey: true) public var name: String = ""
    @Persisted public var domains: List<String>
    @Persisted public var webPages: List<String>
    @Persisted public var alphaTwoCode: String
    @Persisted public var stateProvince: String
    @Persisted public var country: String

    public override class func primaryKey() -> String? {
        return "name"
    }
    
    override init() {
        super.init()
    }
    
    public init(data: [String: Any]) {
        name = data["name"] as? String ?? ""
        alphaTwoCode = data["alpha_two_code"] as? String ?? ""
        stateProvince = data["state-province"] as? String ?? ""
        country = data["country"] as? String ?? ""
        domains = data["domains"] as? List<String> ?? List()
        webPages = data["web_pages"] as? List<String> ?? List()
    }
}
