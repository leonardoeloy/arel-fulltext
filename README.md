# Arel Full-Text Search Support [![Build Status](https://secure.travis-ci.org/leonardoeloy/arel-fulltext.svg?branch=master)](http://travis-ci.org/leonardoeloy/arel-fulltext) [![Dependency Status](https://gemnasium.com/leonardoeloy/arel-fulltext.svg)](https://gemnasium.com/leonardoeloy/arel-fulltext)

Adds 'native' full-text search support to Arel.

## Usage

In order to produce this query (MySQL Full-Text syntax):

```sql
SELECT * FROM people
WHERE MATCH (name) AGAINST ('expression')
```

You could use this Arel construct:

```ruby
people = Arel::Table.new(:people)
expr = people[:name].match('expression')
```

## MySQL

Arel Full-Text only supports MySQL currently. Open an issue if you wish to add support to a different database.  

### Search Modifiers

You can also include search modifiers to further optimize your query.

#### Boolean Mode

```ruby
people = Arel::Table.new(:people)
expr = people[:name].match('expression', boolean_mode: true)
```

Will result in:

```sql
SELECT * FROM people
WHERE MATCH (name) AGAINST ('expression' IN BOOLEAN MODE)
```

#### Query Expansion

```ruby
people = Arel::Table.new(:people)
expr = people[:name].match('expression', query_expansion: true)
```

Will result in:

```sql
SELECT * FROM people
WHERE MATCH (name) AGAINST ('expression' WITH QUERY EXPANSION)
```

### Adding Full-Text Index to MySQL

```sql
CREATE FULLTEXT INDEX index_id ON table (column);
```

## License

(Arel MySQL Full-Text)[https://github.com/leonardoeloy/arel-mysql-fulltext] is released under a MIT License.

Portions of this software are licensed from (Arel)[https://github.com/rails/arel/], copyrighted 2007-2010 to Nick Kallen, Bryan Helmkamp, Emilio Tagua, Aaron Patterson.


