## Wishr

Share wishlists with your friends and family. Wishr is a completely free, self-hosted solution. No trackers, no ads, no catches. Simply download and run the docker compose file on a server of your choosing and share the link.

### Features

- Create wishlists with notes, links to buy the item and quantity/price details.
- Share wishlists with anyone else on the app.
- Reserve items on wishlists that have been shared with you. All shared users except the wishlist owner can see your reservation (so they know not to buy that item!).
- Create a registration code so that only intended users can register on your server.

### Getting Started

Minimum requirements for setup are as follows:

- An x86/x64 server (Linux preferred).
- Docker and Docker Compose installed.
- A domain that is pointed to your server.
- (highly recommended) A proxy/web server that handles SSL and sits in front of the frontend.

After the above steps have been implemented, simply clone this repository with:

`git clone https://github.com/00Duck/wishr.git`

Modify the following values with your own in the docker-compose.yml:

```yml
...
environment:
  - MYSQL_DATABASE=wishr
  - MYSQL_USER=wishr
  - MYSQL_PASSWORD=wishr
  - MYSQL_ROOT_PASSWORD=super secret password

...
environment:
  - DB_USER=wishr
  - DB_PASSWORD=wishr
  - DB_DATABASE=wishr
  - DB_HOST=wishr-db
  
...
- REGISTRATION_CODE=some-super-secret-arbitrary-values-go-here
```

Make sure that the registration code you choose here is fairly long. This is the code that you will need to share with anyone you would like to have join your server. This is done so that random individuals or bots cannot register and join your server.

You may also want to make sure you are using the latest version of the web and api services. Check out https://hub.docker.com/search?q=00duck for the latest image versions.

### Repositories

Frontend: https://github.com/00Duck/wishr-web

Backend/API: https://github.com/00Duck/wishr-api
