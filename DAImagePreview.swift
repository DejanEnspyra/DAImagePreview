//
//  DAImagePreview.swift
//  TestSwiftProject
//
//  Created by Born2invest on 24/06/16.
//  Copyright © 2016 TheAppSpace. All rights reserved.
//

import UIKit

class DAImagePreview: UIView {
    var pickedImg: UIImage?
    var imageFrame: CGRect?
    var imgView: UIImageView?
    let animationTime = 0.4
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.7)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        if let r = imageFrame{
            imgView = UIImageView(frame: r)
            if let img = self.pickedImg {
                imgView!.image = img
            }
            imgView!.contentMode = .ScaleAspectFit
            self.addSubview(imgView!)
            
            UIView .animateWithDuration(animationTime, animations:{
                self.imgView!.frame = CGRectMake(0, rect.size.height/4.5, rect.size.width, rect.size.height/1.8)
            })
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        UIView .animateWithDuration(animationTime, animations:{
            self.imgView!.frame = self.imageFrame!
            self.imgView?.alpha = 0.4;
        }){ (finished) in
            self.removeFromSuperview()
        }

    }

}
