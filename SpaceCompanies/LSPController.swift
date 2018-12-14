//
//  LSPController.swift
//  SpaceCompanies
//
//  Created by Steve Lederer on 12/13/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

import Foundation

class LSPController {
    static let baseURL = URL(string: "https://launchlibrary.net")
    
    // MARK: - Fetching
    // URL SHOULD LOOK LIKE THIS: https://launchlibrary.net/1.3/lsp
    
    static func getLaunchServiceProviders(completion: @escaping ([Agency]?) -> Void) {
        guard let url = baseURL?.appendingPathComponent("1.3").appendingPathComponent("lsp") else { completion(nil) ; return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        print(request.url?.absoluteString ?? "No URL")

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("❌ There was an error in \(#function) ; \(error.localizedDescription) ❌")
                completion(nil)
                return
            }
            print(response)
            
            guard let data = data else { completion(nil) ; return }
            
            do {
                let lsp = try JSONDecoder().decode(LSP.self, from: data)
                let agencies = lsp.agencies
                completion(agencies)

            } catch {
                print("❌ There was an error in \(#function) ; \(error.localizedDescription)❌")
                completion(nil)
                return
            }
            
        }.resume()

    }
}
