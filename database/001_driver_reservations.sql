CREATE TABLE driver_reservations (
    driver_id TEXT PRIMARY KEY,
    trip_id TEXT NOT NULL UNIQUE,
    assignment_id TEXT NOT NULL UNIQUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
