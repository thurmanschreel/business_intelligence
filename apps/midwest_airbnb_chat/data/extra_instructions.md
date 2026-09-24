# Extra Instructions

Rules the LLM follows when it writes SQL for `listings`.

- `price` is the nightly price in U.S. dollars. When the user asks what something costs, use `price` and round money to whole dollars in the answer.
- `host_is_superhost` and `instant_bookable` are stored as text values `'t'` and `'f'`, not booleans. Use these values when filtering on Superhost status or instant booking.
- When searching for a city, neighbourhood, or listing name, match the text values case-insensitively when appropriate.


