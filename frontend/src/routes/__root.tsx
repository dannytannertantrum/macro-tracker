import { Outlet, createRootRoute } from '@tanstack/react-router';
import { TanStackRouterDevtoolsPanel } from '@tanstack/react-router-devtools';
import { TanstackDevtools } from '@tanstack/react-devtools';

import Header from '../components/Header';

export const Route = createRootRoute({
  component: () => (
    <>
      <Header />
      <div className="flex flex-col min-h-screen max-w-7xl mx-auto">
        <Outlet />
      </div>
      <TanstackDevtools
        config={{
          position: 'bottom-left',
        }}
        plugins={[
          {
            name: 'Tanstack Router',
            render: <TanStackRouterDevtoolsPanel />,
          },
        ]}
      />
    </>
  ),
});
