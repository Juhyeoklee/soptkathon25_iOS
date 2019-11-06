//
//  LoginVC.swift
//  sopkathon_iOS
//
//  Created by 이주혁 on 2019/11/05.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet var loginLbl: UILabel!
    @IBOutlet var idTxtField: UITextField!
    @IBOutlet var pwTxtField: UITextField!
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var idBarLbl: UILabel!
    @IBOutlet var pwBarLbl: UILabel!
    
    @IBOutlet var stackViewCenterY: NSLayoutConstraint!
    @IBOutlet var logoImg: UIImageView!
    var constraintY : CGFloat = 0
    var userList: [UserData] = [UserData(user: "주혁",candyCount: 10),
                                   UserData(user: "가인",candyCount: 9),
                                   UserData(user: "미정",candyCount: 8),
                                   UserData(user: "진오",candyCount: 7),
                                   UserData(user: "이시연",candyCount: 6),
                                   UserData(user: "재은",candyCount: 5),
                                   UserData(user: "양시연", candyCount: 4),
                                   UserData(user: "태진",candyCount: 3),
                                   UserData(user: "수민",candyCount: 2)]
    
    override func viewDidLoad() {
        
        setLayout()
        self.constraintY = stackViewCenterY.constant
        
        super.viewDidLoad()
        initGestureRecognizer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }
    
    func setLayout(){
        idTxtField.attributedPlaceholder = NSAttributedString(string: "ID", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        pwTxtField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    @IBAction func doLogin(){
        
        for user in userList{
            if self.idTxtField.text == user.user {
                let storyboard : UIStoryboard = UIStoryboard(name: "Start", bundle: Bundle.main)
                if let main = storyboard.instantiateViewController(withIdentifier: "MainVC") as? MainVC {
                    main.userName = self.idTxtField.text ?? "default"
                    
                    self.present(main, animated: true)
                }
            }
        }
        simpleAlert(title: "로그인 실패", message: "일치하는 아이디가 없습니다.")
        
        
    }
    
    
    func simpleAlert(title: String, message: String, type: Int? = 0){
           
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           
           var ok: UIAlertAction
           if type == 0{
               ok = UIAlertAction(title: "확인", style: .cancel)
           }else{
               ok = UIAlertAction(title: title, style: .cancel, handler: {action in
                   self.dismiss(animated: true)
               })
               
           }
           alert.addAction(ok)
           
           self.present(alert, animated: true)
       }
}

extension LoginVC: UIGestureRecognizerDelegate {
    
    func initGestureRecognizer() {
        let textFieldTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextField(_:)))
        textFieldTap.delegate = self
        view.addGestureRecognizer(textFieldTap)
    }
    
    // 다른 위치 탭했을 때 키보드 없어지는 코드
    @objc func handleTapTextField(_ sender: UITapGestureRecognizer) {
        self.idTxtField.resignFirstResponder()
        self.pwTxtField.resignFirstResponder()
    }
    
    
    func gestureRecognizer(_ gestrueRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: idTxtField))! || (touch.view?.isDescendant(of: pwTxtField))! {
            
            return false
        }
        return true
    }
    
    // keyboard가 보여질 때 어떤 동작을 수행
    @objc func keyboardWillShow(_ notification: NSNotification) {
        
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else { return }
        
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardHeight: CGFloat // 키보드의 높이
        
        if #available(iOS 11.0, *) {
            keyboardHeight = keyboardFrame.cgRectValue.height - self.view.safeAreaInsets.bottom
        } else {
            keyboardHeight = keyboardFrame.cgRectValue.height
        }
        
        // animation 함수
        // 최종 결과물 보여줄 상태만 선언해주면 애니메이션은 알아서
        // duration은 간격
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            
            self.logoImg.alpha = 0
            
            // +로 갈수록 y값이 내려가고 -로 갈수록 y값이 올라간다.
            self.stackViewCenterY.constant = +keyboardHeight/2
        })
        
        self.view.layoutIfNeeded()
    }
    
    // keyboard가 사라질 때 어떤 동작을 수행
    @objc func keyboardWillHide(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            
            // 원래대로 돌아가도록
            self.logoImg.alpha = 1.0
            self.stackViewCenterY.constant = self.constraintY
        })
        
        self.view.layoutIfNeeded()
    }
    
    
    // observer
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

