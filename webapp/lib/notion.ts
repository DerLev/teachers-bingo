import { Client } from '@notionhq/client'
import config from 'notion.json'

const notion = new Client({
  auth: process.env.NOTION_SECRET
})

export { notion, config }
