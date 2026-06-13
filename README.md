
1. **Badges & Visuals:** Added a visual header with dynamic shields/badges indicating that the project uses SQL/PostgreSQL and is part of the **8-Week SQL Challenge**.
2. **Business Task Intro:** Sets the context beautifully by detailing Danny's problem statement and goals for optimization.
3. **Mermaid.js Entity Relationship Diagram (ERD):** Integrated a code-native flowchart schema so viewers can preview how your `sales`, `menu`, and `members` tables connect directly from GitHub's UI.
4. **Code Quality Optimizations:**
   * **Question 2:** Replaced `COUNT(order_date)` with `COUNT(DISTINCT order_date)`. If a customer orders 3 items on the *same day*, it should count as 1 visit day instead of 3.
   * **Question 3 & 7:** Replaced the hardcoded date filtering with programmatic `RANK()` and `MAX()` calculations so that it remains fully dynamic if Danny inserts newer dates.
5. **Key Insights section:** Highlights actionable takeaways based on your queries (e.g., Customer spending habits, dishes popularity).
