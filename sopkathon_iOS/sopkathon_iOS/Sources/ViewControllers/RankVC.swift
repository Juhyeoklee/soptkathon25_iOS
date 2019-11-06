//
//  RankVC.swift
//  sopkathon_iOS
//
//  Created by 이주혁 on 2019/11/03.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class RankVC: UIViewController {
    var userName: String?
    @IBOutlet var userNameLbl: UILabel!
    
    var rankList: [UserData] = [UserData(user: "주혁",candyCount: 10),
                                UserData(user: "가인",candyCount: 9),
                                UserData(user: "미정",candyCount: 8),
                                UserData(user: "진오",candyCount: 7),
                                UserData(user: "이시연",candyCount: 6),
                                UserData(user: "재은",candyCount: 5),
                                UserData(user: "양시연", candyCount: 4),
                                UserData(user: "태진",candyCount: 3),
                                UserData(user: "수민",candyCount: 2)]
    
    override func viewDidLoad() {
        
        userNameLbl.text = userName!
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismiss(){
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
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

extension RankVC: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.rankList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let rankCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RankCell", for: indexPath) as! RankCVC
        
        rankCell.rankLbl.text = String(indexPath.item + 1)
        rankCell.userNameLbl.text = rankList[indexPath.item].user
        rankCell.candyCountLbl.text = String(rankList[indexPath.item].candyCount)
        
        if self.userName == rankList[indexPath.item].user {
            rankCell.rankBgImg.image = UIImage(named: "rankBtn")
        }
        
        return rankCell
    }
    
}

