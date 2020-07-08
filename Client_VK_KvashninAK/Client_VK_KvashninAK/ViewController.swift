//
//  ViewController.swift
//  Client_VK_KvashninAK
//
//  Created by Alexandr Kvashnin on 03.07.2020.
//  Copyright © 2020 Alexandr Kvashnin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: UITextField!
    
    
    //gодписываемся на события клавиатуры
    override func viewWillAppear(_ animated: Bool) {
         
        super.viewWillAppear(animated)
         
         NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
         
         NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
         
        // передаем нажатие по экрану для скрытия клавиатуры
         let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
         scrollView.addGestureRecognizer(tapGesture)
     }
     
    // при показе клавиатуры меняем размер скролвью на размер клавиатуры
     @objc func keyboardWillShown(notification: Notification) {
         
         let info = notification.userInfo! as NSDictionary
         let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
         let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0)
         
         scrollView.contentInset = contentInsets
         scrollView.scrollIndicatorInsets = contentInsets
     }
     
    //пр скрытии клавиатуры возвращаем назад размер скроллвью
     @objc func keyboardWillHide(notification: Notification) {
         scrollView.contentInset = UIEdgeInsets.zero
         scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
     }
     
    //отписываемся от оповещений о клавиатуре
     override func viewWillDisappear(_ animated: Bool) {
         
        super.viewWillDisappear(animated)
         
         NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
         NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
     }
     
    
    //функция скрытия клавиатуры при касании экрана
     @objc func hideKeyboard() {
         scrollView.endEditing(true)
     }
     

    //действие пр нажатии на кнопку Энтер
    @IBAction func enterButtonPress(_ sender: Any) {
        
        guard let lgn = login.text else { return }
        guard let psw = password.text else { return }
           
        if lgn == "123", psw == "123" {
            print("Логин/пароль верен")
        }
        else {
            print("Неверные логин/пароль")
        }
    }
}
    
    

