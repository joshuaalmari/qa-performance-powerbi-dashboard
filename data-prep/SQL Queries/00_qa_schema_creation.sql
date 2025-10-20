CREATE SCHEMA IF NOT EXISTS raw;       -- CSV imports
CREATE SCHEMA IF NOT EXISTS staging;   -- trimmed/typed/normalized
CREATE SCHEMA IF NOT EXISTS refine;    -- joins, derivations
CREATE SCHEMA IF NOT EXISTS mart;      -- final tables for BI
CREATE SCHEMA IF NOT EXISTS ref;       -- reference/mapping (e.g., role_to_process)
