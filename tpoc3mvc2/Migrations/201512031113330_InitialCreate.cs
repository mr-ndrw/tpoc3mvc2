namespace tpoc3mvc2.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Authors",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Title = c.String(),
                        Content = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Books",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Title = c.String(),
                        Isbn = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Categories",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Reviews",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        AuthorName = c.String(),
                        Title = c.String(),
                        BookId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Books", t => t.BookId, cascadeDelete: true)
                .Index(t => t.BookId);
            
            CreateTable(
                "dbo.__MigrationHistory",
                c => new
                    {
                        MigrationId = c.String(nullable: false, maxLength: 150),
                        ContextKey = c.String(nullable: false, maxLength: 300),
                        Model = c.Binary(nullable: false),
                        ProductVersion = c.String(nullable: false, maxLength: 32),
                    })
                .PrimaryKey(t => new { t.MigrationId, t.ContextKey });
            
            CreateTable(
                "dbo.CategoryBooks",
                c => new
                    {
                        Book_Id = c.Int(nullable: false),
                        Category_Id = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.Book_Id, t.Category_Id })
                .ForeignKey("dbo.Books", t => t.Book_Id, cascadeDelete: true)
                .ForeignKey("dbo.Categories", t => t.Category_Id, cascadeDelete: true)
                .Index(t => t.Book_Id)
                .Index(t => t.Category_Id);
            
            CreateTable(
                "dbo.BookAuthors",
                c => new
                    {
                        Author_Id = c.Int(nullable: false),
                        Book_Id = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.Author_Id, t.Book_Id })
                .ForeignKey("dbo.Authors", t => t.Author_Id, cascadeDelete: true)
                .ForeignKey("dbo.Books", t => t.Book_Id, cascadeDelete: true)
                .Index(t => t.Author_Id)
                .Index(t => t.Book_Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.BookAuthors", "Book_Id", "dbo.Books");
            DropForeignKey("dbo.BookAuthors", "Author_Id", "dbo.Authors");
            DropForeignKey("dbo.Reviews", "BookId", "dbo.Books");
            DropForeignKey("dbo.CategoryBooks", "Category_Id", "dbo.Categories");
            DropForeignKey("dbo.CategoryBooks", "Book_Id", "dbo.Books");
            DropIndex("dbo.BookAuthors", new[] { "Book_Id" });
            DropIndex("dbo.BookAuthors", new[] { "Author_Id" });
            DropIndex("dbo.CategoryBooks", new[] { "Category_Id" });
            DropIndex("dbo.CategoryBooks", new[] { "Book_Id" });
            DropIndex("dbo.Reviews", new[] { "BookId" });
            DropTable("dbo.BookAuthors");
            DropTable("dbo.CategoryBooks");
            DropTable("dbo.__MigrationHistory");
            DropTable("dbo.Reviews");
            DropTable("dbo.Categories");
            DropTable("dbo.Books");
            DropTable("dbo.Authors");
        }
    }
}
