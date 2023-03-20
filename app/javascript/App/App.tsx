import * as React from 'react';
import { Provider } from 'react-redux';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import { GuestRoute } from '../auth/GuestRoute';
import { Login } from '../auth/Login';
import { PrivateRoute } from '../auth/PrivateRoute';
import { Dashboard } from '../components/dashboard/Dashboard';
import { Home } from '../components/home/Home';
import { Layout } from '../components/Layout';
import { store } from '../store/store';

export const App = () => {
  return (
    <Provider store={store}>
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<Layout />}>
            {/* Any Person route */}
            <Route index element={<Home />} />

            {/* un-signed in routes */}
            <Route element={<GuestRoute />}>
              <Route path="login" element={<Login />} />
            </Route>

            {/* Private routes */}
            <Route element={<PrivateRoute />}>
              <Route path="dashboard" element={<Dashboard />} />
            </Route>
          </Route>
        </Routes>
      </BrowserRouter>
    </Provider>
  );
};
