# Hide chat side bar
sidebarRemoved = false
hideChatSideBar = ->
  sidebar = jQuery(".fbChatSidebar")
  if sidebar.size() == 0 && !sidebarRemoved
    window.setTimeout(hideChatSideBar, 200)
  sidebar.remove()
  sidebarRemoved = true
hideChatSideBar()
