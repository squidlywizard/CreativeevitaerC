//
//  DrawingView.swift
//  CreativeevitaerC
//
//  Created by Denna, Zachary on 11/1/18.
//  Copyright © 2018 Denna, Zachary. All rights reserved.
//

import UIKit

public class DrawingView: UIView
{

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    public override func draw(_ rect: CGRect) -> Void
    {
        // Drawing code
    }
 
    private func createStickFigure() -> UIBezierPath
    {
        let figure : UIBezierPath = UIBezierPath()
        
        return figure;
    }

}
