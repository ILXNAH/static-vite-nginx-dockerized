# Stage 1:
# Build the static site
FROM node:18-alpine AS build

WORKDIR /app

# Install dependencies first to leverage cache
COPY package.json package-lock.json ./
RUN npm install

# Copy the rest of the files
COPY . .

# RUN mv public/index.html ./index.html

# Build the project
RUN npm run build

# List the contents of dist/ to verify output
RUN ls -R dist/


# Stage 2: 
# Serve the static site with nginx
FROM nginx:alpine AS prod

# IMPORTANT: Because of how vite.config.js is written (input set to public/index.html),
# Vite puts the processed index.html and assets into dist/public/. So we copy dist/public/
# to nginx's web root to serve the correct built app.
COPY --from=build /app/dist/public /usr/share/nginx/html

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]