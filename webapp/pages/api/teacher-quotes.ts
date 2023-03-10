import type { NextApiRequest, NextApiResponse } from 'next'
import Joi from 'joi'
import { notion, config as notionConfig } from '@lib/notion'

interface TeacherQuotesRequest extends NextApiRequest {
  body: {
    id: string
  }
}

const bodySchema = Joi.object({
  id: Joi.string().pattern(/^([0-9a-f]){8}-([0-9a-f]){4}-([0-9a-f]){4}-([0-9a-f]){4}-([0-9a-f]){12}$/).required()
})

const handler = async (req: TeacherQuotesRequest, res: NextApiResponse) => {
  if( req.headers['content-type'] !== 'application/json' )
  return res.status(406).json({
    code: 406,
    message: 'use content-type=application/json'
  })

  const { error } = bodySchema.validate(req.body)
  if(error) return res.status(400).json({
    code: 400,
    message: error.details[0].message
  })

  const quotes = await notion.databases.query({
    database_id: notionConfig.quotes,
    filter: {
      property: 'teacher',
      relation: {
        contains: req.body.id
      }
    }
  })
    .catch(() => res.status(500).json({ code: 500, message: 'something went wrong' }))

  const formattedQuotes = quotes?.results.map((quote) => {
    return {
      id: quote.id,
      // @ts-ignore
      quote: quote.properties['quote'].title[0].plain_text
    }
  })

  res.status(200).json(formattedQuotes)
}

export default handler
