# Chapter 03 - BlocProvider and BlocBuilder

## Index

#### 1. [BlocProvider](#1-what-is-state)
#### 2. [BlocBuilder](#2-what-is-a-cubit)
#### 3. [UI, Logic and Presentation](#2-what-is-a-cubit)

## 1. What is **`State`**?

- A state is just a collection of values at a moment in time
- For example, temperature of a room at a given time can be represented as a state,

    - **`NormalState`** : When temperature is 24°C
    - **`ColdState`** : When temperature is below 24°C
    - **`HotState`** : When temperature is above 24°C

##### [Go back to Index](#index)

## 2. What is a **`Cubit`**?

- Cubit holds a state of an object of a given type
- When a function is called, the Cubit emits a state which can be,

    - Accessed via state getter
    - Listened to via a Stream

##### [Go back to Index](#index)
