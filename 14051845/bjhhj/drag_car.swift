//
//  drag_car.swift
//  bjhhj
//
//  Created by abdulla abdulla on 4/7/18.
//  Copyright © 2018 abdulla abdulla. All rights reserved.
//

import UIKit

class drag_car: UIImageView {
    
    var myDelegate: subviewDelegate?
    
    var startLocation: CGPoint?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        startLocation = touches.first?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let currentLocation = touches.first?.location(in: self)
        let dx = currentLocation!.x - startLocation!.x
        let dy = currentLocation!.y - startLocation!.y
        
        self.center = CGPoint(x:self.center.x+dx, y:self.center.y+dy)
        
        self.myDelegate?.changeSomething()
    }
}
