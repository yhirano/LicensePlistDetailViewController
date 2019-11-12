//
// Copyright (c) 2018-2019 Yuichi Hirano
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

open class LicensePlistViewController: UITableViewController {
    public static let defaultPlistPath = Bundle.main.path(forResource: "com.mono0926.LicensePlist", ofType: "plist")
    public static let defaultTitle = "License"

    private var items: [Item] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    public convenience init(fileNamed fileName: String, title: String? = LicensePlistViewController.defaultTitle) {
        let path = Bundle.main.path(forResource: fileName, ofType: "plist")
        self.init(plistPath: path, title: title)
    }

    public init(plistPath: String? = LicensePlistViewController.defaultPlistPath,
                title: String? = LicensePlistViewController.defaultTitle) {
        super.init(style: .plain)
        self.commonInit(plistPath: plistPath, title: title)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(style: .plain)
        self.commonInit(plistPath: LicensePlistViewController.defaultPlistPath,
                        title: LicensePlistViewController.defaultTitle)
    }

    public required init(coder aDecoder: NSCoder) {
        super.init(style: .plain)
        self.commonInit(plistPath: LicensePlistViewController.defaultPlistPath,
                        title: LicensePlistViewController.defaultTitle)
    }

    private func commonInit(plistPath: String?, title: String?) {
        self.title = title
        self.items = LicensePlistParser.parse(plistPath: plistPath)
    }

    open override func viewDidLoad() {
        super.viewDidLoad()

        if let navigationController = self.navigationController {
            if self.presentingViewController != nil && navigationController.viewControllers.first == self {
                let item = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissViewController(_:)))
                self.navigationItem.leftBarButtonItem = item
            }
        }
        
        customizeTableViewVisual()
    }

    fileprivate func customizeTableViewVisual() {
        assert(tableView.style == .plain, "This customization assumes that the table view style is plain.")
        
        // Hide empty cells on display
        tableView.tableFooterView = UIView()
        
        // Show background as if the table view style is grouped, which has a slightly different color from cells
        tableView.backgroundColor = .groupTableViewBackground
    }
    
    // MARK: - Actions
    
    @IBAction open func dismissViewController(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource

extension LicensePlistViewController {
    open override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    open override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        let cell: UITableViewCell
        if let dequeuedCell = dequeuedCell {
            cell = dequeuedCell
        } else {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellIdentifier)
        }

        let item = items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator

        return cell
    }
}

// MARK: - PadingTablewViewDelegate

extension LicensePlistViewController {
     open override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        let viewController = LicensePlistDetailViewController(item: item)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
