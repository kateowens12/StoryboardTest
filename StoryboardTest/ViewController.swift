//
//  ViewController.swift
//  StoryboardTest
//
//  Created by Kate Owens on 7/6/22.
//

import UIKit

class ViewController: UIViewController {
    let text = "Text"
    @IBOutlet var button: UIButton?
    @IBOutlet var label: UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? UINavigationController, let controller = navigationController?.viewControllers.first as? TableController {
            controller.title = text
        }
    }
}

class TableController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView?

    override func viewDidLoad() {
        tableView?.delegate = self
        tableView?.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        8
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = "should be visible"

        return cell
    }
}
