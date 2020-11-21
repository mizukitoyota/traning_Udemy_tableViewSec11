//
//  ViewController.swift
//  tableViewSec11
//
//  Created by Training on 2020/11/20.
//  Copyright © 2020 training. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    @IBOutlet weak var textFiled: UITextField!
    
    //テーブルビュー、セルが上に乗る
    @IBOutlet weak var tableView: UITableView!
    
    var textArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self
        textFiled.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //？歩かないかわからない
        navigationController?.isNavigationBarHidden = true
        
    }
    //二番目セクション内セルの数確認
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
       }
    //一番目セクション数確認
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //3番目セル構築
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath)
        
        //UITableViewCell この中にセレクションスタイルがある　ハイライトがなくなる
        cell.selectionStyle = .none
        //セルのrow番目をテキストラベルに反映
        
        cell.textLabel?.text = textArray[indexPath.row]
        cell.imageView!.image = UIImage( named: "checkImage")
        
        return cell
        
       }
    //セルタップ後
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //タップした時にその配列の番号の中身を取り出して渡す
        let nextVC = storyboard?.instantiateViewController(identifier: "next") as! NextViewController
        nextVC.todoString = textArray[indexPath.row]
        navigationController?.pushViewController(nextVC, animated: true)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //画面の高さ６分割
        return view.frame.size.height/6
    }
    //キーボードリターンキー
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textArray.append(textFiled.text!)
        textField.resignFirstResponder()
        textField.text = ""
        //１、２、３番を再度行う
        tableView.reloadData()
        
        return true
    }
    
}

