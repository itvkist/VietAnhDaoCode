Open [http://iai.uet.vnu.edu.vn:8055/](http://iai.uet.vnu.edu.vn:8055/) to view it in the browser.


require [Node.js](https://nodejs.dev) v12.20 and above

run
```
npm install
npx directus start
```

login account

admin@directus.com/123

create user

dev@gmail.com/123

fix upload img:
`docker-compose exec -u root directus chown -R node:node /directus/database /directus/extensions /directus/uploads`

screenshot:
`docker-compose exec -u root directus npx directus schema snapshot --yes ./schema.yaml`