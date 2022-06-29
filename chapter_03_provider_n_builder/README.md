# Chapter 03 - BlocProvider and BlocBuilder

## Index

#### 1. [BlocProvider](#1-what-is-blocprovider)
#### 2. [BlocBuilder](#2-what-is-blocbuilder)
#### 3. [UI, Logic and Data](#3-ui-logic-and-data-1)

## 1. What is **`BlocProvider`**?

- BlocProvider provides an instace of a Bloc to it's children in the Widget tree

- Any widget that belongs in that part of Widget tree can access that same instance by using,

    **`BlocProvider.of<Bloc>(context)`**

- Though, that particular instance can only be accesed within the same screen/page
- **`BlocProvider.value`** is used to pass that same instance to another screen while navigating, we'll cover it in next chapter

##### [Go back to Index](#index)

## 2. What is **`BlocBuilder`**?

- BlocBuilder is used to build a widget state is changed (when Bloc emits a state), just like StreamBuilder

- Different widgets can be displayed depending upon the state. For example,

    - Loading indicator on **`LoadingState`**
    - User data on **`LoadedState`**
    - Error message on **`ErrorState`**

##### [Go back to Index](#index)

## 3. **UI, Logic and Data**

- When the application becomes complex, it is easy to mix up UI with Logic or Data, which can mess up the entire flow of the app

- Bloc comes with an advantage of separating the UI from Logic and Data. With Bloc, each Event emits a corresponding State.

- For example, if you're using variables to control whether a loading indicator shoud be displayed or not, you may forget to change it's value and your user can get confused. Instead with Bloc, you can simply emit a **`LoadingState`**

    ```
    UI -> Event -> Bloc -> Data Source
                                |
                                v
    UI <- State <- Bloc <- Data / Model
    ```
