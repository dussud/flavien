set dotenv-load

# list recipes
default:
    @just --list

# run the dev server in the background
dev:
    npx astro dev --background

# build the static site into dist/
build:
    npm run build

# build, then sync dist/ to the server
deploy: build
    rsync -avz --delete dist/ "{{ env('DEPLOY_HOST') }}:{{ env('DEPLOY_PATH') }}/"

# show what deploy would change, without changing anything
deploy-dry: build
    rsync -avzn --delete dist/ "{{ env('DEPLOY_HOST') }}:{{ env('DEPLOY_PATH') }}/"
