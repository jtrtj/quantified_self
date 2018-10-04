# Quantified Self  

 [![Build Status](https://travis-ci.org/jtrtj/quantified_self.svg?branch=master)](https://travis-ci.org/jtrtj/quantified_self)

This Rails API provides endpoints for a calorie tracking app.

A user of the api can keep track of what foods were eaten with each meal throughout the day.

Quantified Self is deployed [Here](https://jtrtj-quantified-self.herokuapp.com)

---

If you would like to fork and clone to check out the code:
1. fork this repo
2. clone it down
3. open the directory
4. $ `bundle update`
5. $ `rails db:{create,migrate,seed}`
6. $ `rspec` to checkout the test suite
7. $ `rails s` to run the API on your local machine @ `http://localhost:3000`


*special note:* while working on this project, I attempted to do two things:
1. Serialize all of the data myself with service classes that resemble presenters or facades.
2. Try to keep ActiveRecord away from the controllers.
This led to some experiments that may not be the most *dry* ruby code.

---

This app uses Ruby 2.4.1 and Rails 5.1.6

---


## See a list of the endpoints and their returns below:

### Food endpoints

> __GET /api/v1/foods__
> 
> Returns all foods in the database.

```json
[
    {
        "id": 1,
        "name": "Teriyaki Chicken Donburi",
        "calories": 523
    },
    {
        "id": 2,
        "name": "Tuna Sashimi",
        "calories": 195
    },
    {
        "id": 3,
        "name": "Vegetable Soup",
        "calories": 188
    }
]
```
> __GET /api/v1/foods/:id__
>
> Returns a single food
```json
{
    "id": 35,
    "name": "Mushroom Risotto",
    "calories": 740
}
```
> __POST /api/v1/foods__
> 
> add a new food to the database with json paramaters formatted like this (name and calories are required fields):
>
> `{ "food": { "name": "Flamin' Hot Cheetos", "calories": "450"} }`
>
> Returns a json object with the new foods data

```json
{
    "id": 61,
    "name": "Flamin' Hot Cheetos",
    "calories": 450
}
```
> __PATCH /api/v1/foods/:id__
>
> update a food in the database with an existing food id and json parameters formatted like this (name and calories are required fields):
>
> `{ "food": { "name": "XXXTra Flamin' Hot Cheetos", "calories": "450"} }`
>
> Returns a json object with the updated foods data

```json
{
    "id": 61,
    "name": "XXXTra Flamin' Hot Cheetos",
    "calories": 450
}
```
> __DELETE /api/v1/foods/:id__
>
> will delete the food at the id provided
>
> Returns `status: 204`

### Meal endpoints

> GET /api/v1/meals
>
> Returns all the meals in the database along with their associated foods

```json
[
    {
        "id": 1,
        "name": "Breakfast",
        "foods": [
            {
                "id": 12,
                "name": "Pork Belly Buns",
                "calories": 706
            },
            {
                "id": 19,
                "name": "Chicken Milanese",
                "calories": 167
            },
            {
                "id": 23,
                "name": "Caesar Salad",
                "calories": 797
            }
        ]
    },
    {
        "id": 2,
        "name": "Lunch",
        "foods": [
            {
                "id": 8,
                "name": "Risotto with Seafood",
                "calories": 769
            },
            {
                "id": 23,
                "name": "Caesar Salad",
                "calories": 797
            },
            {
                "id": 24,
                "name": "Pasta Carbonara",
                "calories": 237
            },
            {
                "id": 36,
                "name": "Linguine with Clams",
                "calories": 732
            },
            {
                "id": 59,
                "name": "Katsu Curry",
                "calories": 985
            }
        ]
    },
    {
        "id": 3,
        "name": "Dinner",
        "foods": [
            {
                "id": 9,
                "name": "Tuna Sashimi",
                "calories": 348
            },
            {
                "id": 28,
                "name": "Fettuccine Alfredo",
                "calories": 813
            },
            {
                "id": 30,
                "name": "Risotto with Seafood",
                "calories": 697
            },
            {
                "id": 40,
                "name": "Salmon Nigiri",
                "calories": 937
            },
            {
                "id": 41,
                "name": "Chicken Fajitas",
                "calories": 138
            },
            {
                "id": 59,
                "name": "Katsu Curry",
                "calories": 985
            }
        ]
    }
]
```