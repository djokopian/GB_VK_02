//
//  NewsController.swift
//  Client_VK_KvashninAK
//
//  Created by Alexandr Kvashnin on 23.07.2020.
//  Copyright © 2020 Alexandr Kvashnin. All rights reserved.
//

import UIKit

struct News {
    let date: String
    let name: String
    let avatar: UIImage?
    let text: String
    let foto: UIImage?
    let likeCount: Int
    let like: Bool
}


class NewsController: UIViewController, UITableViewDelegate  {
    
    @IBOutlet weak var tableView: UITableView!

    
    
    var newsArray = [News]()
    

        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView.dataSource = self
            
            tableView.rowHeight = UITableView.automaticDimension
            
            newsArray.append(News(date: "12/08/2020", name: "Александр Иванов", avatar: UIImage(systemName: "person") ?? nil, text: "Интересная новость о том как корабли бороздят просторы океана.", foto: UIImage(systemName: "person") ?? nil, likeCount: 13, like: true))
            
            newsArray.append(News(date: "12/07/2020", name: "Петр Сидоров", avatar: UIImage(systemName: "person.fill") ?? nil, text: "Бороздит борозда, ревет ревун, сует сучек. Интересная новость о том как корабли бороздят просторы океана.", foto: UIImage(systemName: "person") ?? nil, likeCount: 13, like: true))
            
            newsArray.append(News(date: "12/06/2020", name: "Семен Слепаков", avatar: UIImage(systemName: "person.icloud") ?? nil, text: "От тополи копыт пыль по ветру бежит. Бежит да не выбежит. Бороздит борозда, ревет ревун, сует сучек. Интересная новость о том как корабли бороздят просторы океана.", foto: UIImage(systemName: "person") ?? nil, likeCount: 1, like: false))
            
            newsArray.append(News(date: "12/11/2020", name: "Иван Ургант", avatar: UIImage(systemName: "person") ?? nil, text: "Раз-два-три, раз-два-три-ра! От тополи копыт пыль по ветру бежит. Бежит да не выбежит. Бороздит борозда, ревет ревун, сует сучек. Интересная новость о том как корабли бороздят просторы океана.", foto: UIImage(systemName: "person") ?? nil, likeCount: 6, like: true))
            
            newsArray.append(News(date: "12/12/2020", name: "Георгий Победоносец", avatar: UIImage(systemName: "person.icloud") ?? nil, text: "Раз-два-три, раз-два-три-ра! От тополи копыт пыль по ветру бежит. Бежит да не выбежит. Бороздит борозда, ревет ревун, сует сучек. Интересная новость о том как корабли бороздят просторы океана.Раз-два-три, раз-два-три-ра! От тополи копыт пыль по ветру бежит. Бежит да не выбежит. Бороздит борозда, ревет ревун, сует сучек. Интересная новость о том как корабли бороздят просторы океана.", foto: UIImage(systemName: "person") ?? nil, likeCount: 131, like: false))
            
            newsArray.append(News(date: "12/01/2020", name: "Джонатан Свердлов", avatar: UIImage(systemName: "person.fill") ?? nil, text: "Раз-два-три, раз-два-три-ра! От тополи копыт пыль по ветру бежит. Бежит да не выбежит. Бороздит борозда, ревет ревун, сует сучек. Интересная новость о том как корабли бороздят просторы океана.Раз-два-три, раз-два-три-ра! От тополи копыт пыль по ветру бежит. Бежит да не выбежит. Бороздит борозда, ревет ревун, сует сучек. Интересная новость о том как корабли бороздят просторы океана.Раз-два-три, раз-два-три-ра! От тополи копыт пыль по ветру бежит. Бежит да не выбежит. Бороздит борозда, ревет ревун, сует сучек. Интересная новость о том как корабли бороздят просторы океана.", foto: UIImage(systemName: "person") ?? nil, likeCount: 3113, like: false))
        }

}


extension NewsController: UITableViewDataSource {
       
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return newsArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as? NewsCell else { fatalError() }
            
            cell.nameLabel.text = newsArray[indexPath.row].name
            
            cell.avatarImage.image = newsArray[indexPath.row].avatar
            cell.newsDate.text = newsArray[indexPath.row].date
            
            cell.newsText.text = newsArray[indexPath.row].text
            
            cell.fotoImage.image = newsArray[indexPath.row].foto
            
            cell.likeCount.text = String(newsArray[indexPath.row].likeCount)
            
            cell.likeCountInt = newsArray[indexPath.row].likeCount
            
            cell.likeOn = newsArray[indexPath.row].like
            
            cell.configure()
            
            //cell.footerView.alpha = 0.3
            
            let foto = UIImageView()
            foto.image = UIImage(systemName: "person")
            foto.frame = .init(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.width)
            

            
            
            
            return cell
        }
        
 
    
    
}
