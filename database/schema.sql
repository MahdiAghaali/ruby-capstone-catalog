CREATE TABLE MusicAlbum(
  id INTEGER GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
  on_spotify BOOLEAN,
  publish_date DATE
);

CREATE TABLE genre(
  id INTEGER GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
  name VARCHAR(255),
  FOREIGN KEY(item_id) REFERENCES items(id)
);

CREATE TABLE [Label](
	[id] [int] GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
	[title] [varchar](50) NULL,
	[color] [varchar](50) NULL,
	[items] [nvarchar](MAX) NULL,
);
