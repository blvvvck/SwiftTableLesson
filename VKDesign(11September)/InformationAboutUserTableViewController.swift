//
//  InformationAboutUserTableViewController.swift
//  VKDesign(11September)
//
//  Created by BLVCK on 21/09/2017.
//  Copyright © 2017 blvvvck production. All rights reserved.
//

import UIKit

enum InformationViewModelItemType {
    case status
    case mainInfo
    case contacts
    case carier
    case education
    case gifts
    case moreInfo
}

protocol InformationViewModelItem {
    var type: InformationViewModelItemType { get }
    var sectionType: String { get }
    var rowCount: Int { get }
}

struct InformationViewModelStatusItem: InformationViewModelItem {
    var type: InformationViewModelItemType {
        return .status
    }
    
    var sectionType: String {
        return ""
    }
    
    var rowCount: Int{
        return 1
    }
    
    var status: String
}

struct MainInfo {
    var title: String
    var info: String
}

struct InformationViewModelMainInfoItem: InformationViewModelItem {
    var type: InformationViewModelItemType {
        return .mainInfo
    }
    
    var sectionType: String {
        return ""
    }
    
    var rowCount: Int{
        return mainInformations.count
    }
    
    var mainInformations: [MainInfo]
}

struct Contacts {
    var image: UIImage
    var contact: String
}

struct InformationViewModelContactsItem: InformationViewModelItem {
    var type: InformationViewModelItemType {
        return .contacts
    }
    
    var sectionType: String {
        return "КОНТАКТЫ"
    }
    
    var rowCount: Int {
        return contacts.count
    }
    
    var contacts: [Contacts]
}

struct InformationViewModelCarierItem: InformationViewModelItem {
    var type: InformationViewModelItemType {
        return .carier
    }
    
    var sectionType: String {
        return "КАРЬЕРА"
    }
    
    var rowCount: Int {
        return 1
    }
    
    var company: String
    var locationAndPeriod: String
    var position: String
}

struct EducationalEstablishments {
    var type: String
    var name: String
}

struct InformationViewModelEducationItem: InformationViewModelItem {
    var type: InformationViewModelItemType {
        return .education
    }
    
    var sectionType: String {
        return "ОБРАЗОВАНИЕ"
    }
    
    var rowCount: Int {
        return 2
    }
    
    var educationaEstablishments: [EducationalEstablishments]
}

struct InformationViewModelGiftsItem: InformationViewModelItem {
    var type: InformationViewModelItemType {
        return .gifts
    }
    
    var sectionType: String {
        return ""
    }
    
    var rowCount: Int {
        return 1
    }
    
    var giftNumbers: String
    
}

struct MoreInfo {
    var title: String
    var count: String
}

struct InformationViewModelMoreInfoItem: InformationViewModelItem {
    var type: InformationViewModelItemType {
        return .moreInfo
    }
    
    var sectionType: String {
        return ""
    }
    
    var rowCount: Int {
        return 3
    }
    
    var moreInformations: [MoreInfo]
}

