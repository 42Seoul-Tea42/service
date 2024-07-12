#! /bin/bash

pnpm install --prefix srcs

pnpm --prefix srcs run build
pnpm --prefix srcs run start

# tail -f