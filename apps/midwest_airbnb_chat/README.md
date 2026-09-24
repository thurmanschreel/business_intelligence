# ISA 401 Job Scout Chat

**Ask a question in plain English, get the SQL and a table back**

A twelve-line [querychat](https://github.com/posit-dev/querychat) app built in ISA 401 (Miami University) on the job postings that [ChatISA](https://chatisa.fsb.miamioh.edu) Job Scout collected. It is the starting point for Assignment 05, where you rebuild it on the Airbnb data, deploy it to [Render](https://render.com) from your GitHub repository, and then improve it.

**Live app:** https://midwest-airbnb-chat-hw59.onrender.com

---

## What is this app?

The app connects to a SQLite database (`data/midwest_airbnb.db`), hands the `scout_postings` table to querychat, and lets an LLM translate your question into SQL. Every answer shows the query it ran, so you can check the logic and reuse the SQL yourself.

**Test queries:**
- "Which Columbus neighbourhood has the priciest entire homes?"
<img width="466" height="405" alt="Screenshot 2026-09-24 122315" src="https://github.com/user-attachments/assets/a56f579e-4c5c-4607-8339-f9163d1ae7e9" />

- "Do superhosts charge more per night than other hosts? Show it as a bar chart."
<img width="458" height="356" alt="Screenshot 2026-09-24 122553" src="https://github.com/user-attachments/assets/378bdd46-c73e-4e25-abd4-f1314a88fe48" />

- "How many listings could host a party of ten?"
<img width="440" height="242" alt="Screenshot 2026-09-24 122649" src="https://github.com/user-attachments/assets/091adad4-d996-4367-b736-c228801a82a3" />

