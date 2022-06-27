# Chapter 02 - Bloc

## Index

#### 1. [Bloc](#1-what-is-bloc)

## 1. What is **`Bloc`**?

- Bloc takes a stream of events as input and produces a stream of states as output
- When an event is added to Bloc it is expected to emit a corresponding state
- For example, series of events happen inside an app,

    1. A user presses the search button and that adds **`GetDataEvent`** to the Bloc

    2. The Bloc emits **`LoadingState`** and the app shows a loading indicator

    3. Data is fetched successfully and the Bloc emits **`LoadedState`**

##### [Go back to Index](#index)
