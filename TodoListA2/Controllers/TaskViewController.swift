//
//  TaskViewController.swift
//  TodoListA2
//
//  Created by Gerson Isaias on 26/02/21.
//

import UIKit

class TaskViewController: UIViewController {

    @IBOutlet weak var tfNameTask: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: Any) {
        if tfNameTask.hasText {
            let task = Task(tfNameTask.text!)
            task.add()
            print(Task.all())
            self.navigationController?.popViewController(animated: true)
        }else{
            print("El campo nombre esta vacio")
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
