-- +goose Up
-- +goose StatementBegin
create table users (
	id              uuid primary key default gen_random_uuid(),
	email           text not null unique,
	full_name       text not null,

	created_at      timestamptz default now(),
	updated_at      timestamptz default now(),
	deleted_at      timestamptz
);

create trigger update_users_updated_at
before update on users for each row execute procedure update_updated_at_column();
-- +goose StatementEnd

-- +goose Down
drop table users cascade;

