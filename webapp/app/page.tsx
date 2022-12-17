"use client"

import { Button, Grid, Stack } from '@mui/material'

const Home = () => (
  <Grid container height="100vh" alignItems="center" justifyContent="center" direction="column">
    <h1>Using Material UI with Next.js 13</h1>
    <h2>testing vercel</h2>
    <Stack direction="row" columnGap={1}>
      <Button variant="text">Text</Button>
      <Button variant="contained">Contained</Button>
      <Button variant="outlined">Outlined</Button>
    </Stack>
  </Grid>
)

export default Home
