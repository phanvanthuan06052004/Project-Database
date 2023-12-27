using System;
using System.Collections.Generic;
using LibaryRepository.Entitie;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace LibaryRepository;

public partial class LibaryManagementContext : DbContext
{
    public LibaryManagementContext()
    {
    }
    //HÀM KẾT NỐI DATABASE
    public LibaryManagementContext(DbContextOptions<LibaryManagementContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Book> Books { get; set; }

    public virtual DbSet<BookManagementMember> BookManagementMembers { get; set; }

    public virtual DbSet<BookType> BookTypes { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=localhost;Database=LibaryManagement;Trusted_Connection=true;Encrypt=false");
    //CÁC HÀM TRUY VẤN LINQ
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Book>(entity =>
        {
            entity.ToTable("Book");

            entity.Property(e => e.BookId).ValueGeneratedNever();
            entity.Property(e => e.Author).HasMaxLength(50);
            entity.Property(e => e.BookName).HasMaxLength(100);
            entity.Property(e => e.Description).HasMaxLength(1000);
            entity.Property(e => e.ReleaseDate).HasColumnType("datetime");

            entity.HasOne(d => d.BookCategory).WithMany(p => p.Books)
                .HasForeignKey(d => d.BookCategoryId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Book_BookCategory");
        });

        modelBuilder.Entity<BookManagementMember>(entity =>
        {
            entity.HasKey(e => e.MemberId);

            entity.ToTable("BookManagementMember");

            entity.Property(e => e.MemberId).ValueGeneratedNever();
            entity.Property(e => e.Email).HasMaxLength(50);
            entity.Property(e => e.FullName).HasMaxLength(50);
            entity.Property(e => e.Password).HasMaxLength(50);
        });

        modelBuilder.Entity<BookType>(entity =>
        {
            entity.HasKey(e => e.BookCategoryId).HasName("PK_BookCategory");

            entity.ToTable("BookType");

            entity.Property(e => e.BookCategoryId).ValueGeneratedNever();
            entity.Property(e => e.BookGenreType).HasMaxLength(50);
            entity.Property(e => e.Description).HasMaxLength(500);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
