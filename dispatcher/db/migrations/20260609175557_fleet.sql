-- +goose Up
-- +goose StatementBegin
CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE fleet (
    id BIGSERIAL PRIMARY KEY,
    city TEXT NOT NULL,
    country TEXT NOT NULL
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS fleet;
-- +goose StatementEnd
