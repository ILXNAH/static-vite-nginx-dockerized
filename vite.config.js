import { defineConfig } from 'vite';

export default defineConfig({
  root: '.',              // Project root remains current directory
  publicDir: 'public',    // Keep public/ for static assets (served as-is in both dev and production)
  build: {
    rollupOptions: {
      input: 'public/index.html'    // Custom index location for production build (does NOT affect dev server)
    }
  }
});