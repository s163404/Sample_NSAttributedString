//
//  LoggingSettingViewController.swift
//  Sample_NSAttributedString
//
//  Created by 冨田康介 on 2021/10/20.
//

import UIKit

class LoggingSettingViewController: UIViewController {

    var label = UILabel()
    var button = UIButton()
    var tableView = UITableView(frame: .zero, style: .grouped)
    
    let horizontalMargin: CGFloat = 32.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        label.text = "Lorem Ipsumは、印刷・組版業界のダミーテキストです。Lorem Ipsumは、1500年代に無名の印刷業者が活字見本帳を作るために、活字の入ったギャレーをスクランブルして以来、業界の標準的なダミーテキストとなっています。このダミーテキストは、5世紀の時を経ただけでなく、電子活字への移行にも耐え、基本的に変化していません。1960年代には、Lorem Ipsumの文章を収録したLetrasetシートが発売されて人気を博し、最近ではAldus PageMakerなどのDTPソフトにLorem Ipsumのバージョンが収録されるようになりました。"
        label.numberOfLines = 0
        label.sizeToFit()
        label.lineBreakMode = .byWordWrapping
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.borderWidth = 0.5
        button.setTitle("プライバシーポリシー", for: .normal)
        button.setTitleColor(.link, for: .normal)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .white
        tableView.backgroundView?.backgroundColor = .systemPink
        
        view.addSubview(label)
        view.addSubview(button)
        view.addSubview(tableView)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: horizontalMargin),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -horizontalMargin),
            
            button.topAnchor.constraint(equalTo: label.bottomAnchor),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: horizontalMargin),
            button.heightAnchor.constraint(equalToConstant: 44),
            
            tableView.topAnchor.constraint(equalTo: button.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        ])
    }
    
}

// MEMO:- UITableView のデリケートメソッド
extension LoggingSettingViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        // 選択肢UIと設定完了のセクション２つぶん
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                cell.textLabel?.text = "ミケランジェロ・ブオナローティ"
            } else {
                cell.textLabel?.text = "ミケランジェロ・メリージ・ダ・カラヴァッジョ"
            }
            break
        case 1:
            cell.textLabel?.text = "確定"
            cell.textLabel?.textColor = .link
            break
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard let cell = tableView.cellForRow(at: indexPath) else {
            return
        }
        switch indexPath.section {
        case 0:
            cell.accessoryType = .checkmark

            let unselectedIndexPath = IndexPath(row: indexPath.row == 0 ? 1 : 0, section: 0)
            tableView.cellForRow(at: unselectedIndexPath)?.accessoryType = .none
            break
        default:
            break
        }
    }
}
