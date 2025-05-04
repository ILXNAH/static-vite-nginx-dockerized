import { defineConfig } from 'vite';

export default defineConfig({
  root: '.',              // still root
  publicDir: 'public',    // keep public/ for static assets
  build: {
    rollupOptions: {
      input: 'public/index.html'
    }
  }
});