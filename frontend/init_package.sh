#!/bin/sh

pnpm --prefix srcs install

#pnpm add --prefix srcs --save-dev package-name

pnpm --prefix srcs run dev 
# pnpm --prefix srcs run build
# pnpm --prefix srcs start