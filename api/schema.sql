create table users (
  id text primary key
);

create table thoughts (
  id text primary key,
  user_id text not null references users(id),
  important boolean default false,
  long_term boolean default false,
  body text not null
);
