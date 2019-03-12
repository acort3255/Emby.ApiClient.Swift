//
//  SignIn.swift
//  EmbyApiClient
//
//  Created by Kevin Sullivan on 12/14/15.
//
//

import UIKit

import EmbyApiClient

class SignIn: UITableViewController {
    
    var apiClient: ApiClient!
    var userName: String?
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let userName = userName {
            usernameField.text = userName
        }
    }
    
    @IBAction func signInButtonTapped(sender: UIBarButtonItem) {
        apiClient.authenticateUserAsync(username: usernameField.text!, password: passwordField.text ?? "", success: { (result) -> Void in
            self.apiClient.setAuthenticationInfo(accessToken: result.accessToken)
            
            let alert = UIAlertController(title: "Authentication Successful", message: "Access Token: \(result.accessToken)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            var itemQuery = ItemQuery()
            itemQuery.userId = result.user.id
//            itemQuery.sortBy = [SortOrder.Descending.rawValue]
            itemQuery.sortBy = ["DateCreated"]
            itemQuery.sortOrder = SortOrder.Descending

//             Get media only, don't return folder items
//            itemQuery.filters = [ItemFilter.IsNotFolder]
            itemQuery.enableTotalRecordCount = true;
            itemQuery.limit = 20
            itemQuery.startIndex = 0
            itemQuery.recursive = true
            itemQuery.includeItemTypes = ["Series"]
//            var seasonE = EpisodeQuery()
//            seasonE.seriesId = "63c2c38378a14fc7fe108e1857d89009"
//            seasonE.seasonId = "74575279c8028cbfadd6fc801d16b1f3"
//            seasonE.userId = result.user.id
            _ = self.apiClient.getItemsAsync(query: itemQuery, success: { (results) in
                for item in results.items ?? []
                {
                    print("Item results: \(item.name)")
                    let url = self.apiClient.getImageUrl(item: item, options: ImageOptions())
                    print(url)
                }
            }, failure: { (error) in
                print("Failed to get items: \(error)")
            })
            
//            _ = self.apiClient.getGenresAsync(query: ItemsByNameQuery(), success: { (items) in
//                for item in items {
//                    print("Genre Name: \(item.name) Id: \(item.id)")
//                }
//            }, failure: { (error) in
//                print("Failed to get Genres")
//            })
            
            
            }, failure: { (error) -> Void in
                
                let alert = UIAlertController(title: "Sign In Failed", message: "\(error)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                
        })
    }
}
