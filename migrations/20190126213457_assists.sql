-- +goose Up
-- SQL in section 'Up' is executed when this migration is applied

create table if not exists assists (
  id            uuid primary key default gen_random_uuid(),
  talk_id       uuid references talks(id),
  speaker_id       uuid references users(id),
  assistant_id     uuid references users(id),

	created_at      timestamptz default now(),
	updated_at      timestamptz default now(),
	deleted_at      timestamptz
);

create trigger update_assists_updated_at
before update on assists for each row execute procedure update_updated_at_column();
-- +goose Down
-- SQL section 'Down' is executed when this migration is rolled back
drop table if exists assists cascade;


