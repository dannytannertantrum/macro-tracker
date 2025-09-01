import { createFileRoute } from '@tanstack/react-router'

// Note the trailing slash, which is used to target index routes
export const Route = createFileRoute('/logs/')({
  component: RouteComponent,
})

function RouteComponent() {
  return <div>I'm a log skeleton!</div>
}
