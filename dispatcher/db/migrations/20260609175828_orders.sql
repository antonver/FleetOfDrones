-- +goose Up
-- +goose StatementBegin
CREATE TYPE order_type AS ENUM ('food', 'notfood');

CREATE TYPE order_status AS ENUM (
    'Delivered',
    'Pending',
    'is_being_delivered',
    'Canceled'
);

CREATE TABLE orders (
    id BIGSERIAL PRIMARY KEY,
    kg DOUBLE PRECISION NOT NULL,
    model TEXT NOT NULL,
    type order_type NOT NULL,
    final_point GEOGRAPHY(PointZ, 4326) NOT NULL,
    orders_time TIMESTAMPTZ NOT NULL,
    status order_status NOT NULL DEFAULT 'Pending',
    fleet BIGINT NOT NULL REFERENCES fleet (id)
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS orders;
DROP TYPE IF EXISTS order_status;
DROP TYPE IF EXISTS order_type;
-- +goose StatementEnd
