with

source as (

    select * from {{ ref('raw_goodreads_library_export') }}

),

renamed as (

    select
        "Book Id" as id,
        "Title" as title,
        "Author" as author,
        "My Rating" as rating,
        "Average Rating" as avg_rating,
        "Number of Pages" as pages_no,
        TO_DATE("Date Read", 'YY/MM/DD') as date_read,
        TO_DATE("Date Added", 'YY/MM/DD') as date_added,
        "Exclusive Shelf" as exclusive_shelf,
        "Read Count" as read_count
    from source

)

select * from renamed
