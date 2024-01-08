#!/bin/sh

pnpm --prefix srcs install

#pnpm add --prefix srcs --save-dev package-name

# pnpm dev --prefix srcs
pnpm --prefix srcs run build
pnpm --prefix srcs start