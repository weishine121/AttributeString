//
//  ViewController.swift
//  富文本
//
//  Created by sloky on 16/8/5.
//  Copyright © 2016年 sloky. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let textView = UITextView(frame: CGRect(x: 20, y: 100, width: 335, height: 300))
        view.addSubview(textView)
        textView.backgroundColor = UIColor.brownColor()
        textView.editable = false

        let  label = UILabel(frame: CGRect(x: 20, y: 410, width: 335, height: 250))
        label.backgroundColor = UIColor.lightGrayColor()
        label.numberOfLines = 0
        view.addSubview(label)

        let str = "我的字体更别的不同哦,我的颜色是红色,我加了背景色,我加了下划线,我的字距变大了,哈哈我有阴影了,点我啊 带你进入苹果官网"
        let attributeString = NSMutableAttributedString(string: str)

        /// 字体
        attributeString.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(20), range: NSMakeRange(0, 10))
        attributeString.addAttribute(NSFontAttributeName, value: UIFont(name: "Times New Roman", size: 24)!, range: NSMakeRange(0, 10))

        /// 字体颜色
        attributeString.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSMakeRange(11, 7))

        /// 背景色
        attributeString.addAttribute(NSBackgroundColorAttributeName, value: UIColor.greenColor(), range: NSMakeRange(19, 6))

        /// 下划线 (value值越大，下划线越粗)
        attributeString.addAttribute(NSUnderlineStyleAttributeName, value: 5, range: NSMakeRange(26, 6))

        /// 下划线颜色 (需在有下划线的字的设置)
        attributeString.addAttribute(NSUnderlineColorAttributeName, value: UIColor.orangeColor(), range: NSMakeRange(26, 5))

        /// 字距 (value的值越大，字距越大)
        attributeString.addAttribute(NSKernAttributeName, value:10, range: NSMakeRange(33, 7))

        /// 阴影
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.blackColor() //阴影颜色
        shadow.shadowBlurRadius = 2.0 //模糊度
        shadow.shadowOffset = CGSizeMake(4, 4) //阴影偏移
        attributeString.addAttribute(NSShadowAttributeName, value:shadow, range: NSMakeRange(41, 7))

        /// 添加链接
        attributeString.addAttribute(NSLinkAttributeName, value: NSURL(string: "http://www.apple.com")!, range: NSMakeRange(49, 12))

        // 行距
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 20
        attributeString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, 61))

        /// html
        let htmlText = "我是<font color=\"blue\">html</font>。<br>An apple is <font color=\"red\">red</font>."
        do{
            let attrStr = try NSAttributedString(data: htmlText.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)

            label.attributedText = attrStr
        }catch let error as NSError {
            print(error.localizedDescription)
        }

        textView.attributedText = attributeString

    }


}

/**
 *  NSFontAttributeName:               String // UIFont, default Helvetica(Neue) 12
 *  NSParagraphStyleAttributeName:     String // NSParagraphStyle, default defaultParagraphStyle
 *  NSForegroundColorAttributeName:    String // UIColor, default blackColor
 *  NSBackgroundColorAttributeName:    String // UIColor, default nil: no background
 *  NSLigatureAttributeName:           String // NSNumber containing integer, default 1: default ligatures, 0: no ligatures
 *  NSKernAttributeName:               String // NSNumber containing floating point value, in points; amount to modify default kerning. 0 means kerning is disabled.
 *  NSStrikethroughStyleAttributeName: String // NSNumber containing integer, default 0: no strikethrough
 *  NSUnderlineStyleAttributeName:     String // NSNumber containing integer, default 0: no underline
 *  NSStrokeColorAttributeName:        String // UIColor, default nil: same as foreground color
 *  NSStrokeWidthAttributeName:        String // NSNumber containing floating point value, in percent of font point size, default 0: no stroke; positive for stroke alone, negative for stroke and fill (a typical value for outlined text would be 3.0)
 *  NSShadowAttributeName:             String // NSShadow, default nil: no shadow
 *  NSTextEffectAttributeName:         String // NSString, default nil: no text effect

 *  NSAttachmentAttributeName:         String // NSTextAttachment, default nil
 *  NSLinkAttributeName:               String // NSURL (preferred) or NSString
 *  NSBaselineOffsetAttributeName:     String // NSNumber containing floating point value, in points; offset from baseline, default 0
 *  NSUnderlineColorAttributeName:     String // UIColor, default nil: same as foreground color
 *  NSStrikethroughColorAttributeName: String // UIColor, default nil: same as foreground color
 *  NSObliquenessAttributeName:        String // NSNumber containing floating point value; skew to be applied to glyphs, default 0: no skew
 *  NSExpansionAttributeName:          String // NSNumber containing floating point value; log of expansion factor to be applied to glyphs, default 0: no expansion

 *  NSWritingDirectionAttributeName:   String // NSArray of NSNumbers representing
 */
