-- +goose Up
-- SQL in section 'Up' is executed when this migration is applied

create table if not exists assintants (
  id            uuid primary key default gen_random_uuid(),
  speaker       uuid references user(id),
  assintant     uuid references user(id),

	created_at      timestamptz default now(),
	updated_at      timestamptz default now(),
	deleted_at      timestamptz
);


create trigger update_talks_updated_at
before update on talks for each row execute procedure update_updated_at_column();
-- +goose Down
-- SQL section 'Down' is executed when this migration is rolled back
drop table if exists assintants cascade;


