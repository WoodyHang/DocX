//
//  DocX.swift
//  DocXWriter
//
//  Created by Morten Bertz on 2019/03/10.
//  Copyright © 2019 telethon k.k. All rights reserved.
//

import Foundation
import AEXML

enum DocXSavingErrors:Error{
    case noBlankDocument
    case compressionFailed
}

struct LinkRelationship:Equatable{
    let relationshipID:String
    let linkURL:URL
}

protocol DocX{
    func docXDocument(linkRelations:[LinkRelationship])throws ->String
    func writeDocX(to url:URL)throws
    func prepareLinks(linkXML:AEXMLDocument)->[LinkRelationship]
}

public let docXUTIType="org.openxmlformats.wordprocessingml.document"


public extension NSAttributedString.Key{
    static let breakType = NSAttributedString.Key.init("com.telethon.docx.attributedstringkey.break")
}

public enum BreakType: String, Equatable{
    case wrap
    case page
    case column
}
