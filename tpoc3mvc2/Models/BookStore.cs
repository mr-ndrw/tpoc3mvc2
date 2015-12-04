namespace tpoc3mvc2.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class BookStore : DbContext
    {
        public BookStore()
            : base("name=BookStore")
        {
        }

        public virtual DbSet<C__MigrationHistory> C__MigrationHistory { get; set; }
        public virtual DbSet<Authors> Authors { get; set; }
        public virtual DbSet<Books> Books { get; set; }
        public virtual DbSet<Categories> Categories { get; set; }
        public virtual DbSet<Reviews> Reviews { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Authors>()
                .HasMany(e => e.Books)
                .WithMany(e => e.Authors)
                .Map(m => m.ToTable("BookAuthors").MapLeftKey("Author_Id").MapRightKey("Book_Id"));

            modelBuilder.Entity<Books>()
                .HasMany(e => e.Reviews)
                .WithRequired(e => e.Books)
                .HasForeignKey(e => e.BookId);

            modelBuilder.Entity<Books>()
                .HasMany(e => e.Categories)
                .WithMany(e => e.Books)
                .Map(m => m.ToTable("CategoryBooks").MapLeftKey("Book_Id").MapRightKey("Category_Id"));
        }
    }
}
