with


books_read as (

    select * from {{ ref('int_media_books_read_by_year') }}

),

pages_by_year as (

    select * from {{ ref('int_media_books_pages_by_year') }}

),


avg_rating as (

    select * from {{ ref('int_media_books_avg_rating_by_year') }}

),


films_insights as (

    select 
        books_read.year,
        books_read.books_read,
        avg_rating.my_avg_rating,
        avg_rating.avg_rating,
        pages_by_year.total_pages,
        pages_by_year.avg_pages
    from books_read
    left join avg_rating on books_read.year = avg_rating.year
    left join pages_by_year on books_read.year = pages_by_year.year
    order by "year" DESC
)

select * from films_insights