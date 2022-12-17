import type { NextApiRequest, NextApiResponse } from 'next'
import { notion, config as notionConfig } from '@lib/notion'

const handler = async (_req: NextApiRequest, res: NextApiResponse) => {
  const list = await notion.databases.query({
    database_id: notionConfig.teachers
  }).catch(() => res.status(500).json({ code: 500, message: 'something went wrong' }))

  const formattedItems = list?.results.map((teacher) => {
    return {
      id: teacher.id,
      // @ts-ignore
      name: teacher.properties['name'].title[0].plain_text,
      // @ts-ignore
      gender: teacher.properties['gender'].select.name,
      // @ts-ignore
      quotes: teacher.properties['quotes'].relation.length,
    }
  })
  res.status(200).json(formattedItems)
}

export default handler
