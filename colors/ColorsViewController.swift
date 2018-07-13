//
//  ColorsViewController.swift
//  colors
//
//  Created by Jasmine Tan on 6/30/18.
//  Copyright © 2018 Jasmine Tan. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var colorsTableView: UITableView!
    //var colors = ["red", "orange", "yellow", "green", "blue", "purple", "brown"]
    var colors = [Color(name: "Red", uiColor: UIColor.red),
    Color(name: "Orange", uiColor: UIColor.orange),
    Color(name: "Yellow", uiColor: UIColor.yellow),
    Color(name: "Green", uiColor: UIColor.green),
    Color(name: "Blue", uiColor: UIColor.blue),
    Color(name: "Purple", uiColor: UIColor.purple)]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Colors"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        cell.textLabel?.text = colors[indexPath.row].name
        cell.backgroundColor = colors[indexPath.row].uiColor
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ColorDetailViewController, let row = colorsTableView.indexPathForSelectedRow?.row{
            destination.color = colors[row]
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
