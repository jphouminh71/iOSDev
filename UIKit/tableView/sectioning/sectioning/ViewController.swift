//
//  ViewController.swift
//  sectioning
//
//  Created by Jonathan Phouminh on 7/13/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import UIKit

class MobileBrand {
    var brandName: String?
    var modelName: [String]?
    
    init(_ brandName: String, _ modelName: [String]) {
        self.brandName = brandName
        self.modelName = modelName
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    var mobileBrands = [MobileBrand]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self

        loadBrands()

    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    // setting how many sections we want
    func numberOfSections(in tableView: UITableView) -> Int {
        return mobileBrands.count  // amount of sections we have is the amount of brands we have
        // the sections are implicitly also set here.
    }
        
    // number of rows in a section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // returns given rows in that section based on amount of items in that model
        return mobileBrands[section].modelName?.count ?? 0
        // amount of rows per section is dependant on how many items are in that sections model count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOne")
        let label = cell?.viewWithTag(100) as? UILabel
        label?.text = mobileBrands[indexPath.section].modelName?[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mobileBrands[section].brandName
    }
    
    // this is how we customize the section headings
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width-15, height: 40))
        label.text = mobileBrands[section].brandName
        label.textColor = .white
        view.addSubview(label)
        return view
    }
}

extension ViewController {
    func loadBrands(){
        mobileBrands.append(MobileBrand.init("Samsung", ["Samsung M Series", "Samsung Galaxy Note 9", "Samsung Galaxy Note 9+", "Samsung Galaxy Note 10", "Samsung Galaxy Note 10+"]))
        mobileBrands.append(MobileBrand.init("Apple", ["iPhone 5s", "iPhone 6s", "iPhone 6", "iPhone 7+", "iPhone 11", "iPhone 11 Pro"]))
        mobileBrands.append(MobileBrand.init("Mi", ["Mi Note 7", "Mi Note 7 Pro", "Mi k20"]))
        mobileBrands.append(MobileBrand.init("Huawei", ["Huawei Mate 20", "Huawei P30 Pro", "Huawei P10 Plus", "Huawei P20"]))
    }
}
