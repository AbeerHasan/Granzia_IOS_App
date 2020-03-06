//
//  medicalDevicesList.swift
//  Granzia Egypt
//
//  Created by Abeer  on 8/11/18.
//  Copyright © 2018 Abeer . All rights reserved.
//

import UIKit


class medicalDevicesList: UIViewController {
	
	@IBOutlet weak var categoriesTableView: UITableView!
	//slideShow
    @IBOutlet weak var pageControler: UIPageControl!
    @IBOutlet weak var adsCollectionView: UICollectionView!
	
	//-------------------------------------------------------------------------
    var categories = [Category]()
	//SlideShow
    let adsImages = [#imageLiteral(resourceName: "1"),#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "4"),#imageLiteral(resourceName: "3")]
    var timer = Timer()
    var counter = 0
    var flage = true
   //-------------------------------------------------------------------------

	override func viewDidLoad() {
        super.viewDidLoad()
		
        startSlideShow()
        
        //Main Content
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        
        performSelector(inBackground: #selector(getMainContent), with: nil)
        getMainContent()
	
    }
  //--------------------------------------------------------------------------
    func startSlideShow(){
        //SlideView
        pageControler.numberOfPages = adsImages.count
        pageControler.currentPage = 0
        
        adsCollectionView.delegate = self
        adsCollectionView.dataSource = self
        
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
    }
    
    @objc func getMainContent(){
        DataServices.instance.getAllCategories { (Categories) in
            self.categories = Categories
            self.categoriesTableView.performSelector(onMainThread: #selector(self.categoriesTableView.reloadData), with: nil, waitUntilDone: false)
        }
    }
    
    @objc func changeImage(){
        if counter == adsImages.count {
            flage = false
			counter -= 1
            
        }else if counter == 0 {
            flage = true
        }
        if flage {
            let index = IndexPath(item: counter , section: 0)
            self.adsCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            self.pageControler.currentPage = counter
            counter += 1
        }else {
            let index = IndexPath(item: counter , section: 0)
            self.adsCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            self.pageControler.currentPage = counter
            counter -= 1
        }
        
    }

}

// table view -------------------------------------------------------------------
extension medicalDevicesList: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return categories.count
	}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = categoriesTableView.dequeueReusableCell(withIdentifier: "categoryCell") as! CategoryCell
		let category = categories[indexPath.row]
		cell.setCategory(category: category)
		return cell
    }
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 205
	}
}

// collection view -------------------------------------------------------------------
extension medicalDevicesList: UICollectionViewDelegate, UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return adsImages.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "adsCell", for: indexPath) as! AdsCell
		cell.setImage(image: adsImages[indexPath.row])
		return cell
	
	}
	
	
}



















