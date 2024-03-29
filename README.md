# Pokemon Stay 
This is the Rails API for Pokemon Stay, a React web game.

Explore Online: <https://pokemon-stay.netlify.app/>  

If you would like to explore the app without creating an account, please feel free to use the following credentials to login:

```txt
Username: Trainer
Password: abc123
```

## Language and Tools

### [React](https://github.com/HyeokJungKim/Pokemon-Frontend)
- [React-Router](https://reactrouter.com/) - [Example](https://github.com/HyeokJungKim/Pokemon-Frontend/blob/master/src/App.js#L40)
- [Semantic UI React](https://react.semantic-ui.com/) - [Example](https://github.com/HyeokJungKim/Pokemon-Frontend/blob/master/src/Containers/HomeContainer.js#L4)
- [React Beautiful DND](https://github.com/atlassian/react-beautiful-dnd) - [Example](https://github.com/HyeokJungKim/Pokemon-Frontend/blob/master/src/Containers/TeamContainer.js#L54)
- [Redux](https://redux.js.org/) - [Example](https://github.com/HyeokJungKim/Pokemon-Frontend/blob/master/src/index.js#L18)
- [Redux-Thunk](https://github.com/reduxjs/redux-thunk) - [Example](https://github.com/HyeokJungKim/Pokemon-Frontend/blob/master/src/Redux/Actions.js#L5)

### Rails API
- [Redis](https://github.com/redis-store/redis-rails) - [Example](https://github.com/HyeokJungKim/Pokemon-Backend/blob/master/app/controllers/pokemons_controller.rb#L3)
- [JWT](https://jwt.io/) - [Example](https://github.com/HyeokJungKim/Pokemon-Backend/blob/master/app/controllers/application_controller.rb#L10)
- [Fast JSONAPI](https://github.com/Netflix/fast_jsonapi) - [Example](https://github.com/HyeokJungKim/Pokemon-Backend/blob/master/app/serializers/trainer_serializer.rb#L1)
- [Postgres](https://www.postgresql.org/) - [Example](https://github.com/HyeokJungKim/Pokemon-Backend/blob/master/config/database.yml#L18)

## About
Enter the exciting world of Pokemon through this React+Redux application. See all of the first 150 Pokemons as you explore the map using the WASD keys!

![Map](https://i.imgur.com/sE6LBmU.png)

Gather money and experience as you battle or catch Pokemon to buy items from the PokeMart and evolve your team.

![Battle](https://i.imgur.com/QC012q5.png)
![Shop](https://i.imgur.com/z1VesC9.png)

Organize your box and your team to strategically figure out how to level up your team.

![Team](https://i.imgur.com/Lyg2U5M.gif)

## Setup
1. Make sure that `rvm` is installed on your local machine.

```
curl -sSL https://get.rvm.io | bash
rvm install 2.6.6
rvm use 2.6.6
```

2. Clone down the project and install the dependencies.

```
 git clone git@github.com:HyeokJungKim/Pokemon-Backend.git
 cd Pokemon-Backend
```

3. Download the dependencies and set up the database.
```
bundle install
rails db:create
rails db:setup
```

4. Create an .ENV file in the root directory.
```
PASSWORD=<PASSWORD FOR JWT>
REDISTOGO_URL=<URL FOR REDIS TO GO: https://redistogo.com/documentation>
```

5. Change the origins in `./config/initializers/cors.rb` to the appropriate port for the corresponding frontend.

6. Run the server on port 4000.
```
rails s -p 4000
```
