//
//  Document.swift
//  Notes
//
//  Created by Benjamin Chait on 6/21/16.
//  Copyright © 2016 Benjamin Chait. All rights reserved.
//

import Cocoa

// Names of files/directories in the package
enum NoteDocumentFileNames : String {
    case TextFile = "Text.rtf"
    
    case AttachmentsDirectory = "Attachments"
    
}

enum ErrorCode : Int {
    
    /// We couldn't find the document at all.
    case CannotAccessDocument
    
    /// We couldn't access any file wrappers inside this document.
    case CannotLoadFileWrappers
    
    /// We couldn't load the Text.rtf file.
    case CannotLoadText
    
    /// We couldn't access the Attachments folder.
    case CannotAccessAttachments
    
    /// We couldn't save the Text.rtf file.
    case CannotSaveText
    
    /// We couldn't save an attachment.
    case CannotSaveAttachment
}

let ErrorDomain = "NotesErrorDomain"

func err(code: ErrorCode, _ userInfo:[NSObject:AnyObject]? = nil)
    -> NSError {
        // Generate an NSError object, using ErrorDomain and whatever
        // value we were passed.
        return NSError(domain: ErrorDomain, code: code.rawValue,
                       userInfo: userInfo)
}

class Document: NSDocument {
    
    // BEGIN text_property
    // Main text content
    var text : NSAttributedString = NSAttributedString()
    // END text_property
    
    // Directory file wrapper
    // BEGIN document_file_wrapper
    var documentFileWrapper = NSFileWrapper(directoryWithFileWrappers: [:])
    // END document_file_wrapper

    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    override class func autosavesInPlace() -> Bool {
        return true
    }

    override var windowNibName: String? {
        // Returns the nib file name of the document
        // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this property and override -makeWindowControllers instead.
        return "Document"
    }

    override func dataOfType(typeName: String) throws -> NSData {
        // Insert code here to write your document to data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning nil.
        // You can also choose to override fileWrapperOfType:error:, writeToURL:ofType:error:, or writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }

    override func readFromData(data: NSData, ofType typeName: String) throws {
        // Insert code here to read your document from the given data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning false.
        // You can also choose to override readFromFileWrapper:ofType:error: or readFromURL:ofType:error: instead.
        // If you override either of these, you should also override -isEntireFileLoaded to return false if the contents are lazily loaded.
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }
    
    override func readFromFileWrapper(fileWrapper: NSFileWrapper,
                                         ofType typeName: String) throws {
        
        // Ensure that we have additional file wrappers in this file wrapper
        guard let fileWrappers = fileWrapper.fileWrappers else {
            throw err(.CannotLoadFileWrappers)
        }
        
        // Ensure that we can access the document text
        guard let documentTextData =
            fileWrappers[NoteDocumentFileNames.TextFile.rawValue]?
                .regularFileContents else {
                    throw err(.CannotLoadText)
        }
        
        // Load the text data as RTF
        guard let documentText = NSAttributedString(RTF: documentTextData,
                                                    documentAttributes: nil) else {
                                                        throw err(.CannotLoadText)
        }
        
        // Keep the text in memory
        self.documentFileWrapper = fileWrapper
        
        self.text = documentText
        
    }
    
    override func fileWrapperOfType(typeName: String) throws -> NSFileWrapper {
        
        let textRTFData = try self.text.dataFromRange(
            NSRange(0..<self.text.length),
            documentAttributes: [
                NSDocumentTypeDocumentAttribute: NSRTFTextDocumentType
            ]
        )
        
        // If the current document file wrapper already contains a
        // text file, remove it - we'll replace it with a new one
        if let oldTextFileWrapper = self.documentFileWrapper
            .fileWrappers?[NoteDocumentFileNames.TextFile.rawValue] {
            self.documentFileWrapper.removeFileWrapper(oldTextFileWrapper)
        }
        
        // Save the text data into the file
        self.documentFileWrapper.addRegularFileWithContents(
            textRTFData,
            preferredFilename: NoteDocumentFileNames.TextFile.rawValue
        )
        
        // Return the main document's file wrapper - this is what will
        // be saved on disk
        return self.documentFileWrapper
    }


}

