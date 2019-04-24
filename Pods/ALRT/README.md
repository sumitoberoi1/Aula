<img src="https://raw.githubusercontent.com/wiki/mshrwtnb/ALRT/logobanner.png">
An easier constructor for UIAlertController. Present from anywhere.

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](https://github.com/mshrwtnb/ALRT/blob/master/Documentation/Usage.md)
- [License](#license)

***Less Hustle, More Clarity***

```swift
ALRT.create(.alert, title: "Alert?").addOK().addCancel().show()
```

## Features
* Chainable UIAlertController Setup Methods
* Support `.alert` and `.actionSheet` UIAlertController.Style
* Support `UITextfield` UIAlertAction(`.alert` only)
* Returns `Result` whether an alert is successfully displayed. In other words, [Unit Testable](https://github.com/mshrwtnb/ALRT/blob/master/Demo/DemoTests/DemoTests.swift).
## Requirements
* Xcode 10.0+
* Swift 4.2+
* iOS 9.0+
## Installation
### Carthage
```
github "mshrwtnb/ALRT" ~> 1.3.0
```
### Cocoapods
```
pod "ALRT"
```
## License
ALRT is released under the MIT license. [See LICENSE](https://github.com/mshrwtnb/ALRT/blob/master/LICENSE) for details.
