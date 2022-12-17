"use client"

import { Button, Grid, Stack, Typography } from '@mui/material'
import { Star, Build } from '@mui/icons-material'

const Home = () => (
  <Grid container height="100vh" alignItems="center" justifyContent="center" direction="column" rowGap={1}>
    <Typography variant='h4'>Lehrerbingo</Typography>
    <Typography variant='h5'>Lehrerbingo für langweilige Schulstunden</Typography>
    <Typography variant='h6'>Bingo erstellen</Typography>
    <Stack direction="column" rowGap={1} className='mt-1'>
      <Button variant="contained">
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

export default Home
