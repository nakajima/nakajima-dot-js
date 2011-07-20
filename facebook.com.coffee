# Hide chat side bar
sidebarRemoved = false
hideChatSideBar = ->
  sidebar = jQuery(".fbChatSidebar")
  if sidebar.size() == 0 && !sidebarRemoved
    # Sidebar hasn't loaded yet, try again
    window.setTimeout(hideChatSideBar, 200)
  sidebar.remove()
  sidebarRemoved = true
hideChatSideBar()
