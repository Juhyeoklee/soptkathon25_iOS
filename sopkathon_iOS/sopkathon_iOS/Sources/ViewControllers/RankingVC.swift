//
//  RankingVC.swift
//  sopkathon_iOS
//
//  Created by 이주혁 on 2019/11/03.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class RankingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RankingVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        let rankCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RankCell", for: indexPath) as! RankingCVC
            

            return rankCell
            
        }
}
