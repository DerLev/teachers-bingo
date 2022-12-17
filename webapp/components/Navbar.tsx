import { useState } from 'react'
import {
  AppBar,
  IconButton,
  Toolbar,
  Typography,
  Drawer,
  Box,
  Divider,
  List,
  ListItem,
  ListItemButton,
  ListItemText
} from '@mui/material'
import {
  Menu as MenuIcon
} from '@mui/icons-material'
import { usePathname } from 'next/navigation'

const values = {
  title: 'Lehrerbingo',
  navItems: [
    { text: 'Erstellen', href: '/' }
  ]
}

const pathsWithFixed = [
  '/'
]

const Navbar = () => {
  const pathname = usePathname()

  const [mobileOpen, setMobileOpen] = useState(false)

  const toggleDrawer = () => {
    setMobileOpen((prevState) => !prevState)
  }

  return (
    <>
      <AppBar
        position={ pathsWithFixed.filter((path) => path == pathname).length ? 'fixed' : 'sticky' }
        component={'nav'}
      >
        <Toolbar>
          <IconButton
            size='large'
            edge='start'
            color='inherit'
            aria-label='menu'
            className='mr-2'
            onClick={toggleDrawer}
          >
            <MenuIcon />
          </IconButton>
          <Typography variant='h6' component={'div'} className='flex-grow'>
            { values.title }
          </Typography>
        </Toolbar>
      </AppBar>
      <Drawer
        variant='temporary'
        open={mobileOpen}
        onClose={toggleDrawer}
        ModalProps={{ keepMounted: true }}
        className='[&>.MuiDrawer-paper]:w-full
          sm:[&>.MuiDrawer-paper]:w-2/3 lg:[&>.MuiDrawer-paper]:w-1/2
          xl:[&>.MuiDrawer-paper]:w-1/3'
      >
        <Box onClick={toggleDrawer} className='text-center'>
          <Typography variant="h6" className='my-2'>
            { values.title }
          </Typography>
          <Divider />
          <List>
            {
              values.navItems.map((item, index) => (
                <ListItem disablePadding key={index}>
                  <ListItemButton sx={{ textAlign: 'center' }}>
                    <ListItemText primary={item.text} />
                  </ListItemButton>
                </ListItem>
              ))
            }
          </List>
        </Box>
      </Drawer>
    </>
  )
}

export default Navbar
