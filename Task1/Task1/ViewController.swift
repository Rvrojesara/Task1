//
//  ViewController.swift
//  Task1
//
//  Created by admin on 03/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    var jokearr:[jokemodel]=[]

    @IBOutlet weak var tableview: UITableView!
    
    var seletedJokes: jokemodel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        callJokeApi()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
//    call api data
    func callJokeApi(){
        
        ApiManager().fetchJokes{ result in
            switch result {
                
            case .success(let data):
                self.jokearr.append(contentsOf: data)
                self.tableview.reloadData()
                print(self.jokearr)
                
                
            case .failure(let failure):
                debugPrint("something went wrong in calling API\(failure)")
                
            }
        }
    }


    
}
extension ViewController:UITableViewDataSource, UITableViewDelegate {
    func setup(){
        tableview.dataSource=self
        tableview.delegate=self
        tableview.register(UINib(nibName: "DetailCell", bundle: nil), forCellReuseIdentifier: "jokecell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokearr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "jokecell", for:indexPath) as! DetailCell
        cell.punchlinelable.text=jokearr[indexPath.row].punchline
        cell.setuplable.text=jokearr[indexPath.row].setup
        cell.typelable.text=jokearr[indexPath.row].type
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    
    
//    for swipe delete
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete=UIContextualAction(style: .destructive, title: "delete"){action,source,completion in
            self.jokearr.remove(at: indexPath.row)
            self.tableview.reloadData()
        }
        let swipconfigure=UISwipeActionsConfiguration(actions: [delete])
        swipconfigure.performsFirstActionWithFullSwipe=false
        return swipconfigure
    }
    
    
    
    
    
//    for detail page
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        seletedJokes = jokearr[indexPath.row]
        performSegue(withIdentifier: "GoToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToDetail"
        {
            if let detail = segue.destination as? DetailVC{
                detail.currentJokes = seletedJokes
            }
        }
    }
    
    
}
