"use client"

import {
  ThemeProvider,
  CssBaseline,
  Box
} from '@mui/material'
import { darkTheme } from '@app/theme/themes'
import './global.css'
import Navbar from '@components/Navbar'

const RootLayout = ({ children }: { children: React.ReactNode }) => {
  return (
    <html lang="en">
      <head />
      <ThemeProvider theme={darkTheme}>
        <CssBaseline />
        <body id="__next">
          <Box>
            <Navbar />
            {children}
          </Box>
        </body>
      </ThemeProvider>
    </html>
  )
}

export default RootLayout