class InformationAboutUserTableViewController: UITableViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    var items: [InformationViewModelItem] = []
    let mainInfoCellIdentifier = "mainInfoCell"
    let statusCellIdentifier = "statusCell"
    let contactsCellIdentifier = "contactCell"
    let carierCellIdentifier = "carierCell"
    let educationCellIdentifier = "educationCell"
    let giftsCellIdentifier = "giftsCell"
    let moreInfoCellIdentifier = "moreInfoCell"
    
    let statusArray = ["NAVI VPERED!!!", "VP TOP1", "DOMOIII"]
    let mainInfoTitleArray = ["День рождения", "Место работы", "Семейное положение", "Языки", "Родители"]
    let mainInfoSubtitleArry = [ ["21 июля 1998", "16 января 2000"], ["Apple", "Google"], ["Женат", "Есть подруга"], ["Русский, Испанский", "Английский, Итальянский"], ["Иван Иванов, Мария Иванова", "Петр Петров, Анна Петрова"] ]
    let contactArray = [ ["89536777391", "89005258501"], ["Киров", "Казань"], ["super_nagibator", "ios_NINJA"] ]
    let contactImageArray = [UIImage(named: "phoneContact")!, UIImage(named: "homeContact")!, UIImage(named: "vkContact")!]
    let carierCompanyArray = ["Apple", "Google",]
    let carierLocationAndPeriodArray = ["Cupertino, 2016-2017", "Kirov, 2000-2001"]
    let carierPositionArray = ["iOS Developer", "Java Developer"]
    let educationTypeArray = ["Вуз", "Школа"]
    let educationNameArray = [ ["КФУ", "ВятГУ", "MIT"], ["Школа №10", "ФизМат Лицей"] ]
    let giftsNumberArray = ["20 подарков", "21 подарок", "16 подарков"]
    let moreInfoTitleArray = ["Интересные страницы", "Заметки", "Документы"]
    let moreInfoCountArray = [["102 >", "131 >", "116 >"], ["321 >", "123 >"], ["401 >", "291 >"]]
    
    var name: String = ""
    var surname: String = ""
    var age: String = ""
    var location: String = ""
    var avatarFrom: UIImage = UIImage(named: "gift1")!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initStatus()
        initMainInfo()
        initContacts()
        initCarier()
        initEdicational()
        initGifts()
        initMoreInfo()
        profileFromMainView()
        
        self.refreshControl?.addTarget(self, action: #selector(InformationAboutUserTableViewController.handleRefresh(refreshControl:)), for: UIControlEvents.valueChanged)
        
        let nib = UINib(nibName: "StatusTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: statusCellIdentifier)
        
        let nib1 = UINib(nibName: "MainInfoTableViewCell", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: mainInfoCellIdentifier)
        
        let nib2 = UINib(nibName: "ContactsTableViewCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: contactsCellIdentifier)
        
        let nib3 = UINib(nibName: "CarierTableViewCell", bundle: nil)
        tableView.register(nib3, forCellReuseIdentifier: carierCellIdentifier)
        
        let nib4 = UINib(nibName: "EducationTableViewCell", bundle: nil)
        tableView.register(nib4, forCellReuseIdentifier: educationCellIdentifier)
        
        let nib5 = UINib(nibName: "GiftsTableViewCell", bundle: nil)
        tableView.register(nib5, forCellReuseIdentifier: giftsCellIdentifier)
        
        let nib6 = UINib(nibName: "MoreInfoTableViewCell", bundle: nil)
        tableView.register(nib6, forCellReuseIdentifier: moreInfoCellIdentifier)
    }
    
    func profileFromMainView() {
        nameLabel.text = name
        surnameLabel.text = surname
        ageLabel.text = age
        locationLabel.text = location
        avatar.image = avatarFrom
        ViewController().imageCorners(with: avatar)
        nameLabel.sizeToFit()
        surnameLabel.sizeToFit()
        ageLabel.sizeToFit()
        locationLabel.sizeToFit()
    }
    
    func handleRefresh(refreshControl: UIRefreshControl) {
        items.removeAll()
        initStatus()
        initMainInfo()
        initContacts()
        initCarier()
        initEdicational()
        initGifts()
        initMoreInfo()
        
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }

    func initStatus() {
        let status = InformationViewModelStatusItem(status: "\(statusArray[Int(arc4random_uniform(UInt32(statusArray.count)))])")
        items.append(status)
    }
    
    func initMainInfo() {
        var mainInformations = [MainInfo]()
        
        for i in 0 ..< 5 {
            let mainInfo = MainInfo(title: "\(mainInfoTitleArray[i])", info: "\(mainInfoSubtitleArry[i][Int(arc4random_uniform(UInt32(mainInfoSubtitleArry[i].count)))])")
            mainInformations.append(mainInfo)
        }
        
        items.append(InformationViewModelMainInfoItem(mainInformations: mainInformations))
    }
    
    func initContacts() {
        
        var contactsInformation = [Contacts]()
        
        for i in 0 ..< 3 {
            let contactInfo = Contacts(image: contactImageArray[i], contact: "\(contactArray[i][Int(arc4random_uniform(UInt32(contactArray[i].count)))])")
            contactsInformation.append(contactInfo)
        }
        items.append(InformationViewModelContactsItem(contacts: contactsInformation))
    }
    
    func initCarier() {
        let carierInfo = InformationViewModelCarierItem(company: "\(carierCompanyArray[Int(arc4random_uniform(UInt32(carierCompanyArray.count)))])", locationAndPeriod: "\(carierLocationAndPeriodArray[Int(arc4random_uniform(UInt32(carierLocationAndPeriodArray.count)))])", position: "\(carierPositionArray[Int(arc4random_uniform(UInt32(carierPositionArray.count)))])")
        items.append(carierInfo)
    }
    
    func initEdicational() {
        var educationInformation = [EducationalEstablishments]()
        for i in 0 ..< 2 {
            let educationalInfo = EducationalEstablishments(type: "\(educationTypeArray[i])", name: "\(educationNameArray[i][Int(arc4random_uniform(UInt32(educationNameArray.count)))])")
            educationInformation.append(educationalInfo)
        }
        items.append(InformationViewModelEducationItem(educationaEstablishments: educationInformation))
    }
    
    func initGifts() {
        let gifts = InformationViewModelGiftsItem(giftNumbers: "\(giftsNumberArray[Int(arc4random_uniform(UInt32(giftsNumberArray.count)))])")
        items.append(gifts)
    }
    
    func initMoreInfo() {
        var moreInformation = [MoreInfo]()
        
        for i in 0 ..< 3 {
            let moreInfo = MoreInfo(title: "\(moreInfoTitleArray[i])", count: "\(moreInfoCountArray[i][Int(arc4random_uniform(UInt32(moreInfoCountArray[i].count)))])" )
            moreInformation.append(moreInfo)
        }
        items.append(InformationViewModelMoreInfoItem(moreInformations: moreInformation))
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return items.count
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items[section].rowCount
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = items[indexPath.section]
        switch item.type {
        case .status:
            let cell = tableView.dequeueReusableCell(withIdentifier: statusCellIdentifier, for: indexPath) as! StatusTableViewCell
            cell.prepateCell(with: item as! InformationViewModelStatusItem)
            return cell
            
        case .mainInfo:
            let cell = tableView.dequeueReusableCell(withIdentifier: mainInfoCellIdentifier, for: indexPath) as! MainInfoTableViewCell
            let mainInfoItem = item as! InformationViewModelMainInfoItem
            cell.prepateCell(with: mainInfoItem.mainInformations[indexPath.row])
            return cell
            
        case .contacts:
            let cell = tableView.dequeueReusableCell(withIdentifier: contactsCellIdentifier, for: indexPath) as! ContactsTableViewCell
            let contactInfoItem = item as! InformationViewModelContactsItem
            cell.prepareCell(with: contactInfoItem.contacts[indexPath.row])
            return cell
            
        case .carier:
            let cell = tableView.dequeueReusableCell(withIdentifier: carierCellIdentifier, for: indexPath) as! CarierTableViewCell
            cell.prepareCell(with: item as! InformationViewModelCarierItem)

            return cell
            
        case .education:
            let cell = tableView.dequeueReusableCell(withIdentifier: educationCellIdentifier, for: indexPath) as! EducationTableViewCell
            let educationInfoItem = item as! InformationViewModelEducationItem
            cell.prepareCell(with: educationInfoItem.educationaEstablishments[indexPath.row])
            return cell
            
        case .gifts:
            let cell = tableView.dequeueReusableCell(withIdentifier: giftsCellIdentifier, for: indexPath) as! GiftsTableViewCell
            cell.prepareCell(with: item as! InformationViewModelGiftsItem)
            return cell
            
        case .moreInfo:
            let cell = tableView.dequeueReusableCell(withIdentifier: moreInfoCellIdentifier, for: indexPath) as! MoreInfoTableViewCell
            let moreInfoItem = item as! InformationViewModelMoreInfoItem
            cell.prepareCell(with: moreInfoItem.moreInformations[indexPath.row])
            return cell
                        
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return items[section].sectionType
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = items[indexPath.section]
        switch item.type {
        case .contacts:
            return 40
        
        case .carier:
            return 78
            
        case .mainInfo:
            return 49
            
        case .gifts:
            return 122
            
        default:
            return 44
        }
    }
}
