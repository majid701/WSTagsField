//
//  BackspaceDetectingTextField.swift
//  WSTagsField
//
//  Created by Ilya Seliverstov on 11/07/2017.
//  Copyright © 2017 Whitesmith. All rights reserved.
//

import UIKit
import SearchTextField

protocol BackspaceDetectingTextFieldDelegate: UITextFieldDelegate {
    /// Notify whenever the backspace key is pressed
    func textFieldDidDeleteBackwards(_ textField: UITextField)
}

public class BackspaceDetectingTextField: SearchTextField {

    var onDeleteBackwards: (() -> Void)?

    init() {
        super.init(frame: CGRect.zero)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func deleteBackward() {
        onDeleteBackwards?()
        // Call super afterwards. The `text` property will return text prior to the delete.
        super.deleteBackward()
    }

}
