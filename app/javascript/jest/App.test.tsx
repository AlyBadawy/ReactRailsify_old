import React from 'react';
import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom/extend-expect';
import { App } from '../App/App';

describe('App', () => {
  it('Renders the document with correct paragraph', () => {
    render(<App />);
    const paragraph = screen.getByText(/Hello, world!/i);
    expect(paragraph).toBeInTheDocument();
  });
});
