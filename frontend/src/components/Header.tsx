import { Link } from '@tanstack/react-router'

export default function Header() {
  return (
    // https://tailwindcss.com/docs/max-width - 1280px max-width
    <header className="p-4 flex gap-2 bg-white text-black justify-between">
      <nav className="flex flex-row gap-2 w-7xl mx-auto">
        <Link to="/">Home</Link>
        <Link to="/logs">Logs</Link>
        <Link to="/foods">Foods</Link>
        <Link to="/meals">Meals</Link>
      </nav>
    </header>
  )
}
