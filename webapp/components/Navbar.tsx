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

const Navbar = () => {
  const [mobileOpen, setMobileOpen] = useState(false)

  const toggleDrawer = () => {
    setMobileOpen((prevState) => !prevState)
  }

  return (
    <>
      <AppBar position='sticky' component={'nav'}>
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
            Teacher&apos;s Bingo
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
            Teacher&apos;s Bingo
          </Typography>
          <Divider />
          <List>
            <ListItem disablePadding>
              <ListItemButton sx={{ textAlign: 'center' }}>
                <ListItemText primary={'Test'} />
              </ListItemButton>
            </ListItem>
          </List>
        </Box>
      </Drawer>
    </>
  )
}

export default Navbar
