using System;
using System.Collections.Generic;

namespace LibaryRepository.Entitie;

public partial class Book
{
    public int BookId { get; set; }

    public string BookName { get; set; } = null!;

    public string Description { get; set; } = null!;

    public DateTime ReleaseDate { get; set; }

    public int Quantity { get; set; }

    public double Price { get; set; }

    public int BookCategoryId { get; set; }

    public string Author { get; set; } = null!;

    public virtual BookType BookCategory { get; set; } = null!;
}
