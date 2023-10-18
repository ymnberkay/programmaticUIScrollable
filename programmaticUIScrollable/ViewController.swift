//
//  ViewController.swift
//  programmaticUIScrollable
//
//  Created by Berkay Yaman on 19.10.2023.
//


import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    var collectionView1: UICollectionView!
    var tableView1: UITableView!
    var collectionView2: UICollectionView!
    var tableView2: UITableView!
    
    var data: [(String, String)] = [("doner", "Döner"), ("pide", "Pide"), ("evYemegi", "Ev Yemeği"), ("hamburger", "Hamburger"), ("sokak", "Sokak Lezeti")]
    
    var data2: [(String, String)] = [("lisa", "Item"), ("lisa", "Item"), ("lisa", "Item"), ("lisa", "Item"), ("lisa", "Item")]
    
    var scrollView: UIScrollView = {
      let sv = UIScrollView()
      return sv
    }()
    
    var contentView: UIView = {
      let view = UIView()
      return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupScrollViewContstraints()
        setupContentViewConstraints()
        setUpCollectionViewConstraints()
        setupTableViewConstraints()
        setupCollectionView2Constraints()
        setupTableView2Constraints()
    }

    private func setUpCollectionViewConstraints() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 120, height: 100)
        collectionView1 = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100), collectionViewLayout: layout)
        collectionView1.dataSource = self
        collectionView1.delegate = self
        collectionView1.showsHorizontalScrollIndicator = false
        collectionView1.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "customCell1")
        let inset = (self.view.frame.width - 300) / 2 // Adjust the cell width (200) as needed
        collectionView1.contentInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
        collectionView1.backgroundColor = UIColor.white
        view.addSubview(collectionView1)
        collectionView1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView1.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView1.heightAnchor.constraint(equalToConstant: 100),
            
        ])
    }
    
    private func setupCollectionView2Constraints() {
        let layout2 = UICollectionViewFlowLayout()
        layout2.scrollDirection = .horizontal
        layout2.itemSize = CGSize(width: 300, height: 100)
        collectionView2 = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100), collectionViewLayout: layout2)
        collectionView2.dataSource = self
        collectionView2.delegate = self
        collectionView2.showsHorizontalScrollIndicator = false
        collectionView2.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "Cell2")
        let inset = (self.view.frame.width - 300) / 2 // Adjust the cell width (200) as needed
        collectionView2.contentInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
        collectionView2.backgroundColor = UIColor.white
        view.addSubview(collectionView2)
        collectionView2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView2.topAnchor.constraint(equalTo: tableView1.bottomAnchor, constant: 30),
            collectionView2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView2.heightAnchor.constraint(equalToConstant: 100),
            
        ])
    }
    
    private func setupTableViewConstraints() {
        tableView1 = UITableView(frame: view.bounds, style: .plain)
        tableView1.delegate = self
        tableView1.dataSource = self
        tableView1.register(UITableViewCell.self, forCellReuseIdentifier: "CellTable1")
        view.addSubview(tableView1)
        tableView1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView1.topAnchor.constraint(equalTo: collectionView1.bottomAnchor, constant: 30),
            tableView1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView1.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    private func setupTableView2Constraints() {
        tableView2 = UITableView(frame: view.bounds, style: .plain)
        tableView2.delegate = self
        tableView2.dataSource = self
        tableView2.register(UITableViewCell.self, forCellReuseIdentifier: "CellTable2")
        view.addSubview(tableView2)
        tableView2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView2.topAnchor.constraint(equalTo: collectionView2.bottomAnchor, constant: 30),
            tableView2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView2.heightAnchor.constraint(equalToConstant: 300),
        ])
        
    }
    
    private func setupScrollViewContstraints() {
        view.addSubview(scrollView)
      scrollView.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        scrollView.topAnchor.constraint(equalTo: view.topAnchor),
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      ])
    }
    
    private func setupContentViewConstraints() {
        scrollView.addSubview(contentView)
      contentView.translatesAutoresizingMaskIntoConstraints = false
      let heightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
      heightConstraint.priority = UILayoutPriority(250)
      NSLayoutConstraint.activate([
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        heightConstraint,
      ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collectionView1 {
            return data.count
        } else if collectionView == collectionView2 {
            return data2.count
        }
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionView1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell1", for: indexPath) as! CustomCollectionViewCell
            cell.imageView.image = UIImage(named: data[indexPath.row].0)
            cell.label.text = data[indexPath.row].1
            return cell
        } else if collectionView == collectionView2 {
            let cell = collectionView2.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as! CustomCollectionViewCell
            cell.imageView.image = UIImage(named: data2[indexPath.row].0)
            cell.label.text = data2[indexPath.row].1
            return cell
        }
        return UICollectionViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == tableView1 {
            return 3
        } else if tableView == tableView2 {
            return 3
        }
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tableView1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellTable1", for: indexPath)
            let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 60, height: 60)) // Adjust the frame as needed
            imageView.image = UIImage(named: "marge") // Replace "yourImageName" with the name of your image
            imageView.contentMode = .scaleAspectFit
            cell.contentView.addSubview(imageView)
            let label = UILabel(frame: CGRect(x: 80, y: 20, width: 200, height: 20)) // Adjust the frame as needed
            label.text = "data[indexPath.row].1"
            cell.contentView.addSubview(label)
            return cell
        } else if tableView == tableView2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellTable2", for: indexPath)
            let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 60, height: 60)) // Adjust the frame as needed
            imageView.image = UIImage(named: "lisa") // Replace "yourImageName" with the name of your image
            imageView.contentMode = .scaleAspectFit
            cell.contentView.addSubview(imageView)
            
            let label = UILabel(frame: CGRect(x: 80, y: 20, width: 200, height: 20)) // Adjust the frame as needed
            label.text = "data[indexPath.row].1"
            cell.contentView.addSubview(label)
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Return the desired height for your cells
        return 100 // Adjust the height value as needed
    }
}



