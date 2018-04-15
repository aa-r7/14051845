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
        collisionBehavior.removeAllBoundaries()

    }
    
    var collisionBehavior: UICollisionBehavior!
    var dynamicAnimator: UIDynamicAnimator!
    var dynamicItemBehavior: UIDynamicItemBehavior!
    
    @IBOutlet weak var roadImage: UIImageView!
    
    @IBOutlet weak var carView0: drag_car!
    
    override func viewDidLoad() {
        super.viewDidLoad()


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
        
        

            let randomNx = arc4random_uniform(201) + 40

            var carView1 = UIImageView(image: nil)
   
            carView1.frame = CGRect(x: Int(randomNx), y: 50, width: 30, height: 50)

            carView1.image = UIImage(named: "car1.png")
       
        self.view.addSubview(carView1)
        
        let randomNx1 = arc4random_uniform(201) + 40
        
        var carView2 = UIImageView(image: nil)
        
        carView2.frame = CGRect(x: Int(randomNx1), y: 50, width: 30, height: 50)
        
        carView2.image = UIImage(named: "car2.png")
        
        self.view.addSubview(carView2)
                
        
        

    
        let randomN = arc4random_uniform(75) + 200
        let randomN1 = arc4random_uniform(75) + 200

        
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        dynamicItemBehavior = UIDynamicItemBehavior(items: [carView1, carView2])
        self.dynamicItemBehavior.addLinearVelocity(CGPoint(x: 0, y: Int(randomN)), for: carView1)
        self.dynamicItemBehavior.addLinearVelocity(CGPoint(x: 0, y: Int(randomN1)), for: carView2)

        
        
        dynamicAnimator.addBehavior(dynamicItemBehavior)
        
    
        
        collisionBehavior = UICollisionBehavior(items: [carView1, carView2, carView0 ])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = false
        dynamicAnimator.addBehavior(collisionBehavior)
        
        collisionBehavior.removeAllBoundaries()

        }
        
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

