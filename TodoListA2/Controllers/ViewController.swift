//
//  ViewController.swift
//  TodoListA2
//
//  Created by Gerson Isaias on 19/02/21.
//

import UIKit

class ViewController: UIViewController,TaskDelegate {

    @IBOutlet weak var scListTasks: UIScrollView!
    @IBOutlet weak var svListTasks: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func willAdd(_ sender: Any) {
        self.performSegue(withIdentifier: "sgTaskForm", sender: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.fillStack()
    }
    
    func fillStack(){
        let height = 100
        let spacing = 10
        var positionY = 0
        self.removeFromStack()
        Task.all().reversed().filter({ $0.done == false }).forEach { (task) in
            let itemTask = UIItemTask(frame: CGRect(x: 0, y: positionY, width: Int(self.svListTasks.frame.width), height: height))
            itemTask.build(task)
            itemTask._delegate = self
            self.svListTasks.addSubview(itemTask)
            positionY += height + spacing
        }
        
        self.scListTasks.contentSize.height = CGFloat(Task.all().count * (height + spacing))
    }
    
    func removeFromStack(){
        self.svListTasks.subviews.forEach { (item) in
            item.removeFromSuperview()
        }
    }
    
    func onChangeDone() {
        self.fillStack()
    }
}

