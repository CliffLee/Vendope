//
//  SecondViewController.swift
//  daf
//
//  Created by Clifford Lee on 10/3/15.
//  Copyright © 2015 Clifford Lee. All rights reserved.
//



import UIKit
import Parse
import Bolts

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate, CustomSearchControllerDelegate {
    
    @IBOutlet weak var tblSearchResults: UITableView!
    
    var services:[PFObject] = []
    var filteredArray: [PFObject] = []
    var shouldShowSearchResults = false
    var searchController: UISearchController!
    var customSearchController: CustomSearchController!
    
    var appDelegate:AppDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        appDelegate?.setRootViewController()
        
        tblSearchResults.delegate = self
        tblSearchResults.dataSource = self
        
        loadListOfServices()

        
        configureSearchController()
        //configureSearchController()
        configureCustomSearchController()
        
        self.title = "VENDOPÉ"
        /*for i in 1...20 {
            var service = PFObject(className:"Service")
            service.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                print("Object has been saved.")
            }
        }*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func leftSideButtonTapped(sender: AnyObject) {
        
        appDelegate!.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
    }
    
    @IBAction func rightSideButtonTapped(sender: AnyObject) {
        appDelegate!.centerContainer!.toggleDrawerSide(MMDrawerSide.Right, animated: true, completion: nil)
    }
    
    
    func configureSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = true
        searchController.searchBar.placeholder = "Search here..."
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        tblSearchResults.tableHeaderView = searchController.searchBar
        
        
    }
    
    
    func configureCustomSearchController() {
        customSearchController = CustomSearchController(searchResultsController: self, searchBarFrame: CGRectMake(0.0, 0.0, tblSearchResults.frame.size.width, 50.0), searchBarFont: UIFont(name: "Helvetica Neue", size: 16.0)!, searchBarTextColor: UIColor(red:0.42, green:0.00, blue:0.00, alpha:1.0), searchBarTintColor: UIColor.whiteColor())
        
        customSearchController.customSearchBar.placeholder = "SEARCH FOR SERVICES"
        tblSearchResults.tableHeaderView = customSearchController.customSearchBar
        
        customSearchController.customDelegate = self
    }
    
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        shouldShowSearchResults = true
        tblSearchResults.reloadData()
    }
    
    
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        shouldShowSearchResults = false
        tblSearchResults.reloadData()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        if !shouldShowSearchResults {
            shouldShowSearchResults = true
            tblSearchResults.reloadData()
        }
        
        searchController.searchBar.resignFirstResponder()
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchString = searchController.searchBar.text
        
        // Filter the data array and get only those countries that match the search text.
        filteredArray = services.filter({ (service) -> Bool in
            let serviceText: NSString = service.valueForKey("name") as! String
            
            return (serviceText.rangeOfString(searchString!, options: NSStringCompareOptions.CaseInsensitiveSearch).location) != NSNotFound
        })
        // Reload the tableview.
        tblSearchResults.reloadData()
    }
    
    func loadListOfServices() {
        let query = PFQuery(className: "Service")
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil {
                print("Successfully retrieved: \(objects)")
                self.services = objects!
                self.tblSearchResults.reloadData()
            } else {
                print("Error: \(error) \(error!.userInfo)")
            }
        }
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if shouldShowSearchResults {
            return filteredArray.count
        }
        else {
            return services.count
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("idCell", forIndexPath: indexPath)
        
        if shouldShowSearchResults {
            cell.textLabel?.text = filteredArray[indexPath.row].valueForKey("name") as? String
        }
        else {
            cell.textLabel?.text = services[indexPath.row].valueForKey("name") as? String
        }
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    
    func didStartSearching() {
        shouldShowSearchResults = true
        tblSearchResults.reloadData()
    }
    
    
    func didTapOnSearchButton() {
        if !shouldShowSearchResults {
            shouldShowSearchResults = true
            tblSearchResults.reloadData()
        }
    }
    
    
    func didTapOnCancelButton() {
        shouldShowSearchResults = false
        tblSearchResults.reloadData()
    }
    
    
    func didChangeSearchText(searchText: String) {
        // Filter the data array and get only those countries that match the search text.
        filteredArray = services.filter({ (service) -> Bool in
            let serviceText: NSString = service.valueForKey("name") as! String
            
            return (serviceText.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch).location) != NSNotFound
        })
        
        // Reload the tableview.
        tblSearchResults.reloadData()
    }

}
