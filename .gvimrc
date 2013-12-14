if has("gui_running")
  "Disable command t binding to New Tab, so that command t plugin can use it"
  macmenu File.New\ Tab        key=<nop>
endif
