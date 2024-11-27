//
//  MenuCategoryView.swift
//  ChioskApp
//
//  Created on 2024-11-26.
//  메뉴 카테고리 표시 뷰 (+ Chiosk 글자 표시)
//
import UIKit
import SnapKit
import Then

class MenuCategoryView {
    
    //MARK: SegmentedControl 구현
    let segmentControl = UISegmentedControl(items: ["치킨", "사이드", "음료", "기타"]).then {
        $0.selectedSegmentIndex = 0
        $0.backgroundColor = .darkGray
        $0.selectedSegmentTintColor = .white
        $0.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)//Divider(칸막이)제거
    }
    // 클릭했을 때, 뷰를 변환되게 하는 메소드. 클릭 액션 메소드. 이것에 대한 로직을 이제 함수로 구현해야함
    // 초기 뷰를 선언해야함.
    
    
    //MARK: 상단 로고
    let logo = UILabel().then {
        $0.backgroundColor = .red
        $0.text = "CHIOSK"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.font = UIFont(name: "ProtestRiot-Regular", size: 36)
    }

    private let menuList = MenuList()
    
    let chickenMenu = MenuListView()
    let sidedishMenu = MenuListView()
    let drinkMenu = MenuListView()
    let etcMenu = MenuListView()
    
    //MARK: Palce holder
    let chickenView = UIView().then {
        $0.backgroundColor = .white
    }
    let sidedishView = UIView().then {
        $0.backgroundColor = .white
    }
    let drinkView = UIView().then {
        $0.backgroundColor = .white
    }
    let etcView = UIView().then {
        $0.backgroundColor = .white
    }
    
    init() {
        setUpMenus()
    }
    
    private func setUpMenus() {
        chickenMenu.menuData = menuList.menuCategories["치킨", default: []]
        sidedishMenu.menuData = menuList.menuCategories["사이드", default: []]
        drinkMenu.menuData = menuList.menuCategories["음료", default: []]
        etcMenu.menuData = menuList.menuCategories["기타", default: []]
        
        chickenView.addSubview(chickenMenu)
        sidedishView.addSubview(sidedishMenu)
        drinkView.addSubview(drinkMenu)
        etcView.addSubview(etcMenu)
        
        // 레이아웃 설정
        let views = [chickenMenu, sidedishMenu, drinkMenu, etcMenu]
        views.forEach { menu in
            menu.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                menu.topAnchor.constraint(equalTo: menu.superview!.topAnchor),
                menu.leadingAnchor.constraint(equalTo: menu.superview!.leadingAnchor),
                menu.trailingAnchor.constraint(equalTo: menu.superview!.trailingAnchor),
                menu.bottomAnchor.constraint(equalTo: menu.superview!.bottomAnchor)
            ])
        }
    }
}
