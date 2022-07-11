//
//  FDPrimaryButton.swift
//  FDUI
//
//  Created by Mochamad Dandi on 11/07/22.
//

import UIKit

@IBDesignable
public class FDPrimaryButton: UIButton {
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            update()
        }
    }
    
    @IBInspectable public var color: UIColor = UIColor(rgb: 0xFC6011) {
        didSet {
            update()
        }
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        setTitleColor(UIColor.white, for: UIControl.State.normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold)
        layer.masksToBounds = true
        
        update()
    }
    
    func update() {
        backgroundColor = color
        layer.cornerRadius = cornerRadius
    }
}
