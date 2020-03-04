//
//  CategoryCell.swift
//  Granzia Egypt
//
//  Created by Mohammed Mohsin Sayed on 2/28/20.
//  Copyright © 2020 Abeer . All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {


    @IBOutlet weak var categoryNameLable: UILabel!
    @IBOutlet weak var devicesCollectionView: UICollectionView!
    
    var Devices : [Device] = []
    
    override func awakeFromNib() {
        devicesCollectionView.delegate = self
        devicesCollectionView.dataSource = self
   }
    
    func setCategory(category: Category ){
        categoryNameLable.text = category.name
        if category.devices != nil {
            Devices = category.devices!
            devicesCollectionView.reloadData()
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension CategoryCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Devices.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let device = Devices[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "deviceCell", for: indexPath) as! DeviceCell
        cell.setDeviceCell(image: device.image, name: device.name)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        DataServices.instance.setSelectedDevice(device: Devices[indexPath.row])
        
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let detailsVC = storyBoard.instantiateViewController(withIdentifier: "DeviceDetailsVC")
        window?.makeKeyAndVisible() //show the authVc window
        window?.rootViewController?.present(detailsVC, animated: true, completion: nil)
    }
    
}
