import type { NextApiRequest, NextApiResponse } from 'next'
import Joi from 'joi'

const bodySchema = Joi.object({
  id: Joi.string().pattern(/^([0-9a-f]){8}-([0-9a-f]){4}-([0-9a-f]){4}-([0-9a-f]){4}-([0-9a-f]){12}$/).required()
})

const handler = async (req: NextApiRequest, res: NextApiResponse) => {
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

  res.status(200).json(req.body)
}

export default handler
