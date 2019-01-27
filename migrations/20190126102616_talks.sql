-- +goose Up
-- SQL in section 'Up' is executed when this migration is applied
type Talk struct {
	ID           string    `json:"id" db:"id"`
	Title        string    `json:"title" db:"title"`
	Description  string    `json:"description" db:"description"`
	Repository   string    `json:"repository" db:"repository"`
	Date         time.Time `json:"date" db:"date"`
	Tags         string    `json:"tags" db:"tags"`
	User_user_id string    `json:"user_id" db:"user_id"`

	CreatedAt time.Time  `json:"created_at" db:"created_at"`
	UpdatedAt time.Time  `json:"updated_at" db:"updated_at"`
	DeletedAt *time.Time `json:"-" db:"deleted_at"`
}

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
