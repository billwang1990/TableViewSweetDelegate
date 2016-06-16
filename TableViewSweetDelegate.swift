import UIKit

class TableViewSweetDelegate<T, C: UITableViewCell>: NSObject, UITableViewDelegate, UITableViewDataSource {
    typealias SelectRowCallBack = (NSIndexPath, T, C) -> Void
    typealias CellConfigure = (T, C) -> C
    
    var cellHeight: CGFloat = 44
    var selectRow: SelectRowCallBack?
    
    private(set) var data: [[T]]
    private(set) var configureCell: CellConfigure
    
    init(data: [[T]], configureCell: CellConfigure) {
        self.data = data
        self.configureCell = configureCell
    }
    
    //MARK: Delegate and DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return cellHeight
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(C)) as! C
        return configureCell(data[indexPath.section][indexPath.row], cell)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let data = self.data[indexPath.section][indexPath.row]
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! C
        selectRow?(indexPath, data, cell)
    }
    
    func selectCell(execute: SelectRowCallBack) -> TableViewSweetDelegate {
        selectRow = execute
        return self
    }
}
