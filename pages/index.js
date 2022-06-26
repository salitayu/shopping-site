import { useState, useEffect } from 'react'

export default function Home() {
  const [categories, setCategories] = useState([])

  useEffect(() => {
    const fetchCategories = async() => {
      const response = await fetch('/api/categories')
      const data = await response.json()
      setCategories(data.results)
      console.log('categories.image ', categories[0].image)
    }
    fetchCategories()
  }, [])

  return (
    <div className="s-categories-container">
      {categories.map((category) => {
        return (
          <li key={category.id}>
            {category.name}
          </li>
        )
      })}
    </div>
  )
}
