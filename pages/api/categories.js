import connection from '../../lib/db'

export default async function handler (req, res) {
  try {
    console.log('calling GET /api/categories with request ', req)
    const fetchCategoriesQuery = 'SELECT * FROM category'
    const results = await connection.query(
      fetchCategoriesQuery
    )
    console.log('results for GET /api/categories is ', results)
    res.status(200).json({ results: results.rows })
  } catch (error) {
    console.log('GET /api/categories errored out with ', error)
  }
}
