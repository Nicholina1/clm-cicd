# Stage 1: Build the application
FROM node:18-alpine AS builder

WORKDIR /app

# Copy only package files to install dependencies first
COPY package.json ./
RUN npm install --legacy-peer-deps

# Copy source code and build
COPY . .
RUN npm run build

# Stage 2: Production image
FROM node:18-alpine

WORKDIR /app

# Copy essential files from builder stage
COPY --from=builder /app/package.json ./
COPY --from=builder /app/package-lock.json ./
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/node_modules ./node_modules

ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED=1
# ENV HOSTNAME=0.0.0.0

EXPOSE 3000

# Use node directly instead of npm for better signal handling
CMD ["node", "node_modules/.bin/next", "start"]

















# # Stage 1: Build the application
# FROM node:20-alpine AS builder

# # Set working directory
# WORKDIR /app

# # Copy package files for dependency installation
# COPY package.json yarn.lock* package-lock.json* ./ 

# # Install dependencies (preferring yarn if available)
# RUN npm install

# # Copy the rest of the application
# COPY . .

# # Build the Next.js app
# RUN npm run build

# # Stage 2: Production image
# FROM node:20-alpine AS runner

# WORKDIR /app

# # Copy only necessary files from the builder stage
# COPY --from=builder /app/package.json ./package.json
# COPY --from=builder /app/.next ./.next
# COPY --from=builder /app/public ./public
# COPY --from=builder /app/node_modules ./node_modules

# # Environment variables (if needed)
# # ENV NODE_ENV=production
# # ENV NEXT_TELEMETRY_DISABLED=1

# # Expose the port Next.js runs on (default: 3000)
# EXPOSE 3000

# # Start the Next.js server
# CMD ["npm", "start"]








# FROM node:20-alpine

# WORKDIR /app
# COPY package*.json /.
# RUN npm install

# COPY . .
# EXPOSE 3000
# CMD npm run dev



