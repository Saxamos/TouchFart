import Cocoa

fileprivate extension NSTouchBarCustomizationIdentifier {
    static let touchBar = NSTouchBarCustomizationIdentifier("com.samos.handelking")
}

fileprivate extension NSTouchBarItemIdentifier {
//    static let ⚜️       = NSTouchBarItemIdentifier("⚜️")
    static let king     = NSTouchBarItemIdentifier("king")
    static let marek     = NSTouchBarItemIdentifier("marek")
}


class WindowController: NSWindowController, NSTouchBarDelegate {

    func handleKing(sender: NSButton) {
        let title = sender.title
        
        guard let sound = NSSound(named: title) else {
            return
        }
        sound.play()
    }
    
    @available(OSX 10.12.2, *)
    override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        touchBar.customizationIdentifier    = .touchBar
        touchBar.defaultItemIdentifiers     = [.king, .marek]
        
        return touchBar
    }
    
    @available(OSX 10.12.2, *)
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItemIdentifier) -> NSTouchBarItem? {
        let touchBarItem    = NSCustomTouchBarItem(identifier: identifier)
        touchBarItem.view   = NSButton(title: identifier.rawValue, target: self, action: #selector(handleKing))
        return touchBarItem
    }
}
