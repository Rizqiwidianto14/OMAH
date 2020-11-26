//
//  ViewController.swift
//  OmahTulangan
//
//  Created by Rizqi Imam Gilang Widianto on 21/05/20.
//  Copyright © 2020 Rizqi Imam Gilang Widianto. All rights reserved.
//

import UIKit

var categories = ["Dekor Rumah Yuk!", "Bersih Pangkal Sehat", "Biar Mandi Lebih Byur~", "Nyuci, nyuci sendiri~", "Penakluk Dapur Di Sayang Mama", "Bikin Betah di Omah"]


var bundleList: [UIImage] = [#imageLiteral(resourceName: "Bundle1"), #imageLiteral(resourceName: "Bundle2"), #imageLiteral(resourceName: "Bundle3")]

class HomeViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate {

    
    @IBOutlet weak var bundleCV: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

//        // Do any additional setup after loading the view.
//        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        self.navigationController!.navigationBar.shadowImage = UIImage()
//        self.navigationController!.navigationBar.isTranslucent = true

    }
    

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
   
    
    
    @IBAction func profileDidTap(_ sender: UIButton) {
//      performSegue(withIdentifier: "profileVC" , sender: self)
    }

    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width:
        tableView.bounds.size.width, height: 0))
        
        

        let headerLabel = UILabel()
        headerLabel.font =  .systemFont(ofSize: 20, weight: .bold)
        //let headerInset: CGFloat = 50
        //tableView.separatorInset = UIEdgeInsets.init(top: 0, left: headerInset, bottom: 0, right: 0)

        headerLabel.textColor = UIColor.black
        headerView.addSubview(headerLabel)
        
        //headerLabel.text = self.tableView(self.tableView, titleForHeaderInSection: section)
      //  headerLabel.sizeToFit()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: headerLabel.topAnchor).isActive = true
        headerLabel.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 20).isActive = true
        
       // headerLabel.constraints = view.leftAnchor(
        
       // headerLabel.adjustsFontForContentSizeCategory = true
      //  headerLabel.isEnabled = true
        headerLabel.text = categories[section]
        //headerLabel.adjustsFontSizeToFitWidth = true
       // headerLabel.textAlignment = .center
       // headerLabel.

        return headerView
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bundleList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bundleCV.dequeueReusableCell(withReuseIdentifier: "bundleCell", for: indexPath) as! BundleCell
        cell.bundleImage.image = bundleList[indexPath.row]
        cell.layer.cornerRadius = 15
        
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CategoryRow
        cell.data = x[indexPath.section]
        print(cell.data)
        cell.collectionView.reloadData()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return categories[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    
    
}





