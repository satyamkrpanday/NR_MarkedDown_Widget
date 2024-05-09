resource "newrelic_one_dashboard" "dash1" {
  name        = var.name
  permissions = var.permissions

  page {
    name = var.dashboard.pagename

    widget_markdown {
      title  = var.dashboard.title1
      row    = var.dashboard.row1
      column = var.dashboard.column1
      width  = var.dashboard.width1
      height = var.dashboard.height1
      text   = var.dashboard.text1
    }
    widget_markdown {
      title  = var.dashboard.title2
      row    = var.dashboard.row2
      column = var.dashboard.column2
      width  = var.dashboard.width2
      height = var.dashboard.height2
      text   = var.dashboard.text2
    }
  }
}




