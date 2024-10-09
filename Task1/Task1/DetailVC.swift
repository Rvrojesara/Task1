//
//  DetailVC.swift
//  Task1
//
//  Created by admin on 04/10/24.
//

import UIKit

class DetailVC: UIViewController {

    
    @IBOutlet weak var typelbl: UILabel!
    
    @IBOutlet weak var punchlinelbl: UILabel!
    
    @IBOutlet weak var setuplbl: UILabel!
    
    var currentJokes : jokemodel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setdata()

        // Do any additional setup after loading the view.
    }
    
    func setdata(){
        setuplbl.text=currentJokes.setup
        typelbl.text=currentJokes.type
        punchlinelbl.text=currentJokes.punchline
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
