"use client"

import { Button, Grid, Stack, Typography } from '@mui/material'
import { Star, Build } from '@mui/icons-material'
import { useEffect } from 'react'
import io, { Socket } from 'socket.io-client'

let socket: Socket

const Home = () => {
  const socketInitializer = async () => {
    await fetch('/api/generate-grid')
    socket = io()

    socket.on('connect', () => console.log('Connected to socket'))

    socket.on('log', msg => console.info(msg))
  }

  useEffect(() => {
    socketInitializer()
  }, [])  

  return (
    <Grid container height="100vh" alignItems="center" justifyContent="center" direction="column" rowGap={1}>
      <Typography variant='h4'>Lehrerbingo</Typography>
      <Typography variant='h5'>Lehrerbingo für langweilige Schulstunden</Typography>
      <Typography variant='h6'>Bingo erstellen</Typography>
      <Stack direction="column" rowGap={1} className='mt-1'>
        <Button variant="contained" onClick={() => {
          socket.emit('testing-connection', 'ping')
        }}>
          <Star className='mr-2' />
          Einfach
        </Button>
        <Button variant="outlined">
          <Build className='mr-2' />
          Benutzerdefiniert
        </Button>
      </Stack>
    </Grid>
  )
}

export default Home
