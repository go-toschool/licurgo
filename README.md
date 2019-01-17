# licurgo
Licurgo is a legislation orchestrator. This repo contains the tables definitions.

To run this migrations we need to install [goose](https://github.com/steinbacher/goose), to do this, copy and paste the following line in your terminal:

```
$ go get -tags nosqlite3 github.com/steinbacher/goose/cmd/goose
```

Then run the following to apply the changes:

```
$ goose -path . -env [development|docker|kubernetes] up
```

### development

If you are not using docker or kubernetes, create a new database in your system with:

```
$ createdbd drachma
```

then run the corresponding migrations.

r.

### creating a new migration

If you want to create a new migration, run the following command:

```
$ goose create [migration-name]
```

This creates a new file with the following content:

```
-- +goose Up
-- SQL in section 'Up' is executed when this migration is applied


-- +goose Down
-- SQL section 'Down' is executed when this migration is rolled back
```

where you can write your migration.



