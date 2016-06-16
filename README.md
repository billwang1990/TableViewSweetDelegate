# TableViewSweetDelegate

###How to use 

    
      let del = TableViewSweetDelegate(data: [[1,2,3]], configureCell: { (i, c) -> SettingPageCell in
          c.textLabel?.text = String(i)
          //TODO: config cell
          return c
      })
      yourTableView.delegate = del
      yourTableView.dataSource = del
  
