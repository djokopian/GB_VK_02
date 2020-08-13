//
//  animationNavController.swift
//  Client_VK_KvashninAK
//
//  Created by Alexandr Kvashnin on 31.07.2020.
//  Copyright © 2020 Alexandr Kvashnin. All rights reserved.
//

import UIKit


final class CustomPushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let source = transitionContext.viewController(forKey: .from) else { return }
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        let π : CGFloat = 3.14159265359
        
        transitionContext.containerView.addSubview(destination.view)
        destination.view.frame = source.view.frame
        destination.view.layer.anchorPoint = CGPoint(x:0, y:0)
        destination.view.layer.position = CGPoint(x:0, y:0)
        let scale = CGAffineTransform(scaleX: 1.0, y: 1.0)
        let rotate = CGAffineTransform(rotationAngle: -π/2)
        destination.view.transform = rotate.concatenating(scale)
        
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0,
                                options: .calculationModePaced,
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                    relativeDuration: 1.0,
                                    animations: {
                                        let π : CGFloat = 3.14159265359
                                        let rotateOffScreen = CGAffineTransform(rotationAngle: π/2)

                                        source.view.layer.anchorPoint = CGPoint(x:0, y:0)
                                        source.view.layer.position = CGPoint(x:0, y:0)

                                        let scale = CGAffineTransform(scaleX: 1.0, y: 1.0)
                                        source.view.transform = rotateOffScreen.concatenating(scale)
                                        
                                    })
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0.2,
                                                relativeDuration: 1.0,
                                                animations: {
                                                destination.view.transform = .identity
                                    })
        }) { finished in
            if finished && !transitionContext.transitionWasCancelled {
                source.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }
}


final class CustomPopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let source = transitionContext.viewController(forKey: .from) else { return }
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        let π : CGFloat = 3.14159265359
        
         transitionContext.containerView.addSubview(destination.view)
            transitionContext.containerView.sendSubviewToBack(destination.view)
            
            destination.view.layer.anchorPoint = CGPoint(x:0, y:0)
            destination.view.layer.position = CGPoint(x:0, y:0)
            let scale = CGAffineTransform(scaleX: 1.0, y: 1.0)
            let rotate = CGAffineTransform(rotationAngle: π/2)
            destination.view.transform = rotate.concatenating(scale)
            
            UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                    delay: 0,
                                    options: .calculationModePaced,
                                    animations: {
                                        UIView.addKeyframe(withRelativeStartTime: 0,
                                                           relativeDuration: 0.1,
                                                           animations: {
                                                              let π : CGFloat = 3.14159265359
                                                               let rotateOffScreen = CGAffineTransform(rotationAngle: -π/2)

                                                               source.view.layer.anchorPoint = CGPoint(x:0, y:0)
                                                               source.view.layer.position = CGPoint(x:0, y:0)

                                                               let scale = CGAffineTransform(scaleX: 1.0, y: 1.0)
                                                               source.view.transform = rotateOffScreen.concatenating(scale)
                                        })

                                        UIView.addKeyframe(withRelativeStartTime: 0.2,
                                                           relativeDuration: 1.0,
                                                           animations: {
                                                               destination.view.transform = .identity
                                        })
                                        
                                        
            }) { finished in
                if finished && !transitionContext.transitionWasCancelled {
                    source.removeFromParent()
                } else if transitionContext.transitionWasCancelled {
                    destination.view.transform = .identity
                }
                transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
            }
        }
}



class CustomInteractiveTransition: UIPercentDrivenInteractiveTransition {
    
    var viewController: UIViewController? {
        didSet {
            let recognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleScreenEdgeGesture(_:)))
            recognizer.edges = [.left]
            viewController?.view.addGestureRecognizer(recognizer)
        }
    }
    
    var hasStarted: Bool = false
    var shouldFinish: Bool = false

    @objc func handleScreenEdgeGesture(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        
        print("ЗАШЕЛ")
        switch recognizer.state {
        case .began:
            self.hasStarted = true
            self.viewController?.navigationController?.popViewController(animated: true)
        case .changed:
            let translation = recognizer.translation(in: recognizer.view)
            let relativeTranslation = translation.x / (recognizer.view?.bounds.width ?? 1)
            let progress = max(0, min(1, relativeTranslation))
            
            self.shouldFinish = progress > 0.33

            self.update(progress)
        case .ended:
            self.hasStarted = false
            self.shouldFinish ? self.finish() : self.cancel()
        case .cancelled:
            self.hasStarted = false
            self.cancel()
        default: return
        }
    }
    
}
