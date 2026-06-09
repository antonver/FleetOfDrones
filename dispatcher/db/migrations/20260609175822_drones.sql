-- +goose Up
-- +goose StatementBegin
CREATE TABLE drones (
    id BIGSERIAL PRIMARY KEY,
    version DOUBLE PRECISION NOT NULL,
    model TEXT NOT NULL,
    location GEOGRAPHY(PointZ, 4326) NOT NULL,
    is_available BOOLEAN NOT NULL DEFAULT TRUE
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS drones;
-- +goose StatementEnd
