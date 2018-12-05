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
            itemQuery.filters = [ItemFilter.IsNotFolder]
            itemQuery.enableTotalRecordCount = false;
            itemQuery.limit = 10
            itemQuery.recursive = true
//            _ = self.apiClient.getItemsAsync(query: itemQuery, success: { (itemResults) in
//                for item in itemResults
//                {
//                    print("Item results: \(item.name)")
//                    let url = self.apiClient.getImageUrl(item: item, options: ImageOptions())
//                    print(url)
//                }
//            }, failure: { (error) in
//                print("Failed to get items: \(error)")
//            })
            
            let test = NextUpQuery()
            
            _ = self.apiClient.getGenresAsync(query: ItemsByNameQuery(), success: { (items) in
                for item in items {
                    print(item.name)
                }
            }, failure: { (error) in
                print("Failed to get Genres")
            })
            
            
            }, failure: { (error) -> Void in
                
                let alert = UIAlertController(title: "Sign In Failed", message: "\(error)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                
        })
    }
}
