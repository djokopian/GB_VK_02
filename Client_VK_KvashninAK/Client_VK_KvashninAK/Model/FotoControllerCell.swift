//
//  FotoControllerCell.swift
//  Client_VK_KvashninAK
//
//  Created by Alexandr Kvashnin on 25.07.2020.
//  Copyright © 2020 Alexandr Kvashnin. All rights reserved.
//

import UIKit

class FotoControllerCell: UIView {

    var friendImage = [
        "person",
        "person.fill",
        "person.circle",
        "person.circle.fill",
        "person.icloud",
        "person.2.fill"
    ]
    
    private var fotoImage0 = UIImageView()
    private var fotoImage1 = UIImageView()
    private var fotoImage2 = UIImageView()
    private var fotoImagetmp = UIImageView()
    private var widthTemp = CGFloat()
    
    func configure() {
        
        
        let swipe = UISwipeGestureRecognizer(target: self, action:  #selector(onSwipe(sender:)))
        addGestureRecognizer(swipe)
        swipe.direction = .right
        let swipe2 = UISwipeGestureRecognizer(target: self, action:  #selector(onSwipe2(sender:)))
        addGestureRecognizer(swipe2)
        swipe2.direction = .left
        
        self.isUserInteractionEnabled = true
        
        
        fotoImage0 = UIImageView(frame: CGRect(x: -self.bounds.size.width, y: self.bounds.size.height/2 - self.bounds.size.width/2, width: self.layer.bounds.size.width, height: self.bounds.size.width))
        fotoImage1 = UIImageView(frame: CGRect(x: 0, y: self.bounds.size.height/2 - self.bounds.size.width/2, width: self.bounds.size.width, height: self.bounds.size.width))
        fotoImage2 = UIImageView(frame: CGRect(x: self.bounds.size.width, y: self.bounds.size.height/2 - self.bounds.size.width/2, width: self.bounds.size.width, height: self.bounds.size.width))
        
        widthTemp = self.bounds.size.width
        
        fotoImage0.image = UIImage(systemName: friendImage[0])
        fotoImage1.image = UIImage(systemName: friendImage[1])
        fotoImage2.image = UIImage(systemName: friendImage[2])

        
        self.addSubview(fotoImage0)
        self.addSubview(fotoImage1)
        self.addSubview(fotoImage2)
    }
    
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }

    func animateLeft() {
        
        UIView.animateKeyframes(withDuration: 0.7,
                                delay: 0,
                          animations: {
                            
                            UIView.addKeyframe(withRelativeStartTime: 0,
                                relativeDuration: 0.15,
                                animations: {
                                    self.fotoImage1.layer.bounds.size.height = 0.65*self.widthTemp
                                    self.fotoImage1.layer.bounds.size.width = 0.65*self.widthTemp
                                })
                            
                            UIView.addKeyframe(withRelativeStartTime: 0.15,
                            relativeDuration: 0.55,
                            animations: {
                                self.fotoImage1.alpha = 0
                                self.fotoImage1.center.x += self.widthTemp
                                self.fotoImage0.center.x += self.widthTemp
                            })
                            
        }, completion: { _ in
            self.fotoImage1.alpha = 1
            self.fotoImage0.alpha = 1
            self.fotoImage2.alpha = 1
            self.fotoImage1.layer.bounds.size.height = self.widthTemp
            self.fotoImage1.layer.bounds.size.width = self.widthTemp
            self.fotoImage1.center.x -= self.widthTemp
            self.fotoImage0.center.x -= self.widthTemp
            self.fotoImagetmp.image = self.fotoImage2.image
            self.fotoImage2.image = self.fotoImage1.image
            self.fotoImage1.image = self.fotoImage0.image
            self.fotoImage0.image = self.fotoImagetmp.image
        })
        
    }
      

    func animateRight() {
        
        UIView.animateKeyframes(withDuration: 0.7,
                                delay: 0,
                          animations: {
                            
                            UIView.addKeyframe(withRelativeStartTime: 0,
                                relativeDuration: 0.15,
                                animations: {
                                    self.fotoImage1.layer.bounds.size.height = 0.65*self.widthTemp
                                    self.fotoImage1.layer.bounds.size.width = 0.65*self.widthTemp
                                })
                            
                            UIView.addKeyframe(withRelativeStartTime: 0.15,
                            relativeDuration: 0.55,
                            animations: {
                                self.fotoImage1.alpha = 0
                                self.fotoImage1.center.x -= self.widthTemp
                                self.fotoImage2.center.x -= self.widthTemp
                            })
                            
        }, completion: { _ in
            self.fotoImage1.alpha = 1
            self.fotoImage0.alpha = 1
            self.fotoImage2.alpha = 1
            self.fotoImage1.layer.bounds.size.height = self.widthTemp
            self.fotoImage1.layer.bounds.size.width = self.widthTemp
            self.fotoImage1.center.x += self.widthTemp
            self.fotoImage2.center.x += self.widthTemp
            self.fotoImagetmp.image = self.fotoImage0.image
            self.fotoImage0.image = self.fotoImage1.image
            self.fotoImage1.image = self.fotoImage2.image
            self.fotoImage2.image = self.fotoImagetmp.image
        })
        
    }
    
    @objc func onSwipe (sender: UISwipeGestureRecognizer) {
            animateLeft()
    }
    
    @objc func onSwipe2 (sender: UISwipeGestureRecognizer) {
            animateRight()
    }
    
}
