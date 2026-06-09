-- +goose Up
-- +goose StatementBegin
CREATE TABLE drone_models (
    id BIGSERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    battery INT NOT NULL,
    max_mass DOUBLE PRECISION NOT NULL
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS drone_models;
-- +goose StatementEnd
