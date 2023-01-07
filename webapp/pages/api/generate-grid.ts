import type { NextApiRequest, NextApiResponse } from 'next'
import { Server } from 'socket.io'

const handler = async (req: NextApiRequest, res: NextApiResponse) => {
  // @ts-ignore
  if (res.socket.server.io) {
    console.log('Socket is already running')
  } else {
    console.log('Socket is initializing')
    // @ts-ignore
    const io = new Server(res.socket.server)
    // @ts-ignore
    res.socket.server.io = io

    io.on('connection', socket => {
      socket.on('testing-connection', msg => {
        socket.emit('log', socket.id)
      })
    })
  }
  res.end()
}

export default handler
