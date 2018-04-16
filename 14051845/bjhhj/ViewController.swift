//
//  ViewController.swift
//  bjhhj
//
//  Created by abdulla abdulla on 4/7/18.
//  Copyright © 2018 abdulla abdulla. All rights reserved.
//

import UIKit

protocol subviewDelegate {
    func changeSomething()
}


class ViewController: UIViewController, subviewDelegate {
    
    func changeSomething() {
        collisionBehavior.addBoundary(withIdentifier: "barrier" as
            NSCopying, for: UIBezierPath(rect: carView0.frame))
    }
    
    var collisionBehavior: UICollisionBehavior!
    var dynamicAnimator: UIDynamicAnimator!
    var dynamicItemBehavior: UIDynamicItemBehavior!
    var dynamicBehavior: UIDynamicBehavior!
    
    @IBOutlet weak var roadImage: UIImageView!
    
    @IBOutlet weak var carView0: drag_car!
    
    var fallcars = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

   

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        carView0.myDelegate = self

        //road
        var imageArray: [UIImage]!
        imageArray = [UIImage(named: "road1.png")!,
                      UIImage(named: "road2.png")!,
                      UIImage(named: "road3.png")!,
                      UIImage(named: "road4.png")!,
                      UIImage(named: "road5.png")!,
                      UIImage(named: "road6.png")!,
                      UIImage(named: "road7.png")!,
                      UIImage(named: "road8.png")!,
                      UIImage(named: "road9.png")!,
                      UIImage(named: "road10.png")!,
                      UIImage(named: "road11.png")!,
                      UIImage(named: "road12.png")!,
                      UIImage(named: "road13.png")!,
                      UIImage(named: "road14.png")!,
                      UIImage(named: "road15.png")!,
                      UIImage(named: "road16.png")!,
                      UIImage(named: "road17.png")!,
                      UIImage(named: "road18.png")!,
                      UIImage(named: "road19.png")!,
                      UIImage(named: "road20.png")!,]
        roadImage.image = UIImage.animatedImage(with: imageArray, duration: 1)
        
        
        // Random Cars
        for obstacle in 0...19{
           let delay1 = Double(self.fallcars[obstacle])
            let delay = DispatchTime.now() + delay1
            DispatchQueue.main.asyncAfter(deadline: delay) {
                let carColor = arc4random_uniform(6)
                var RandomCar = UIImageView(image: nil)
                switch carColor{
                case 1 : RandomCar.image = UIImage(named: "car1.png")
                case 2:  RandomCar.image = UIImage(named: "car2.png")
                case 3 : RandomCar.image = UIImage(named: "car3.png")
                case 4 : RandomCar.image = UIImage(named: "car4.png")
                case 5 : RandomCar.image = UIImage(named: "car5.png")
                    
                default: RandomCar.image = UIImage(named: "car1.png")
                }
                
                let randomNx2 = arc4random_uniform(201) + 40
                RandomCar.frame = CGRect(x: Int(randomNx2), y: 0, width: 30, height: 50)
                self.view.addSubview(RandomCar)
                
                self.view.bringSubview(toFront: RandomCar)
                
                
                
                //fall
                let randomN2 = arc4random_uniform(75) + 200
                let randomN3 = arc4random_uniform(75) + 200
                
                self.dynamicItemBehavior.addItem(RandomCar)
                self.dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
                self.dynamicItemBehavior = UIDynamicItemBehavior(items: [RandomCar])
                self.dynamicItemBehavior.addLinearVelocity(CGPoint(x: 0, y: 500), for: RandomCar)
                
                
                //Collision
                self.dynamicAnimator.addBehavior(self.dynamicItemBehavior)
                self.collisionBehavior = UICollisionBehavior(items: [RandomCar])
                self.collisionBehavior.translatesReferenceBoundsIntoBoundary = false
                self.dynamicAnimator.addBehavior(self.collisionBehavior)
                self.dynamicItemBehavior.elasticity = 0-1
                }
            
        
            dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
            
            dynamicItemBehavior = UIDynamicItemBehavior(items: [])
       
            
            
            
            dynamicAnimator.addBehavior(dynamicItemBehavior)
            
            
            
            collisionBehavior = UICollisionBehavior(items: [])
            collisionBehavior.translatesReferenceBoundsIntoBoundary = false
            dynamicAnimator.addBehavior(collisionBehavior)
        
        
        
        }
        
    }
        
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

