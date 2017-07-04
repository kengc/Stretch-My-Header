//
//  ViewController.swift
//  StretchMyHeader
//
//  Created by Kevin Cleathero on 2017-07-04.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var headerView: UITableView!
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var imageHeaderView: UIView!
    
    let kTableHeaderHeight = CGFloat(200.0)

    
    //an array of newsItems
    var newsObjects = [NewsItem]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        configureTable()
        generateNews()
        setDate()
  
    }

//MARK - Table Setup
    func configureTable() {
        
        // We set the table view header.
            //UITableViewAutomaticDimension - set my row height equal to the sum of all the constraints
            self.tableView.rowHeight = UITableViewAutomaticDimension
            self.tableView.estimatedRowHeight = 50.0
            tableView.tableHeaderView = nil
            tableView.addSubview(imageHeaderView)

        //Next, we need to move our tableView down, let’s move it the size of our kTableHeaderHeight. Tableview comes with two properties that will be helpful to us: contentInset and contentOffSet. The contentInset property is used to set padding (kTableHeaderHeight). The contentOffset property is used to set how far we want to offset the start of your content (-kTableHeaderHeight, because -kTableHeaderHeight is now the top of the screen)
            self.tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left:0, bottom:0, right:0)
            self.tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        }

    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -kTableHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        imageHeaderView.frame = headerRect
    }
    
    

    
    override var prefersStatusBarHidden: Bool {
        return true
    }

//MARK - Data setup
    func generateNews(){
        let news1 = NewsItem(category: "World", headline: "Climate change protests, divestments meet fossil fuels realities")
        let news2 = NewsItem(category: "Europe", headline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'")
        let news3 = NewsItem(category: "Middle East", headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible")
        let news4 = NewsItem(category: "Africa", headline: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim")
        let news5 = NewsItem(category: "Asia Pacific", headline: "Despite UN ruling, Japan seeks backing for whale hunting")
        let news6 = NewsItem(category: "Americas", headline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria")
        let news7 = NewsItem(category: "World", headline: "South Africa in $40 billion deal for Russian nuclear reactors")
        let news8 = NewsItem(category: "Europe", headline: "'One million babies' created by EU student exchanges")
        
        newsObjects.append(news1)
        newsObjects.append(news2)
        newsObjects.append(news3)
        newsObjects.append(news4)
        newsObjects.append(news5)
        newsObjects.append(news6)
        newsObjects.append(news7)
        newsObjects.append(news8)
    }
    
//MARK - UITableView Delegates
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:CustomTableCell = self.tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableCell
        
        let newsItem = newsObjects[indexPath.row]
        cell.categoryLabel.text = "World"
        cell.headlineLabel.numberOfLines = 0
        cell.headlineLabel.lineBreakMode = .byWordWrapping
        cell.headlineLabel.text = "Climate change protests, divestments meet fossil fuels realities"
        
        switch newsItem.category {
        case "World":
            cell.categoryLabel.textColor = UIColor.red
        case "Americas":
            cell.categoryLabel.textColor = UIColor.blue
        case "Europe":
            cell.categoryLabel.textColor = UIColor.green
        case "Middle East":
            cell.categoryLabel.textColor = UIColor.yellow
        case "Africa":
            cell.categoryLabel.textColor = UIColor.orange
        case "Asia Pacific":
            cell.categoryLabel.textColor = UIColor.purple
            
        default: cell.categoryLabel.textColor = UIColor.black
        }
        
        return cell
    }

    func setDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd"
        let today = NSDate()
        let date = dateFormatter.string(from: today as Date)
        dateLabel.text = date
    }
}







