# 1. Build stage
FROM node:20 AS deps

# 2. Set working directory
WORKDIR /app

# 3. Install dependencies
COPY package.json package-lock.json* ./
RUN npm install

# 4. Copy source code
COPY . .

# 5. Build the Next.js app
RUN npm run build

# 6. Production stage
FROM node:20 AS production

# 7. Set working directory
WORKDIR /app

# 8. Copy necessary files from build stage
COPY --from=deps /app/public ./public
COPY --from=deps /app/.next ./.next
COPY --from=deps /app/node_modules ./node_modules
COPY --from=deps /app/package.json ./package.json

# 9. Set environment variable
ENV NODE_ENV=production

# 10. Expose the port Next.js runs on
EXPOSE 3000

# 11. Start the app
CMD ["npm", "start"]
