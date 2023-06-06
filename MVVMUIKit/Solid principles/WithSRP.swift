//
//  WithSRP.swift
//  MVVMUIKit
//
//  Created by rafiul hasan on 6/6/23.
//

import Foundation

class Handler {
    let apiHandler: APIHandler
    let parseHandler: ParseHandler
    let dbHandler: DBHandler
    
    // There is no hidden dependancy
    init(apiHandler: APIHandler, parseHandler: ParseHandler, dbHandler: DBHandler) {
        self.apiHandler = apiHandler
        self.parseHandler = parseHandler
        self.dbHandler = dbHandler
    }
    
    func handle() {
        let data = apiHandler.requestDataToAPI()
        let array = parseHandler.parseResponse(data: data)
        dbHandler.saveToDatabase(array: array)
    }
}

//let handler = Handler(apiHandler: <#T##<<error type>>#>, parseHandler: <#T##<<error type>>#>, dbHandler: <#T##<<error type>>#>)
class APIHandler {
    func requestDataToAPI() -> Data {
        // Network request and wait the response
        return Data()
    }
}

class ParseHandler {
    func parseResponse(data: Data) -> [String] {
        // Parse the network response into array
        return []
    }
}

class DBHandler {
    func saveToDatabase(array: [String]) {
        // Save parsed response into database
    }
}

