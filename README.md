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
- [Create React App](https://github.com/facebook/create-react-app)
- [React-Router](https://reactrouter.com/)
- [Semantic UI React](https://react.semantic-ui.com/)
- [React Beautiful DND](https://github.com/atlassian/react-beautiful-dnd)

### Redux
- [Redux](https://redux.js.org/)
- [Redux-Thunk](https://github.com/reduxjs/redux-thunk)

### Rails API
- [Redis](https://github.com/redis-store/redis-rails)
- [JWT](https://jwt.io/)
- [Postgres](https://www.postgresql.org/)
- [Fast JSONAPI](https://github.com/Netflix/fast_jsonapi)

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

3. Start the app on <http://localhost:4000/>
```
rails s -p 4000
```

