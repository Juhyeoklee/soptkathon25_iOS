//
//  MainVC.swift
//  sopkathon_iOS
//
//  Created by TaeJin Oh on 2019/11/03.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var candy_Num: UILabel!
    @IBOutlet weak var num: UILabel!
    @IBOutlet weak var user_Rank: UILabel!
    @IBOutlet weak var user_Num: UILabel!
    
    @IBOutlet var rankBtn: UIButton!
    var userName: String?
    
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
    @IBAction func rankBtnClick(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Ranking", bundle: Bundle.main)
        if let rank = storyboard.instantiateViewController(identifier: "RankVC") as? RankVC {
            rank.userName = self.userName
            self.present(rank, animated: true)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! RankVC
        vc.userNameLbl.text = userName
    }
    
}
