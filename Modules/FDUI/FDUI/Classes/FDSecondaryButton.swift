//
//  FDSecondaryButton.swift
//  FDUI
//
//  Created by Mochamad Dandi on 11/07/22.
//

import UIKit

public class FDSecondaryButton: UIButton {
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
        layer.masksToBounds = true
        backgroundColor = UIColor.clear
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold)
        
        update()
    }
    
    func update() {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = 1
        layer.borderColor = color.cgColor
        setTitleColor(color, for: UIControl.State.normal)
    }

}
