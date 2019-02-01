-- +goose Up
-- SQL in section 'Up' is executed when this migration is applied

create table if not exists talks (
  id                       uuid primary key default gen_random_uuid(),
  title                    text not null,
  description              text not null,
  repository               text not null,
  attendance_date          timestamptz not null,
  tags                     text default '',
  users_id                 uuid references user (id),


	created_at      timestamptz default now(),
	updated_at      timestamptz default now(),
	deleted_at      timestamptz
)

create trigger update_talks_updated_at
before update on talks for each row execute procedure update_updated_at_column();
-- +goose StatementEnd

-- +goose Down
drop table users cascade;
