# University Class Timetable Generator

A university class timetable generator specific for block sectioning using genetic algorithm and flutter.

## Generator Flow

```mermaid
flowchart TD
    1(START) --> 2(Initialize Population)
    2 --> 3(Evaluate)
    3 --> 4(Select)
    4 --> 5(Crossover)
    5 --> 6(Mutate)
    6 --> 7{Termination Condition met?}
    7 --> |No| 3
    7 --> |Yes| 8(END)
```