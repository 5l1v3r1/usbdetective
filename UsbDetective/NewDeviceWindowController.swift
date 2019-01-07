// Licensed to the Apache Software Foundation (ASF) under one
// or more contributor license agreements.  See the NOTICE file
// distributed with this work for additional information
//   regarding copyright ownership.  The ASF licenses this file
// to you under the Apache License, Version 2.0 (the
// "License"); you may not use this file except in compliance
// with the License.  You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
//  specific language governing permissions and limitations
// under the License.

import Foundation
import Cocoa

enum ModalResult: Int {
  case Whitelist
  case Close
}

class NewDeviceWindowController: NSWindowController, NSWindowDelegate {
  @IBOutlet weak var TestWindow: NSWindow!
  
  override func windowDidLoad() {
    super.windowDidLoad()
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    self.window?.center()
    self.window?.makeKeyAndOrderFront(nil)
    // NSApp.activateIgnoringOtherApps(true)
  }
  
  override var windowNibName: String! {
    return "NewDevice"
  }

  func runModal() -> ModalResult {
    let returnCode = NSApplication.shared.runModal(for: self.window!)
    if let result = ModalResult(rawValue: returnCode.rawValue) {
      return result
    }else {
      return ModalResult.Close
    }
  }
  
  /*
  @IBAction func dismiss(sender: NSButton) {
    let app = NSApplication.shared
    app.stopModal()
  }
 */
  
  func windowWillClose(_ notification: Notification) {
    if (NSApplication.shared.modalWindow == self.window) {
      NSApplication.shared.stopModal()
    }
  }
}
