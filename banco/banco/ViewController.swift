//
//  ViewController.swift
//  banco
//
//  Created by Ngoduc on 2/18/20.
//  Copyright © 2020 Ngoduc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let n: Int = 8
    
    let radius: CGFloat = 100
    var containerView = UIView()
    var width: CGFloat = 0
    var squareWidth: CGFloat = 0
    var margin: CGFloat = 30
    var countTag: Int = 0
    var images = [UIImageView]()
    var count: Int = 0
    var row = [Int]()
    var arr = [[Int]](repeating: [Int](repeating: 0, count: 8), count: 34)
  
    var k: Int = 0
    var LineCouter: Int = 0
    func kiemtra(r: Int, c: Int) -> Bool{
        for prev in 0...c {
            if (row[prev] == r || (abs(Int(row[prev] - r)) == abs(Int(prev - c)))) {
                return false;
            }
        }
        return true;
    }
    func quayLui(c: Int){
        if c==8 {
            for j in 0..<8 {
                arr[k][j] = row[j]+1
                print(String(row[j]+1) + " ", terminator: "")
            }
            print("")
            k += 1
        }else {
            for r in 0..<8 {
                if kiemtra(r: r, c: c) {
                    row[c] = r
                    quayLui(c: c+1)
                }
            }
        }
    }
    func chay(){
        
        for i in 0...7 {
            row.append(1)
            
        }
       
        print("1 2 3 4 5 6 7 8")
        quayLui(c: 0)
        print(k)
        print(arr)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        width = self.view.frame.width
        containerView.frame = CGRect(x: 0, y: 0, width: width, height: width)
        containerView.center = view.center
        containerView.backgroundColor = UIColor.lightGray
        view.addSubview(containerView)
        
//        squareWidth = (containerView.bounds.width) / 16
        squareWidth = (containerView.bounds.width-2*margin)/8
        drawChess()
        chay()
        
//        placeQueen(isPut: true, row: 3, column: 7)
        
    }
    func drawBrick(row: Int, col: Int, radius: CGFloat, color: UIColor) {
        let d = radius * 2
        let ball = Brick(startPoint: CGPoint(x: d * CGFloat(col), y: d * CGFloat(row)), radius: radius, fillColor: color)
        containerView.addSubview(ball)
    }
    
    func drawSqure(row: Int,column: Int, isWhite: Bool, width: CGFloat, tag: Int) {
        let squre = UIView(frame: CGRect(x:margin + CGFloat(column)*width, y:margin + CGFloat(row)*width, width: width, height: width))
        
        squre.backgroundColor = isWhite ? UIColor.white : UIColor.black
        squre.tag = tag
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapSquare(_:)))
        squre.addGestureRecognizer(gesture)
        containerView.addSubview(squre)
    }
    @objc func tapSquare(_ sender: UITapGestureRecognizer) {
        guard let squreView = sender.view else {
            return
        }
        for image in images {
            image.removeFromSuperview()
        }
        print(squreView.tag)
        if squreView.tag % n == 0 {
            placeQueen(isPut: true, row: squreView.tag/n - 1, column: n - 1)
        }else{
            placeQueen(isPut: true, row: squreView.tag/n, column: squreView.tag%n - 1 )
        }
    }
    func drawChess(){
        for i in 0..<n {
            for j in 0..<n{
                countTag += 1
                let isWhiteSqure: Bool = (i+j)%2 == 1 ? true : false
                drawSqure(row: i, column: j, isWhite: isWhiteSqure, width: squareWidth, tag: countTag)
            }
        }
    }
    
    func placeQueen(isPut: Bool, row: Int, column: Int) {
        let queenImageView = UIImageView(image: UIImage(named: "queen"))
        if isPut {
            queenImageView.frame = CGRect(x: margin + CGFloat(column)*squareWidth, y: margin + CGFloat(row)*squareWidth, width: squareWidth, height: squareWidth)
            queenImageView.contentMode = .scaleToFill
            images.append(queenImageView)
            containerView.addSubview(queenImageView)
        }
    }
    
    func drawWall(){
        for i in 0...7{
            for j in 0...7 {
                if i%2 == 0 {
               if j == 1 || j == 3  || j == 5 || j==7{
                drawBrick(row: i, col: j, radius: squareWidth, color: UIColor.black)
               } else {
                drawBrick(row: i, col: j, radius: squareWidth, color: UIColor(red:0.94, green:0.96, blue:0.96, alpha:1.0))
                }
                } else {
                    if j == 0 || j == 2  || j == 4 || j==6{
                     drawBrick(row: i, col: j, radius: squareWidth, color: UIColor.black)
                    } else {
                     drawBrick(row: i, col: j, radius: squareWidth, color: UIColor(red:0.94, green:0.96, blue:0.96, alpha:1.0))
                     }
                }
        }
        }
        print(containerView.subviews.count)
    }
    
   
    @IBAction func back(_ sender: Any) {
        count -= 1
        for image in images {
            image.removeFromSuperview()
        }
        if count < 0 {
            count = 33
        }
        for i in 0...7 {
             placeQueen(isPut: true, row: arr[count][i] - 1, column: i)
        }
    }
    
    @IBAction func next(_ sender: Any) {
        count += 1
        for image in images {
            image.removeFromSuperview()
        }
        if count > 33 {
            count = 0
        }
        for i in 0...7 {
             placeQueen(isPut: true, row: arr[count][i] - 1, column: i)
        }
    }
}

