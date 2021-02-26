//
//  UIItemTask.swift
//  TodoListA2
//
//  Created by Gerson Isaias on 26/02/21.
//

import UIKit

class UIItemTask: UIView {

    public private(set) var task:Task?
    
    public private(set) var textLabel:UILabel?
    public private(set) var checkbox:CheckBox?
    
    public var _delegate:TaskDelegate?
    
    func build(_ task:Task){
        self.textLabel = UILabel(frame: CGRect(x: 15, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        self.textLabel?.text = task.name.uppercased()
        self.textLabel?.font = UIFont(name: "Arial Bold", size: 15.0)
        self.textLabel?.textColor = UIColor.link
        
        self.checkbox = CheckBox.init()
        self.checkbox?.frame = CGRect(x: textLabel!.frame.size.width-60, y: 25, width: 40, height: 40)
        self.checkbox?.tag = task.id
        self.checkbox?.style = .tick
        self.checkbox?.borderStyle = .roundedSquare(radius: 5)
        self.checkbox?.addTarget(self, action: #selector(onCheckBoxValueChange(_:)), for: .valueChanged)
        self.addSubview(textLabel!)
        self.addSubview(checkbox!)
    }
    
    @objc func onCheckBoxValueChange(_ sender:CheckBox) {
        let task:Task? = Task.all().filter({ $0.id == sender.tag }).first
        task?.wasDone()
        _delegate?.onChangeDone()
    }

}
