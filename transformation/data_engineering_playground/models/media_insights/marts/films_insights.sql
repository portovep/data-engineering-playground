with


films_watched as (

    select * from {{ ref('int_media_films_watched_by_year') }}

),

cinema_watched as (

    select * from {{ ref('int_media_films_cinema_by_year') }}

),

rewatched as (

    select * from {{ ref('int_media_films_rewatched_by_year') }}

),

avg_rating as (

    select * from {{ ref('int_media_films_avg_rating_by_year') }}

),


films_insights as (

    select 
        films_watched.year,
        films_watched.watched as watched,
        coalesce(watched_at_cinema, 0) as watched_at_cinema,
        coalesce(rewatched, 0) as rewatched,
        avg_rating
    from films_watched
    left join avg_rating on films_watched.year = avg_rating.year
    left join cinema_watched on films_watched.year = cinema_watched.year
    left join rewatched on films_watched.year = rewatched.year
)

select * from films_insights